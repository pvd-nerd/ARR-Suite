---
title: Plex
description: 
published: true
date: 2024-08-25T04:40:32.881Z
tags: 
editor: markdown
dateCreated: 2024-08-23T02:50:23.886Z
---

# Content
1. [Basic Setup](https://arr-wiki.pvdnerd.com/en/plex#basic-setup)
2. Install Plex
3. Configure Plex
4. Tuning

# Basic Setup
1. Make sure the host has a static IP address, DNS servers, and hostname.
2. Enable RDP to make your life easier.
3. Activate Windows Server. Hope this helps: https://letmegooglethat.com/?q=windows+server+2022+key+github
4. Install all Windows Updates and enable auto-updates. Settings > Updates & Security > Windows Update > Advanced Options > Enable “Restart this device as soon as possible when a restart is required to install an update.”
5. Create a new account for Plex service. Search for “Computer Management” > System Tools > Local Users and Groups > Right-click the “Users” folder. Follow the prompts to create a new account.

# Install Plex Service
Download the latest version of Plex Media Server and PmsService and move both installers to the media server.

- https://www.plex.tv/media-server-downloads/
- https://github.com/cjmurph/PmsService/releases/latest

Install Plex Media Server like any other program, you can leave all the default settings and install location. Uncheck “Start Plex” when the installation is done before you click Finish. If not, just stop the service before installing PmsService.

![plex-install-1.png](/assets/plex/plex-install-1.png) ![plex-install-2.png](/assets/plex/plex-install-2.png) ![plex-install-3.png](/assets/plex/plex-install-3.png) ![plex-install-4.png](/assets/plex/plex-install-4.png) ![plex-install-5.png](/assets/plex/plex-install-5.png)

Once Plex is installed launch the PmsService installer. When prompted use the new plex user account you created and test the login. Check "Launch Tray Application" on the last screen. If not, right click the new icon in the task bar and click “Start Plex”.

![pms-install-1.png](/assets/plex/pms-install-1.png) ![pms-install-2.png](/assets/plex/pms-install-2.png) ![pms-install-3.png](/assets/plex/pms-install-3.png)![pms-install-4.png](/assets/plex/pms-install-4.png)

# Configure Plex

# Tuning

