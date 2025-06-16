#!/bin/bash
docker build -t phenix -f docker/Dockerfile --build-arg INSTALL_CERTS=https://raw.github.nrel.gov/Operations-Support/Trust-NREL-CA/master/NREL-CA/nrel-ca.pem .
cd docker/jit/
if [ "$(dpkg-architecture -q DEB_BUILD_ARCH)" = "arm64" ]; then
    docker build --build-arg NODE_ARCH=arm64 -t phenix-jit -f Dockerfile --build-arg INSTALL_CERTS=https://raw.github.nrel.gov/Operations-Support/Trust-NREL-CA/master/NREL-CA/nrel-ca.pem .
else
    docker build -t phenix-jit -f Dockerfile --build-arg INSTALL_CERTS=https://raw.github.nrel.gov/Operations-Support/Trust-NREL-CA/master/NREL-CA/nrel-ca.pem .
fi
cd -
