# SSL Test Dummies

Crash testers for your favorite protocol. Starts SSL v2, v3, and TLS v1, v1.1, and v1.2 servers for handshake experiments.

## Build

Requires docker.

```bash
docker build -t ssldummy .
```

## Run

Comfortably via:

```bash
./dummy start
--> start ssl2 on port 4443
c4287fe4b3dd2b73c9fa0b3719df8b0df7e150e8c4aa8167f6ebcf87f9136f6a
--> start ssl3 on port 4444
16e7c4e3ec0e384198f1350df2798e38a3016f87bd0d7514328097c34eb85878
--> start ssl23 on port 4445
e920acf600648641724fe8aac41ed35a1ab85dcd94bc1d3dd9a87ad011f84a76
--> start tls1 on port 4446
5c7d1533ae595109684ed92bc0b2be0d36e2ec28daa780150882e327c586c92d
--> start tls11 on port 4447
96e3089588041a769d35f630044b6d71d99a8fd20503790d2060800b98569214
--> start tls12 on port 4448
fcd1787c38ca296481c5b55c89e1950c55048ef9cb288460e4fad586c3fa463b

./dummy stop
...
```

Or run it manually:

```bash
docker run -e ssl=tls12 -p 4443:443 --rm -it ssldumm
```

