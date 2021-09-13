#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM gomibaya/devops-base:amd64-bullseye-slim-11.0

LABEL maintainer="esteban@gominet.net"
LABEL version="0.1.1"

######################
# SECURITY FIXES
######################
#  - https://security-tracker.debian.org/tracker/CVE-2019-20079
# vim-tiny, sin problema seguridad de bullseye
#   Dependencia de libselinux1 >3.1. que obliga libc6 >= 2.30.
# Se queda fuera, como editor: nano.   Nota: Es por referencia, en bullseye se mantiene también el nano 
#
#  20210906. versión 0.1.2
#
# - CVE-2021-33574. libc-bin,libc6 2.28.10. Solucionado en unstable, hay fix en upstream, pero aun no realizado backport en buster ni bullseye
#  https://sourceware.org/bugzilla/show_bug.cgi?id=27896
#  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989147
#  https://security-tracker.debian.org/tracker/CVE-2021-33574
#  En Debian bullseye etiquetado como minor-issue
#  IGNORAR EN TRIVY
#
#  20210911. versión 0.1.3
#
# - CVE-2021-40528. libgcrypt20 . Solucionado en bookworm, pero aun no realizado backport en buster ni bullseye
#  https://security-tracker.debian.org/tracker/CVE-2021-40528
#  En Debian bullseye etiquetado como minor-issue
#  IGNORAR EN TRIVY
#
#  20210911 python version 0.1.1
#
# - CVE-2021-29921 libpython3.9-minimal, libpython3.9-stdlib, python3.9, python3.9-mininal
#  https://security-tracker.debian.org/tracker/CVE-2021-29921
#  En Debian solucionado en experimental. Solucionado en upstream en 3.9.5
#  HIGH
#

# En entornos windows, se atasca un poco con proxy, virtualizacion de red, etc.. , hay que 
# dejarle aire para establecer las conexiones.
#
ARG PIP_DEFAULT_TIMEOUT=100
ENV PIP_DEFAULT_TIMEOUT=${PIP_DEFAULT_TIMEOUT} DEBIAN_FRONTEND=noninteractive PATH="/home/pythondev/.pyenv/bin:$PATH"


# En desarrollo, para reducir las operaciones.
RUN apt-get update; \
    apt-get install -y --no-install-recommends \ 
        zip \
        python3 \
        python3-pip \
        python-pip-whl \
        tox \
        bandit \
        pyflakes3 \
        pylint \
        isort \
        modernize \
        virtualenv \
        make \
        wget \
        curl \
        llvm \
        xz-utils \
        python3-openssl \
        ;
#Instalar paquetes dev para pyenv
RUN apt-get install -y --no-install-recommends \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        libncurses5-dev \
        libncursesw5-dev \
        tk-dev \
        libffi-dev \
        liblzma-dev \
        ;
RUN useradd --no-log-init -m -U pythondev
COPY buildpyenv.sh /home/pythondev/buildpyenv.sh
RUN chmod 755 /home/pythondev/buildpyenv.sh
USER pythondev
RUN ["/bin/bash", "-c", "/home/pythondev/buildpyenv.sh"]
#Limpieza
USER root
RUN apt purge -y \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        libncurses5-dev \
        libncursesw5-dev \
        tk-dev \
        libffi-dev \
        liblzma-dev \
        ; \
        apt autoremove ; \
        apt clean; \
        rm -rf /var/lib/apt/lists/* \
        ;
#RUN pip3 install \
##    virtualenv \
#    flake8 \
##    tox \
##    tox-venv \
##    tox-wheel \
#    pylama \
##    bandit \
#    twine \
#    pytest \
#    && mkdir -p /pythondev/output /pythondev/tests /mnt/git

#General venv base
#RUN tox --devenv venv-py36 -e py36; \
#    tox --devenv venv-py37 -e py37; \
#    tox --devenv venv-py38 -e py38; \
#    tox --devenv venv-py39 -e py39

USER pythondev
WORKDIR /home/pythondev


#ADD docker/rsyncdev.sh /pythondev/rsyncdev.sh
