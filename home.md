---
title: Home
description: 
published: true
date: 2024-08-23T02:57:53.232Z
tags: 
editor: markdown
dateCreated: 2024-08-23T02:50:22.095Z
---

![sitelogo_200x200.png](/sitelogo_200x200.png){.align-center}

Over the years and evolutions of running my seedbox, I have never come across a guide that gets into full automation of your media. Just bits a pieces of information on how to set it up which makes it hard for just anyone to get working properly. Hope to create and maintain this wiki with the information I have gathered from Google, Reddit, GitHub, and personal experience over the years to help others set this up correctly and more importantly in a SECURE way!

**This will initially focus on Sonarr, Radarr, Prowlarr, Unpackarr, Plex, Overseerr, and qBittorrent with plans to expand topics. I have been running this documented setup for over a year with ~15-20 people with few issues, mostly the occasional download getting stuck or not imported properly (about 50TB of total media processed).**

---

1. Prereq
2. Services Part 1: Installtion
3. Services Part 2: Configuration
4. Plex
5. Overseerr

# FAQ
Why is there a Linux host and a Windows host?
> Two major reason for this decision:
>1. The biggest reason I run Plex on Windows is due to Nvidia drivers being a PITA to get working on Linux. Ive tried getting hardware encoding working numious times with no sucess on different GPUs (1060, 1080ti, 1660, 2070). Not worth the hassel to get it working properly when Windows works every time with no issues. 
>2. Don't find it required to traffic Plex through a VPN provider as it should be encrypted already (If SSL is configured properly). Plus you typically are not going to be able to fully saterate a full 1GB link. For example, my PIA location typically gets around 200-300mbps. Why limit upload/download if you dont have too?

Why isn't everything in Docker?
> Actually have a full compose file with all the required services. Everything works but continue to run into permission issues with mounting NFS directly to the container. Unable to determine if it is an issue with Synology permissions or the containers themselves since it doesnt happen with all containers in the service stack. Also need to test GPU passthrough to a container, not sure if I would run into the same issues mentioned above. More testing needed to confidently put it into production but hope to have it as an option in the future!

# Future Topics
- Docker Stack
- PIA VPN
- Synology NAS
- UseNet
- Jellyfin
- Grafana Monitoring

# Testing Method
- ESXi v7 Host (3900X, 128GB DDR, 4TB NVMe).
- Ubuntu Desktop 22.04 LTS VM (4 vcpu, 8GB RAM, 60GB DISK1, 100GB).
- Windows Server 2022 VM (4 vpu, 8GB, 60GB OS DISK).
- NFS mounted to virtual machines from Synology NAS.
- Scripts are all tested in clean snapshots at various installation points (fresh, after services install, after documented configuration, etc) before being pushed to Git Hub.



