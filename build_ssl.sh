#!/bin/bash
# build_ssl.sh: Builds OpenSSL 1.0.2 and 1.1.0 to support
# testing of SSL2 and TLS1.3
set -euo pipefail

yum -y install wget gcc make perl openssl

# Build OpenSSL 1.0.2
version=1.0.2t
wget "https://openssl.org/source/openssl-$version.tar.gz"
tar -xvf "openssl-$version.tar.gz"
pushd "openssl-$version"
./config enable-ssl2 enable-ssl3 no-shared
make depend
make
popd

# Build OpenSSL 1.1.1
version=1.1.1e
wget "https://openssl.org/source/openssl-$version.tar.gz"
tar -xvf "openssl-$version.tar.gz"
pushd "openssl-$version"
./config no-shared
make depend
make
popd
