#!/bin/sh

generated_warning() {
cat <<'EOF'
#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
EOF
}

versions=$(cat supported-versions)
archs=$(cat supported-archs)
localversion=$(cat version.txt)

for rawversion in ${versions}; do
    for arch in "${archs}"; do
	echo "Arch: $arch"
        rawversion=$(echo $rawversion | awk -v ARCH=$arch -F'|' '{gsub(/%ARCH%/,ARCH); print $0}')
        version=$(echo $rawversion | awk -F'|' '{print $1}')
        template="Dockerfile-${version}.template"
	echo "Template: $template"
        trivytemplate="trivyignore-${version}.template"
        if [ ! -f $template ]; then
            echo "${version}: Does not exists template $template"
            continue
        fi
        fullversion=$(echo $rawversion | awk -F'|' '{print $2}')
        dir=$(echo $rawversion | awk -v ARCH=$arch -v VERSION=$localversion -F'|' '{printf "%s/%s/%s", $1, ARCH, VERSION}')
	echo "Dir: $dir"
        [ -d "$dir" ] || mkdir -p "$dir"
        dockerfile=$dir/Dockerfile
        if [ -f $dockerfile ]; then
            echo "${version}:${arch} Previus dockerfile exists."
            continue
        fi
        generated_warning > $dir/Dockerfile
        cat $template >> $dir/Dockerfile
        sed -ri \
            -e 's|%debianversion%|'"${fullversion}"'|' \
            -e 's/%localversion%/'"${localversion}"'/' \
            "$dockerfile"
        if [ -f $trivytemplate ]; then
            cat $trivytemplate > $dir/.trivyignore
        fi
        buildpyenvtemplate="buildpyenv-${version}.template"
        cat $buildpyenvtemplate > $dir/buildpyenv.sh
    done
done
