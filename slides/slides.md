---
marp: false
title: Building code with docker
description: A presentation on building code with docker
theme: uncover
transition: fade
paginate: true
_paginate: false
---

# <!--fit--> Building code with docker

---


## docker

<!--
docker mostly replaces VMs

VMs need designated RAM, own kernel

Expensive - Often more than one app per VM
-->

![bg 95% right](./images/docker-host-half.webp)

---

<!--
docker interface is mostly with cli

gives instructions to host, can pull from registry

-->

![bg 90%](./images/docker-architecture.webp)

<!-- source - https://devstacks.wordpress.com/2017/02/02/docker-overview-and-architecture/ -->

---


<!--

-->

## image name structure

``` bash
# full image name
# repository < host >/< image name >:<tag >
docker pull docker.io/library/ubuntu:latest

# with docker.io as default host
docker pull library/ubuntu:latest

# with docker.io as default host, library as default first part
# and latest as default image tag 
docker pull ubuntu
```

---

<!--
docker pull

docker inspect ubuntu

docker run ubuntu

echo "hi there" > a_file.txt
-->


## demo - inspect image

---

<!--

-->

![bg 85%](./images/docker-file-image-container.png)

<!-- source - https://cto.ai/blog/docker-image-vs-container-vs-dockerfile/ -->

---

<!--

-->

![bg 70%](./images/docker-layers-all.png)

<!-- source - https://dev.to/waji97/docker-image-management-3558 -->

---

<!--

-->

![bg 85%](./images/docker-layer-creation.drawio.png)

---

<!--
docker build . -t app1

docker run -t app1

change RUN to 3 seperate ones

see size difference
-->

## demo - create image

---

## why layers?

---

![bg 90%](./images/dotnet-layers-1.drawio.png)

---

![bg 90%](./images/dotnet-layers-2.drawio.png)

---

![bg 90%](./images/dotnet-layers-3.drawio.png)

---

![bg 90%](./images/dotnet-layers-4.drawio.png)

---

<!--

login to acr repo

talk about ARGS, ENV

talk about WORKDIR, ENV



-->

## demo - dotnet app

---

<!--  -->

![bg 80%](./images/multi-stage-build.drawio.png)

---

<!--

-->

## demo - 2 stage builds

---

# Thanks for listening, any questions?

