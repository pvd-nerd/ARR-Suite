---
title: Overseerr
description: 
published: true
date: 2024-08-27T02:37:14.532Z
tags: 
editor: markdown
dateCreated: 2024-08-25T03:28:31.836Z
---

# Content
1. [Basic Setup](https://arr.passthebits.com/en/overseerr#basic-setup)
2. [Docker Setup](https://arr.passthebits.com/en/overseerr#docker-setup)
3. [NginX Proxy Manager (NPM) Configuration](https://arr.passthebits.com/en/overseerr#nginx-proxy-manager-npm-configuration)
4. [Overseerr Configuration](https://arr.passthebits.com/en/overseerr#overseerr-configuration)

> If you already have a Docker host or swarm set up for public access I would recommend using that to deploy the containers instead. Docker for Windows has limitations but will work. 
{.is-warning}


# Basic Setup
- Make sure the host has a static IP address, DNS servers, and hostname.
- Enable RDP to make your life easier.
- Activate Windows Server. Hope this helps: https://letmegooglethat.com/?q=windows+server+2022+key+github
- Install all Windows Updates and enable auto-updates. Settings > Updates & Security > Windows Update > Advanced Options > Enable “Restart this device as soon as possible when a restart is required to install an update.”


# Docker Setup
Download and install Docker for Windows: https://docs.docker.com/desktop/install/windows-install/

>Make sure to check "Use WSL 2 instead of Hyper-V" when installing Docker.
{.is-info}

![docker-install-1.png](/assets/overseerr/docker-install-1.png) ![docker-install-2.png](/assets/overseerr/docker-install-2.png) ![docker-install-3.png](/assets/overseerr/docker-install-3.png)

Close installer and reboot the Windows server. Reconnect via RDP once it is back online. The Docker GUI should auto launch once you login. 


## NginX Proxy Manager Container
Open terminal at the bottom of the GUI (If you don't see it enable it in the settings) and paste in these 3 lines. This will pull the compose file and start the containers.

```
md $HOME/.docker/npm; cd $HOME/.docker/npm
wget -o npm-compose.yml https://raw.githubusercontent.com/pvd-nerd/ARR-Suite/main/scripts/npm-compose.yml
```

> Edit the compose file and change the DB_MYSQL_PASSWORD & MYSQL_ROOT_PASSWORD enviroments before starting the container!
{.is-warning}

```
docker-compose -f npm-compose.yml up -d
```
Output:
```
PS C:\Users\Administrator\.docker\npm> docker-compose -f npm-compose.yml up -d
[+] Running 41/2
 ✔ npm_db Pulled               22.6s 
 ✔ npm_app Pulled              43.2s 
[+] Running 5/5
 ✔ Volume "npm_mysql"        Created      
 ✔ Volume "npm_data"         Created   
 ✔ Volume "npm_letsencrypt"  Created 
 ✔ Container npm_db          Started
 ✔ Container npm_app         Started 
PS C:\Users\Administrator\.docker\npm>
```

## Overseerr Container 
Open terminal at the bottom of the GUI (If you don't see it enable it in the settings) and paste in these 3 lines. This will pull the compose file and start the container.

```
md $HOME/.docker/overseerr; cd $HOME/.docker/overseerr
wget -o overseerr-compose.yml https://raw.githubusercontent.com/pvd-nerd/ARR-Suite/main/scripts/overseerr-compose.yml
docker-compose -f overseerr-compose.yml up -d
```
Output:
```
PS C:\Users\Administrator\.docker\overseerr> docker-compose -f overseerr-compose.yml up -d
[+] Running 9/9
 ✔ overseerr Pulled
   ✔ 520a929036f7 Pull complete 
   ✔ df25a931801a Pull complete 
   ✔ 55741caf1273 Pull complete 
   ✔ 4cb071e35e15 Pull complete
   ✔ d21b91e09596 Pull complete
   ✔ 71452a6b6566 Pull complete
   ✔ dd3b8df251b0 Pull complete
   ✔ ba116e8a4c9c Pull complete
[+] Running 2/2
 ✔ Volume "overseerr"   Created
 ✔ Container overseerr  Started
PS C:\Users\Administrator\.docker\overseerr>
```


# NginX Proxy Manager (NPM) Configuration
Open a browser on the host or a remote host and go to http://IPADDR:81. Login with the default username **admin@example.com** and password **changeme**. You will be prompted to udate the username and password on inital login.

![npm-config-1.png](/assets/overseerr/npm-config-1.png) ![npm-config-2.png](/assets/overseerr/npm-config-2.png)

Navigate to Hosts > Proxy Hosts at the top then, click "Add Proxy Host". Configure the proxy host like the following just change the URL to match your domain. Don't worry about SSL right now, we will come back to it when we make this publicly accessable from the internet. 

![npm-config-3.png](/assets/overseerr/npm-config-3.png)

> You must create a DNS record and point it to this windows server or edit the Hosts file (c:\windows\system32\drivers\etc\hosts.file)
{.is-info}

Overseerr should be available at http://overseerr.example.com from any computer on the network or locally.


# Overseerr Configuration
Open a browser on the host or remote host and go to http://IPADDR:5055. Sign in with your Plex account that owns the media server. 

![overseerr-config-1.png](/assets/overseerr/overseerr-config-1.png)

Select your Plex server from the list (If you don't see it refresh the list). Use the plex.direct hostname and enable SSL. Save Changes to move on.

![overseerr-config-2.png](/assets/overseerr/overseerr-config-2.png)

Select both libraries you previously created (Sync libraries if you do not see them). Press "Start Scan" to make sure it doesn't error out. Continue to next page.

![overseerr-config-3.png](/assets/overseerr/overseerr-config-3.png)

Skip the Radarr and Sonarr settings for now, click Finish Setup.

![overseerr-config-4.png](/assets/overseerr/overseerr-config-4.png)

Go to Settings > General and fill out these two feilds -- the URL you want to use to access Overseerr and enable reverse proxy support. Click Save Changes at the bottom then go to the Docker GUI and restart the service. 