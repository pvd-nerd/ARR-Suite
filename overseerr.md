---
title: Overseerr
description: 
published: true
date: 2024-08-25T03:48:05.290Z
tags: 
editor: markdown
dateCreated: 2024-08-25T03:28:31.836Z
---

# Content
1. Basic Setup
2. Overseerr Container
3. Configuration
4. Setup NginX Proxy Manager (NPM)

> If you already have a Docker host or swarm set up for public access I would recommend using that to deploy the containers instead. Docker for Windows has limitations 
{.is-warning}

# Basic Setup
- Make sure the host has a static IP address, DNS servers, and hostname.
- Enable RDP to make your life easier.
- Activate Windows Server. Hope this helps: https://letmegooglethat.com/?q=windows+server+2022+key+github
- Install all Windows Updates and enable auto-updates. Settings > Updates & Security > Windows Update > Advanced Options > Enable “Restart this device as soon as possible when a restart is required to install an update.”
- Create a new account for Docker service. Search for “Computer Management” > System Tools > Local Users and Groups > Right-click the “Users” folder. Follow the prompts to create a new account.

# Overseerr Container

Download and install Docker for Windows: https://docs.docker.com/desktop/install/windows-install/

>Make sure to check "Use WSL 2 instead of Hyper-V" when installing Docker.
{.is-info}

Close installer and reboot the Windows server. Reconnect via RDP once it is back online. The Docker GUI should auto launch once you login. 

## Container Setup 
1. Create a new volume called overseerr.



