#!/bin/bash
#
# ssldummy.sh: Start a test TLS server that serves the given protocol
# version.
#
set -euo pipefail

ssl=${ssl:-unknown}

case "$ssl" in
     ssl2)
         proto_args="-ssl2"
          ;;
     ssl3)
         proto_args="-ssl3"
         ;;
     ssl23)
         proto_args=""
         ;;
     tls1)
         proto_args="-tls1"
         ;;
     tls11)
         proto_args="-tls1_1"
         ;;
     tls12)
         proto_args="-tls1_2"
         ;;
     tls13)
         proto_args="-tls1_3"
         ;;
     *)
         echo "Unknown TLS protocol version. Please set the ssl environment variable to: ssl2, ssl3, ssl23, tls1, tls11, tls12, or tls13"
         exit 1
         ;;
esac

case "$ssl" in
    tls13)
        openssl_bin="/openssl-1.1.1e/apps/openssl"
        port_args="-port 443"
        ;;
    *)
        openssl_bin="/openssl-1.0.2t/apps/openssl"
        port_args="-accept 443"
        ;;
esac

$openssl_bin s_server $proto_args -cert /cert.pem -key /key.pem -www $port_args
