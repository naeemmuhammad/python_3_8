FROM python:3.8-slim-buster

LABEL maintainer="Naeem Muhammad <naeem.muhammad@kuleuven.be>"

USER root
WORKDIR /root

SHELL [ "/bin/bash", "-c" ]

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        wget git sudo bash-completion vim python-h5py=2.8.0-3 software-properties-common && \
    mv /usr/bin/lsb_release /usr/bin/lsb_release.bak && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt-get/lists/*


RUN pip install  numpy==1.23.1  scipy==1.9.0  h5py==3.7.0 matplotlib===3.5.2

# Create user "docker" with sudo powers
RUN useradd -m docker && \
    usermod -aG sudo docker && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/docker/ && \
    chown -R --from=root docker /home/docker

WORKDIR /home/docker
ENV HOME /home/docker
ENV USER docker


USER docker
ENV PATH /home/docker/.local/bin:$PATH
# Avoid first use of sudo warning. c.f. https://askubuntu.com/a/22614/781671
RUN touch $HOME/.sudo_as_admin_successful


ENV PATH $HOME/bin/:$PATH
ENV PYTHONPATH $HOME/lib/:$PYTHONPATH

CMD [ "/bin/bash" ]