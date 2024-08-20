---
title: Services Installation
description: 
published: true
date: 2024-08-20T18:17:06.314Z
tags: 
editor: markdown
dateCreated: 2024-08-20T18:15:39.844Z
---

Just run this one line to get started with the install. The script will install everything everything as service on the seed box. 
You can view the script before running it here: https://github.com/pvd-nerd/ARR-Suite/blob/main/scripts/services-install.sh

```
wget -qO- https://raw.githubusercontent.com/pvd-nerd/ARR-Suite/main/services-install.sh | sudo bash
```

If the script is successful with installing and starting all services you will see this at the end. WebGUI will be available on the default ports and can be accessed via the Desktop or another computer on the local network.

```
Prowlarr is running
Radarr is running
Sonarr is running
Unpackerr is running
qBittorrent is running
```

