---
title: Prerequisites
description: 
published: true
date: 2024-08-27T02:32:59.283Z
tags: 
editor: markdown
dateCreated: 2024-08-23T02:50:25.667Z
---

A couple of topics are not covered in this wiki and must be completed beforehand, there are no plans just because of the vastly different deployment options, such as hardware and storage. This should run on anything from a Raspberry Pi, a dedicated host, or a fully built-out lab once you have all this completed move on to the next topic.

> Purchase a quality VPN provider - This is not required but highly recommended for real use!
{.is-warning}

# Networking
- Set up static IP addresses and DNS servers on both servers.
- Recommend a DMZ subnet isolated from the rest of your network.
- The router/firewall must be able to port forward.
- Purchase or acquire a domain name.
- Free Cloudflare account.

# Hardware
Hardware specifics and Ubuntu Desktop/Windows Server installation are not covered in this wiki due to the vastly different setups and multiple install options. There is plenty of documentation already available on how to install Ubuntu Desktop and Windows Server.

## Seedbox
- Fresh up-to-date install of Ubuntu Desktop 22.04 LTS 64-bit (Recommend minimum installation).
- Minimum of 4 cores/vcpu & 4 GB of RAM (8 GB recommended).
- Minimum of 60GB SSD/NVMe OS disk.
- Additional storage is mounted to the file system under /mnt/media.

## Media Server
- Fresh up-to-date install of Windows Server 2022 (Can also use 2016/2019 or Windows 10/11).
- Minimum of 4 cores/vcpu & 8 GB of RAM.
- Minimum of 60GB SSD/NVMe OS disk.
- Additional storage is mounted as a drive in Windows.
- Discrete GPU for Plex encoding on the media server (Recommended).

# Storage
Storage specifics are also not covered in this wiki for the same reason as hardware, there are too many different options and plenty of documentation available. Can use a single drive mounted directly to the host or a NFS mount from a NAS on the network. Options are endless ;)

- Additional disks must be mounted by the Ubuntu Desktop host under the directory /mnt/media
- /mnt/media must have the following folder structure:

```
/mnt/media/
│   
└───downloads/
│   │   
│   └───data/
│   │   
│   └───movies/
│   │   
│   └───shows/
│   
└───movies/
│   
└───shows/
```