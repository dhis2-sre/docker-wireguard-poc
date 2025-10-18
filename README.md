# Docker Wireguard

Once connected to VPN, you can access services on the network. Specifically `grafana.internal` will be available.

## Deploy

```shell
docker compose up
```

## Get peer config...

```shell
docker compose exec wireguard cat /config/peer_laptop/peer_laptop.conf > peer.conf
```

Update "Endpoint" port for service to match what's in the docker compose file.

## Import using (into NetworkManager)

```shell
nmcli connection import type wireguard file ./peer.conf
```

## Get root CA

```shell
docker compose cp mkcert:/root/.local/share/mkcert/rootCA.pem .
```

# Get server config...

```shell
docker compose exec wireguard cat /config/wg_confs/wg0.conf
```

# TODO

* Skip the wildcard cert and generate exactly what we need
