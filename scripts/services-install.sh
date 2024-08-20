#!/bin/bash

set -euo pipefail

# Am I root?, need root!
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit
fi

echo "Creating Users and added Users to groups..."

# Create User / Group as needed
addgroup media > /dev/null
adduser --system --no-create-home --shell /bin/false --ingroup media prowlarr > /dev/null
adduser --system --no-create-home --shell /bin/false --ingroup media sonarr > /dev/null
adduser --system --no-create-home --shell /bin/false --ingroup media radarr > /dev/null
adduser --system --no-create-home --shell /bin/false --ingroup media unpackerr > /dev/null
adduser --system  --shell /bin/false --ingroup media qbituser > /dev/null
#

echo "Created Users and added Users to groups!"
echo "Creating app directories..."

# Create Appdata Directory
mkdir -p /var/lib/prowlarr
chown -R prowlarr:media /var/lib/prowlarr
chmod 775 /var/lib/prowlarr
mkdir -p /var/lib/radarr
chown -R radarr:media /var/lib/radarr
chmod 775 /var/lib/radarr
mkdir -p /var/lib/sonarr
chown -R sonarr:media /var/lib/sonarr
chmod 775 /var/lib/sonarr
#

echo "App Directories created!"
echo "Downloading and installing pre-requisite Packages..."

# Download the App
add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable > /dev/null
apt update > /dev/null 
apt install -y curl sqlite3 wget qbittorrent-nox > /dev/null
wget -q --content-disposition 'http://prowlarr.servarr.com/v1/update/master/updatefile?os=linux&runtime=netcore&arch=x64'
tar -xzf Prowlarr*.linux*.tar.gz
wget -q --content-disposition 'http://radarr.servarr.com/v1/update/master/updatefile?os=linux&runtime=netcore&arch=x64'
tar -xzf Radarr*.linux*.tar.gz
wget -q --content-disposition 'https://services.sonarr.tv/v1/download/main/latest?version=4&os=linux'
tar -xzf Sonarr*.linux*.tar.gz
wget -q --content-disposition 'https://github.com/Unpackerr/unpackerr/releases/download/v0.14.5/unpackerr.amd64.linux.gz'
gunzip unpackerr*.amd64*.gz
#

echo "Installation files downloaded and extracted!"
echo "Installing Apps..."

# Install the App
mv Prowlarr /opt/
chown -R prowlarr:media /opt/Prowlarr
chmod 775 /opt/Prowlarr
rm -rf Prowlarr*.linux*.tar.gz
mv Radarr /opt/
chown -R radarr:media /opt/Radarr
chmod 775 /opt/Radarr
rm -rf Radarr*.linux*.tar.gz
mv Sonarr /opt/
chown -R sonarr:media /opt/Sonarr
chmod 775 /opt/Sonarr
rm -rf Sonarr*.linux*.tar.gz
mkdir /opt/Unpackerr
mv unpackerr* /opt/Unpackerr/Unpackerr
wget -q 'https://raw.githubusercontent.com/Unpackerr/unpackerr/main/examples/unpackerr.conf.example'
mv unpackerr* /opt/Unpackerr/unpackerr.conf
chown -R unpackerr:media /opt/Unpackerr
chmod 775 /opt/Unpackerr
chmod +x /opt/Unpackerr/Unpackerr
#

echo "App Installed!"
echo "Creating service files..."

# Configure Autostart
cat << EOF | tee /etc/systemd/system/prowlarr.service > /dev/null
[Unit]
Description=Prowlarr Daemon
After=syslog.target network.target

[Service]
User=prowlarr
Group=media
Type=simple
ExecStart=/opt/Prowlarr/Prowlarr -nobrowser -data=/var/lib/prowlarr/
TimeoutStopSec=20
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
###
cat << EOF | sudo tee /etc/systemd/system/radarr.service > /dev/null
[Unit]
Description=Radarr Daemon
After=syslog.target network.target

[Service]
User=radarr
Group=media
Type=simple
ExecStart=/opt/Radarr/Radarr -nobrowser -data=/var/lib/radarr/
TimeoutStopSec=20
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
###
cat << EOF | sudo tee /etc/systemd/system/sonarr.service > /dev/null
[Unit]
Description=Sonarr Daemon
After=syslog.target network.target

[Service]
User=sonarr
Group=media
Type=simple
ExecStart=/opt/Sonarr/Sonarr -nobrowser -data=/var/lib/sonarr/
TimeoutStopSec=20
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
###
cat << EOF | sudo tee /etc/systemd/system/qbittorrent.service > /dev/null
[Unit]
Description=qBittorrent-nox service
Documentation=man:qbittorrent-nox(1)
Wants=network-online.target
After=local-fs.target network-online.target nss-lookup.target

[Service]
Type=simple
User=qbituser
Group=media
ExecStart=/usr/bin/qbittorrent-nox
TimeoutStopSec=1800

[Install]
WantedBy=multi-user.target
EOF
###
cat << EOF | sudo tee /etc/systemd/system/unpackerr.service > /dev/null
[Unit]
Description=Unpackerr Daemon
After=syslog.target network.target

[Service]
User=unpackerr
Group=media
Type=simple
ExecStart=/opt/Unpackerr/Unpackerr -c /opt/Unpackerr/unpackerr.conf
TimeoutStopSec=20
KillMode=process
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
#

echo "Created service files!"
echo "Attempting to start the apps..."

# Start the App
systemctl -q daemon-reload
systemctl enable --now -q prowlarr
systemctl enable --now -q sonarr
systemctl enable --now -q radarr
systemctl enable --now -q qbittorrent
systemctl enable --now -q unpackerr

sleep 15

PSTATUS="$(systemctl is-active "prowlarr")"
if [ "${PSTATUS}" = "active" ]; then
    echo -e "\e[32m Prowlarr is running\e[0m"
else
    echo "\e[31mProwlarr failed to start\e[0m"
fi

RSTATUS="$(systemctl is-active "radarr")"
if [ "${RSTATUS}" = "active" ]; then
    echo -e "\e[32m Radarr is running\e[0m"
else
    echo "\e[31mRadarr failed to start\e[0m"
fi

SSTATUS="$(systemctl is-active "sonarr")"
if [ "${SSTATUS}" = "active" ]; then
    echo -e "\e[32m Sonarr is running\e[0m"
else
    echo "\e[31m Sonarr failed to start\e[0m"
fi

USTATUS="$(systemctl is-active "unpackerr")"
if [ "${USTATUS}" = "active" ]; then
    echo -e "\e[32m Unpackerr is running\e[0m"
else
    echo "\e[31m Unpackerr failed to start\e[0m"
fi

TSTATUS="$(systemctl is-active "qbittorrent")"
if [ "${TSTATUS}" = "active" ]; then
    echo -e "\e[32m qBittorrent is running\e[0m"
else
    echo "\e[31m qBittorrent failed to start\e[0m"
fi

# Exit
exit 0