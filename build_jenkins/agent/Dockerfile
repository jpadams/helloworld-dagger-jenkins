FROM golang:1.18.1 as dagger
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install make -y
RUN apt-get install wget -y
RUN apt-get install jq -y
RUN /bin/bash -c 'git clone --depth 1 --branch $(curl -sL https://api.github.com/repos/dagger/dagger/releases/latest | jq -r ".tag_name") https://github.com/dagger/dagger /dagger'
WORKDIR /dagger
RUN make dagger

FROM jenkins/agent as agent
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN apt-get install curl -y
COPY --from=dagger /dagger/cmd/dagger/dagger /usr/local/bin/dagger
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
