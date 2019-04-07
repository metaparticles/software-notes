---
title: Chapter 2 - Resource Allocation and Creating Docker Images
---

[Chapter 1](/software-notes/dev-tech/docker/chapter-1)

## Chapter 2 - Resource Allocation and Creating Docker Images

To limit memory, you can run
`docker update -m 400M {container-name}`
If you are running `docker stats`, you will see the memory limit reduced to `400MiB`

To limit cpu, you can run
`docker update --cpu-shares 512 pipeline --cpus 1`
Here, `--cpu-shares` is the relative weight with respect to other containers
`-cpus` denotes the number of cores you want to spread the weight across
The default share weight allocated to any container, without `--cpu-shares` defined is <b>1024</b>

##### Building Docker Images

---
2 approaches to building your own images
1. (Imperative Way) Start with a base image and start modifying it
2. (Automated Way) Create a docker file

Create a free docker account and a repository. In this example my docker account id is `gfy94` and docker repository name is `wercker-chromium-node`
To connect to your account from local machine, do
`docker login`

This section assumes you are familiar with `git` terminology. `git` is a popular version control system.
After making changes to your docker container, you can commit your changes
`docker commit {container-name} gfy94/wercker-chromium-node:v0.0.1`
`v0.0.1` is a random version number which I assigned

Now, if you run `docker images`, you will see a new image listed as below:
```
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
gfy94/wercker-chromium-node   v0.0.1              25b804f25e29        6 minutes ago       112MB
ubuntu                        16.04               0458a4468cbc        5 weeks ago         112MB
```
In this example, image id 25b804f25e29 was created by making changes on top of image id 0458a4468cbc. image id 25b804f25e29 is basically a snapshot of container `wercker-chromium-node` which I created from ubuntu:16.04 image and on top of which I ran few commands (like installed Java, Node.js, etc.)

Similar to `git log`, the command
`docker image history 25b804f25e29`
gives us a brief summary of commands executed before this snapshot was derived from a container

Similar to `docker inspect {container-name}`, we can run
`docker inspect {image-id}`
to get a detailed info about the image

To push to your docker hub repository, run
`docker push gfy94/wercker-chromium-node:v0.0.1`

Method 2 - Dockerfiles

Dockerfiles are similar to make script. The convention for test environment is to create a file named `Dockerfile` in the root folder of git repository. If we use any other file name, we hhave to pass the `-f` flag to docker build command, with the file path

Add some sample Dockerfile and build commands here

If you give the same build command multiple times, of sub-similar, docker uses cache of previous builds. However, docker is intelligent enough to know if source code has changed, and executes a command from scratch (for example, `mvn clean install`) rather than using the cache.
However, if you are unsure, you can always pass the `--no-cache` flag

[Chapter 3](/software-notes/dev-tech/docker/chapter-3)