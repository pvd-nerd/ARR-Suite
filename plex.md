---
title: Plex
description: 
published: true
date: 2024-08-25T14:38:09.499Z
tags: 
editor: markdown
dateCreated: 2024-08-23T02:50:23.886Z
---

# Content
1. [Basic Setup](https://arr-wiki.pvdnerd.com/en/plex#basic-setup)
2. [Install Plex Service](https://arr-wiki.pvdnerd.com/en/plex#install-plex-service)
3. [Configure Plex](https://arr-wiki.pvdnerd.com/en/plex#configure-plex)
4. [Tuning](https://arr-wiki.pvdnerd.com/en/plex#tuning)

---

# Basic Setup
1. Make sure the host has a static IP address, DNS servers, and hostname.
2. Enable RDP to make your life easier.
3. Activate Windows Server. Hope this helps: https://letmegooglethat.com/?q=windows+server+2022+key+github
4. Install all Windows Updates and enable auto-updates. Settings > Updates & Security > Windows Update > Advanced Options > Enable “Restart this device as soon as possible when a restart is required to install an update.”
5. Create a new account for Plex service. Search for “Computer Management” > System Tools > Local Users and Groups > Right-click the “Users” folder. Follow the prompts to create a new account.
6. Create a Plex.tv account.

# Install Plex Service
Download the latest version of Plex Media Server and PmsService and move both installers to the media server.

- https://www.plex.tv/media-server-downloads/
- https://github.com/cjmurph/PmsService/releases/latest

Install Plex Media Server like any other program, you can leave all the default settings and install location. Uncheck “Start Plex” when the installation is done before you click Finish. If not, just stop the service before installing PmsService.

![plex-install-1.png](/assets/plex/plex-install-1.png) ![plex-install-2.png](/assets/plex/plex-install-2.png) ![plex-install-3.png](/assets/plex/plex-install-3.png) ![plex-install-4.png](/assets/plex/plex-install-4.png) ![plex-install-5.png](/assets/plex/plex-install-5.png)

Once Plex is installed launch the PmsService installer. When prompted use the new plex user account you created and test the login. Check "Launch Tray Application" on the last screen. If not, right click the new icon in the task bar and click “Start Plex”.

![pms-install-1.png](/assets/plex/pms-install-1.png) ![pms-install-2.png](/assets/plex/pms-install-2.png) ![pms-install-3.png](/assets/plex/pms-install-3.png) ![pms-install-4.png](/assets/plex/pms-install-4.png)

The Plex service is now running on port 32400!

# Configure Plex

Launch a browser and go to the IP address and port of Plex. You'll be greeted by a the Plex login screen. Go ahead and login with your account. Skip the welcome screen and the Plex Pass offer (though I do recommend getting it if you want to use a discrete GPU, we'll get into that later). 

## General
- Just set your preferred server name. This is how it will show up in Plex for you and anyone invited.

![plex-config-1.png](/assets/plex/plex-config-1.png)

## Remote Access
- Enable remote access for the server. It will fail until you set up port forwarding on your firewall/router. This is not required if you just want to have Plex available when you are home. See [Port Forwarding]

![plex-config-2.png](/assets/plex/plex-config-2.png)

## Libary
- Enable "Scan my libary automatically".
- Enable "Scan my libary periodically" and set to 1 hour.
- Set "Generate chaper thumbnails" to scheduled task and when media is added.
- Set "Analyze audio tracks for loudness" to scheduled task and when media is added.

![plex-config-3.png](/assets/plex/plex-config-3.png)

## Libraries

Right click the PmsService tray icon in the task bar and go to "Service Settings". Click "Drive Mappings" and add a new entry from the bottom + button. Enter the UNC path of your server storing the media, can leave the default drive letter of Z.

> The user set to run Plex as a service MUST have access to the UNC path. There is no way to set separate credentials. The drive will not mount correctly if you do not allow access.
{.is-warning}

![plex-config-4.png](/assets/plex/plex-config-4.png) ![plex-config-5.png](/assets/plex/plex-config-5.png)

Save the settings in PmsService and go back to the Plex GUI to add the libraries.

![plex-config-6.png](/assets/plex/plex-config-6.png) ![plex-config-7.png](/assets/plex/plex-config-7.png) ![plex-config-8.png](/assets/plex/plex-config-8.png)

PLACEHOLDER

![plex-config-9.png](/assets/plex/plex-config-9.png) ![plex-config-10.png](/assets/plex/plex-config-10.png) ![plex-config-11.png](/assets/plex/plex-config-11.png)

![plex-config-12.png](/assets/plex/plex-config-12.png)

Plex is configured and ready to start ingesting your media!

# Tuning
> WIP
{.is-danger}
