#! /usr/bin/env bash

# https://github.com/paxtonhare/demo-magic
source ../demo-magic/demo-magic.sh

clear


# Namespaces - PIDs
p '# Namespaces - PIDs'
pe 'ps auxf'
pe 'docker run --name postgres -d -e POSTGRES_PASSWORD=password postgres'
pe 'ps auxf'
pe 'docker top postgres'
pe 'docker exec -it postgres bash -c "ps auxf"'

# Namespaces- Filesystem
p '# Namespaces - Filesystem'
pe 'sudo find /var/lib/docker -name premera'
pe 'docker exec -it postgres bash -c "touch /tmp/premera"'
pe 'sudo find /var/lib/docker -name premera'
pe 'ls /tmp'
pe 'docker exec -it postgres bash -c "ls /tmp"'

# Cgroups - Memory
p '# Cgroups - Memory'
pe 'docker stop postgres && docker rm postgres'
pe 'docker run --name postgres -d -m 384m -e POSTGRES_PASSWORD=password postgres'
pe 'free -m'
pe 'docker exec -it postgres bash -c "free -m"'
pe 'docker exec -it postgres bash -c "cat /sys/fs/cgroup/memory/memory.limit_in_bytes"'
pe 'docker stop postgres && docker rm postgres'



pe 'docker run --memory 200m --rm -it progrium/stress --vm 1 --vm-bytes 100M --timeout 1s'
pe 'docker run --memory 200m --rm -it progrium/stress --vm 1 --vm-bytes 190M --timeout 1s'
pe 'docker run --memory 200m --rm -it progrium/stress --vm 1 --vm-bytes 200M --timeout 1s'