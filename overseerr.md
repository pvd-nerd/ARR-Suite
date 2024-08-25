---
title: Overseerr
description: 
published: true
date: 2024-08-25T03:28:31.836Z
tags: 
editor: markdown
dateCreated: 2024-08-25T03:28:31.836Z
---

# Content
1. Docker Install
2. Setup Container
3. Configuration
4. Setup NginX Proxy Manager (NPM)

> If you already have a Docker host or swarm set up for public access I would recommend using that to deploy the containers instead. Docker for Windows has limitations 
{.is-warning}

# Docker Install

Download and install Docker for Windows: https://docs.docker.com/desktop/install/windows-install/

>Make sure to check "Use WSL 2 instead of Hyper-V" when installing Docker.
{.is-info}

Close installer and reboot the Windows server. Reconnect via RDP once it is back online. The Docker GUI should auto launch once you login. 



