FROM python:3.9.13

ARG SIMPLE_WITH_DEFAULT=default

ARG FIRST_INNER_DEFAULT 1 \
  MIDDLE_INNER_DEFAULT=off \
    LAST_INNER_DEFAULT=1

ARG SINGLE_NO_DEFAULT

ARG SINGLE_WITHOUT_EQUALS 3

ARG FIRST_INNER_ 1 \

  MIDDLE_INNER off \
    LAST_INNER_

# Pulumi installation

RUN curl -fsSL https://get.pulumi.com | sh -s -- --version 3.37.1

RUN ln -s /root/.pulumi/bin/pulumi /usr/bin/

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

RUN curl -fsSL https://get.docker.com -o get-docker.sh

RUN sh ./get-docker.sh

RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
