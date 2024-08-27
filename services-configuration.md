---
title: Services Configuration
description: 
published: true
date: 2024-08-27T04:31:06.860Z
tags: 
editor: markdown
dateCreated: 2024-08-23T02:50:27.528Z
---

# Content
1. qBittorrent
2. Sonarr
3. Radarr
4. Prowlarr
5. Unpackerr

---

# qBittorrent
> Update the default password after inital login. Go to: Tools > Options > Web UI > Authentication
{.is-warning}

Launch a browser on the Ubuntu host or a remote host on the network and go to http://IPADDR:8080. Login with the default username **admin** and password **adminadmin**. Once logged in go to Tools > Option from the top bar. In the tab Downloads change the saving management section to match the screenshot. Save the settings at the bottom when done.

![config-1.png](/assets/seedbox/bittorrent/config-1.png)

On the right hand ride of the GUI right click the All categories and click add category. Name it movies and make the mount point /mnt/media/downloads/movies then save. Add another one for shows.

![config-2.png](/assets/seedbox/bittorrent/config-2.png) ![config-3.png](/assets/seedbox/bittorrent/config-3.png) ![config-4.png](/assets/seedbox/bittorrent/config-4.png)


# Sonarr
Launch a browser on the Ubuntu host or a remote host on the network and go to http://IPADDR:8989. Sonarr will require you to set a username and password during the inital login. 

![config-1.png](/assets/seedbox/sonarr/config-1.png)

## Download Client
Navigate to Settings > Download Clients. Click the plus sign and select qBittorrent. Fill out the settings to match, make sure to set the category.

![config-2.png](/assets/seedbox/sonarr/config-2.png)

## Media Managment
Navigate to Settings > Media Management. Fill out all the settings to match the screenshots.

![config-3.png](/assets/seedbox/sonarr/config-3.png)

![config-4.png](/assets/seedbox/sonarr/config-4.png)

![config-5.png](/assets/seedbox/sonarr/config-5.png)


# Radarr
Launch a browser on the Ubuntu host or a remote host on the network and go to http://IPADDR:7979. Radarr will require you to set a username and password during the inital login.

![config-1.png](/assets/seedbox/radarr/config-1.png)

## Download Client
Navigate to Settings > Download Clients. Click the plus sign and select qBittorrent. Fill out the settings to match, make sure to set the category.

![config-2.png](/assets/seedbox/radarr/config-2.png)

## Media Management
Navigate to Settings > Media Management. Fill out all the settings to match the screenshots.

![config-3.png](/assets/seedbox/radarr/config-3.png)

![config-4.png](/assets/seedbox/radarr/config-4.png)

![config-5.png](/assets/seedbox/radarr/config-5.png)


# Prowlarr
Launch a browser on the Ubuntu host or a remote host on the network and go to http://IPADDR:9696. Prowlarr will require you to set a username and password during the inital login.



# Unpackerr

