---
title: Chapter 1- Basic Commands and Info
---

[Docker Base Section](/software-notes/dev-tech/docker) -- {{ page.last_modified_at }}

## Chapter 1 - Basic Commands and Info

To search docker registry for an image  

~~~bash
docker search busybox
~~~

To see what docker images are already present locally (note that this is <b>NOT</b> equal to container name which we give while running/saving containers)  

~~~bash
docker images
~~~

This is the output
<pre>
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
node                      9.6.1-stretch       f88afee950ae        7 days ago          891MB
ubuntu                    16.04               0458a4468cbc        5 weeks ago         112MB
hello-world               latest              f2a91732366c        3 months ago        1.85kB
markadams/chromium-xvfb   latest              44cb7db1a745        6 months ago        543MB
node                      6.9.2-wheezy        a4520758fe5e        14 months ago       507MB
</pre>

To free up space on your machine, remove local images no longer in use by this
  
~~~bash
docker rmi {image-id}
~~~

To show a list of currently running docker containers

~~~bash
docker ps
~~~

To show last run container

~~~bash
docker ps -l
~~~

To show last `k` run containers (doesn't show the deleted ones)

~~~bash
docker ps -n 2
~~~
or

~~~bash
docker ps -n 3
~~~
or

~~~bash
docker ps -n {k}
~~~


To show all the previously run containers so far (doesn't show the deleted ones)

~~~bash
docker ps -a
~~~

To create and run a docker container. ``-name`` flag assigns the container a name. ``ubuntu:16.04`` is the image name in the docker official repository. ``-it`` are the flags for interactive and tty. ``/bin/bash`` is the command which will be run inside the container. The docker container runs as long as the program inside it is running.

~~~bash
docker run --name pipeline -it ubuntu:16.04 /bin/bash
~~~

To create and run a docker container in detached mode, simply pass the `-d` flag. This creates and starts the container and returns back to the terminal of the host os

~~~bash
docker run --name pipeline -idt ubuntu:16.04 /bin/bash
~~~

Port Mapping in docker containers. Port Mapping in docker containers has to happen when the container is created. For example, the below command does port mapping from 805 to 805.

~~~bash
docker run --name pipeline -idt -p 805:805 ubuntu:16.04 /bin/bash
~~~

Now, if you try `docker ps` command, you will see the following output in the ports column:

<pre>
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                  NAMES
44859c860bd2        ubuntu:16.04        "/bin/bash"         4 seconds ago       Up 3 seconds        0.0.0.0:805->805/tcp   pipeline
</pre>

To delete a container (pass the container id in the string)

~~~bash
docker rm "ebe464aec5f1cc882f839a596f5c1ba360b56bc7b460a34985108aff71da5550"
~~~ 
or 

~~~bash
docker rm {container-name}
~~~

### Resuming your work again in the containers

- [Ref A] To start up and enter into the terminal of an existing container which you `exited` from

~~~bash
docker start -i pipeline
~~~
or 

~~~bash
docker start -i {container-name}
~~~

- [Ref B] Let's say you used above command to enter into the container again. Now this container is running as long as you don't exit from it. Now, in another tab, if you want another terminal session into the container, you can run:

~~~bash
docker exec -it pipeline /bin/bash
~~~ 
or 

~~~bash
docker exec -it {container-name} /bin/bash
~~~

How does the command `Ref A` differ from the command `Ref B`? Well, if you type `exit` while in the session of `Ref A`, the session in `Ref B` automatically terminates. However, the vice versa is not true. Hence, the command in `Ref B` can be accurately describes as a means to **connect and lauunch as schell script to an existing running container**

Thw below command simply executes the `ifconfig` command inside container `pipeline` and returns the output in the host terminal

~~~bash
docker exec pipeline ifconfig
~~~

To rename the docker container

~~~bash
docker rename pipeline pipeline2
~~~

Freeze all processes and resources for a container

~~~bash
docker pause pipeline2
~~~

Unfreeze/Unpause a freezed container

~~~bash
docker unpause pipeline2
~~~

To view all images and containers being used across the system

~~~bash
docker system df
~~~
Output:
<pre>
TYPE                TOTAL               ACTIVE              SIZE                RECLAIMABLE
Images              5                   2                   2.054GB             1.942GB (94%)
Containers          2                   1                   56.29MB             0B (0%)
Local Volumes       0                   0                   0B                  0B
Build Cache                                                 0B                  0B
</pre>

To prune the system of docker containers

~~~bash
docker system prune
~~~

Output:
<pre>
WARNING! This will remove:
      - all stopped containers
      - all networks not used by at least one container
      - all dangling images
      - all build cache
Are you sure you want to continue? [y/N]
</pre>

To see the processes running inside a container, type the following command from the host system's terminal

~~~bash
docker top pipeline
~~~
Output:
<pre>
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                12818               12802               0                   20:24               pts/0               00:00:00            /bin/bash
</pre>

#### STDIN/STDOUT
What is STDIN/STDOUT?
Simply put, it will redirect you input commands to the process and display the output back from there to the terminal. For example, pressing `Enter` would be send as an input to the primary process which is running, and the output from that process will be shown back to you. In most cases, it's **important that the main program you wish to run, runs in the foreground always**

To attach STDIN/STDOUT to the primary program that is running, run

~~~bash
docker attach pipeline
~~~

To fetch the logs of a docker container

~~~bash
docker logs pipeline
~~~
This will provide you history of the commands run, their output, etc.

To inspect a docker container, i.e., get the full picture of the container, run

~~~bash
docker inspect pipeline
~~~
This will give you a json output giving a full description about the container. Here is a sample output:
<pre>
[
  {
      "Id": "44859c860bd2ae9d187afe680e5fba67f16df70129206af962348133324caf76",
      "Created": "2018-03-03T14:54:59.189865706Z",
      "Path": "/bin/bash",
      "Args": [],
      "State": {
          "Status": "exited",
          "Running": false,
          "Paused": false,
          "Restarting": false,
          "OOMKilled": false,
          "Dead": false,
          "Pid": 0,
          "ExitCode": 0,
          "Error": "",
          "StartedAt": "2018-03-03T14:54:59.504665511Z",
          "FinishedAt": "2018-03-03T15:17:28.446851212Z"
      },
      "Image": "sha256:0458a4468cbceea0c304de953305b059803f67693bad463dcbe7cce2c91ba670",
      "ResolvConfPath": "/var/lib/docker/containers/44859c860bd2ae9d187afe680e5fba67f16df70129206af962348133324caf76/resolv.conf",
      "HostnamePath": "/var/lib/docker/containers/44859c860bd2ae9d187afe680e5fba67f16df70129206af962348133324caf76/hostname",
      "HostsPath": "/var/lib/docker/containers/44859c860bd2ae9d187afe680e5fba67f16df70129206af962348133324caf76/hosts",
      "LogPath": "/var/lib/docker/containers/44859c860bd2ae9d187afe680e5fba67f16df70129206af962348133324caf76/44859c860bd2ae9d187afe680e5fba67f16df70129206af962348133324caf76-json.log",
      "Name": "/pipeline",
      "RestartCount": 0,
    ...........................
......................
]
</pre>

To get realtime stats about things like network I/O, memory usage etc., run

~~~bash
docker stats
~~~

<pre>
CONTAINER ID        NAME                CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
44859c860bd2        pipeline            0.00%               468KiB / 15.55GiB   0.00%               6.53kB / 0B         0B / 0B             1
</pre>

To copy files from the host machine to the container, you can run

~~~bash
docker cp {path-to-file-from-host-machine} {container-name}:{path-to-dir-to-copy-to}
~~~

---

[GOTO Chapter 2](/software-notes/dev-tech/docker/chapter-2)