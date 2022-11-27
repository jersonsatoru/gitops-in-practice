FROM jenkins/jenkins:2.361.4-lts-jdk11
USER root
ENV DOCKER_VERSION 20.10.21
RUN apt update && \
    apt install wget
# Install Docker client
RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz && \
    tar -xzf ./docker-$DOCKER_VERSION.tgz && \
    mv ./docker/docker /usr/bin/docker
# Install Kustomize
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
    mv ./kustomize /usr/bin/kustomize
