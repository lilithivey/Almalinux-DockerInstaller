#!/bin/bash
sudo - s
#THIS IS A SCRIPT THAT IS DESIGNED TO HELP YOU INSTALL DOCKER ON ALMALINUX. IT'S RATHER EASY, BUT THIS IS A QUICK AND DIRTY WA>
#TYPE THIS INTO YOUR COMMAND LINE (no quotes): "curl -fsSL {{url}} | bash"
#
#This line adds Docker's official repo to your system.
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#
#These next two lines are self-explanatory. Useful in case you tried podman and realized it sucks.
echo "Removing any Podman crap..." sudo dnf remove - y podman buildah
#
#Using the new Repo, your system will download docker,
echo "Installing Docker..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io >> /dev/null
systemctl start docker.service && systemctl enable docker.service
echo "Docker installed! Version:"
docker version
#if[[$ (docker version - f "{{.Server.Version}}") - ge "20.10.23"]];
#then
