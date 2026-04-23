!!!Root project works in regard to wireguard but Traefik doens't redirect to https properly. However the project in the traefik folder does http to https redirect properly. Since this is a POC I'll leave it as is for now.



# Docker Wireguard

Once connected to VPN, you can access services on the network. Specifically `grafana.internal` will be available.

## DNS Resolution

~~Internal `.internal` domains resolve dynamically via CoreDNS using `rewrite` + Docker DNS forwarding (`127.0.0.11`). Only CoreDNS has a static IP (`172.20.0.199`) — required by WireGuard's `PEERDNS`. All other services get dynamic IPs from Docker. To add a new internal service, add a `rewrite name <name>.internal <docker-service>` line to `coredns/Corefile`.~~

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
