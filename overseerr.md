---
title: Overseerr
description: 
published: true
date: 2024-08-25T15:41:38.755Z
tags: 
editor: markdown
dateCreated: 2024-08-25T03:28:31.836Z
---

# Content
1. Basic Setup
2. Overseerr Container
3. Configuration
4. Setup NginX Proxy Manager (NPM)

> If you already have a Docker host or swarm set up for public access I would recommend using that to deploy the containers instead. Docker for Windows has limitations but will work.
{.is-warning}

# Basic Setup
- Make sure the host has a static IP address, DNS servers, and hostname.
- Enable RDP to make your life easier.
- Activate Windows Server. Hope this helps: https://letmegooglethat.com/?q=windows+server+2022+key+github
- Install all Windows Updates and enable auto-updates. Settings > Updates & Security > Windows Update > Advanced Options > Enable “Restart this device as soon as possible when a restart is required to install an update.”

# Overseerr Container

Download and install Docker for Windows: https://docs.docker.com/desktop/install/windows-install/

>Make sure to check "Use WSL 2 instead of Hyper-V" when installing Docker.
{.is-info}

![docker-install-1.png](/assets/overseerr/docker-install-1.png) ![docker-install-2.png](/assets/overseerr/docker-install-2.png) ![docker-install-3.png](/assets/overseerr/docker-install-3.png)

Close installer and reboot the Windows server. Reconnect via RDP once it is back online. The Docker GUI should auto launch once you login. 

## Container Setup 
1. Create a new volume called overseerr.
2. Open terminal at the bottom of the GUI (If you don't see it enable it in the settings). This will pull the compose file and start the container.
```
md overseerr; cd overseerr
wget -o overseerr-compose.yml https://raw.githubusercontent.com/pvd-nerd/ARR-Suite/main/scripts/overseerr-compose.yml
docker-compose -f overseerr-compose.yml up -d
```

![docker-install-4.png](/assets/overseerr/docker-install-4.png) ![docker-install-5.png](/assets/overseerr/docker-install-5.png)


