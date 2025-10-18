# For security reasons, the certificate should be installed on the client

```shell
docker compose cp traefik:/certs/app2-91-108-122-249.nip.io.crt ./root-ca.crt
```

* Linux: Copy to /usr/local/share/ca-certificates/ and run sudo update-ca-certificates
* Firefox: Import directly in Firefox settings (it uses its own certificate store)
* macOS: IDK...
* Windows: Import into "Trusted Root Certification Authorities"
