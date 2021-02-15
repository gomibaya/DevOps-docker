#!/bin/sh

DOCKERUSERNAME="$1"
if [ "X${DOCKERUSERNAME}" = "X" ]; then
    echo "I need the docker username."
    exit 1
fi

prg=$0
if [ ! -e "$prg" ]; then
  case $prg in
    (*/*) exit 1;;
    (*) prg=$(command -v -- "$prg") || exit;;
  esac
fi
basedir=$(
  cd -P -- "$(dirname -- "$prg")" && pwd -P
) || exit

oldpwd=$(pwd)

versions=$(cat supported-versions)
archs=$(cat supported-archs)
localversion=$(cat version.txt)

for rawversion in ${versions}; do
    for arch in "${archs}"; do
        rawversion=$(echo $rawversion | awk -v ARCH=$arch -F'|' '{gsub(/%ARCH%/,ARCH); print $0}')
        version=$(echo $rawversion | awk -F'|' '{print $1}')
        fullversion=$(wget -qO- $(echo $rawversion | awk -F'|' '{print $2}'))
        dir=$(echo $rawversion | awk -v ARCH=$arch -v FULLVERSION=$fullversion -F'|' '{printf "%s/%s/%s", $1, ARCH, FULLVERSION}')
        dockerfile=$dir/Dockerfile
        if [ ! -f $dockerfile ]; then
            echo "${version}:${arch} ERROR No previus dockerfile exists."
            continue
        fi
        #${LOCALUSERNAME}/$IMAGE:$VERSION
        docker build -f $dockerfile -t ${DOCKERUSERNAME}/devops-base:${version} $dir
        cd $dir
        trivy image --severity HIGH,CRITICAL ${DOCKERUSERNAME}/devops-base:${version}
        cd $oldpwd
        
    done
done

# Example test
#docker run --name=test --rm -it gomibaya/devops-base:buster-slim /bin/sh