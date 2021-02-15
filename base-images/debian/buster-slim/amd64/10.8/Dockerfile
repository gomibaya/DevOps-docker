#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM amd64/debian:buster-slim

LABEL maintainer="esteban@gominet.net"
LABEL version="0.1.1"

######################
# SECURITY FIXES
######################
#  - https://security-tracker.debian.org/tracker/CVE-2019-20079
# vim-tiny, sin problema seguridad de bullseye
#   Dependencia de libselinux1 >3.1. que obliga libc6 >= 2.30.
# Se queda fuera, como editor: nano 
#
#  - CVE-2019-3843, CVE-2019-3843 
#  https://security-tracker.debian.org/tracker/CVE-2019-3843
#  Utilizo la versión buster-backports de libsystemd y libudev1
#   En Backport sigue estando el problema (247.2-5~bpo10+1) no se soluciona hasta 247.3-1
#   Pendiente de actualización de backport
#  La afectación es si tiene control del servicio y de un helper exterior. Realmente impacto menor.
#  IGNONAR EN TRIVY
#
#  - CVE-2018-12886  Afecta A ARM en AMD64 no afecta. De momento sólo builds amd64
#   https://security-tracker.debian.org/tracker/CVE-2018-12886
#  IGNORAR EN TRIVY
#
#  - CVE-2019-15847. Afecta sólo a POWER9 binaries.
#   https://security-tracker.debian.org/tracker/CVE-2019-15847
#  IGNORAR EN TRIVY.
#
#  - CVE-2020-1751. Afecta sólo a POWERPC
#  https://security-tracker.debian.org/tracker/CVE-2020-1751
#  IGNORAR EN TRIVY
#
#  - CVE-2020-1752. Solucionado en 2.30 versión en buster 2.28-10
#  https://security-tracker.debian.org/tracker/CVE-2020-1752
#  No hay backport. En Debian etiquetado como minor-issue
#  IGNORAR EN TRIVY
#
#  - CVE-2021-3326. Solucionado en 2.32. Afecta a iconv en lenguage ISO-2022-JP-3
#  https://security-tracker.debian.org/tracker/CVE-2021-3326
#  No hay backport. En Debian etiquetado como minor-issue
#  IGNORAR EN TRIVY
#
#  - CVE-2020-24659. A revisar. Solucionado en 3.6.16, 3.7
#  https://security-tracker.debian.org/tracker/CVE-2020-24659
#  No hay backport. En Debian etiquetado como minor-issue
#  IGNORAR EN TRIVY
#
#  - CVE-2019-12290. A revisar. Solucionado en 2.20
#  https://security-tracker.debian.org/tracker/CVE-2019-12290
#  No hay backport. En Debian etiquetado como minor-issue
#  IGNORAR EN TRIVY

  
# runtime dependencies
RUN echo "deb http://deb.debian.org/debian buster-backports main" > /etc/apt/sources.list.d/buster-backports.list; \ 
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libsystemd0/buster-backports \
        libudev1/buster-backports \
    ; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        jq \
        less \
        nano \
        rsync \
        unzip \
        xz-utils \
    ; \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y; \
    apt clean

# No se elimina /var/lib/apt/lits a propósito. Cualquier creación a partir de esta imagen base realizará un update.
# Con esto serán rdiff y no descarga completa de listado.
    