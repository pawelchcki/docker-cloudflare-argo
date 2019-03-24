# docker-cloudflare-argo

A Docker image designed to be an intermediary between your local containers (or anything on your local network) and [Cloudflare's Argo tunneling service](https://www.cloudflare.com/products/argo-tunnel/). 

(AKA: A fantastic way to avoid exposing your containers **and** your host to the scary, scary world.)

## Prerequisites

Registration for Argo is done through the [Cloudflare dashboard](https://dash.cloudflare.com/) (it currently costs $5/month).

And, for now, a certificate file (`.pem`) [needs to be obtained via `cloudflared tunnel login`](https://developers.cloudflare.com/argo-tunnel/quickstart/#step-3-login-to-your-cloudflare-account) *before* using the container. This can be done on any computer.

## Configuration

The following environment variables are required:

- `TUNNEL_HOSTNAME`: The hostname/subdomain of the public-facing zone registered with Cloudflare
- `TUNNEL_URL`: The backend URL server you want to dig the tunnel to, probably on your local/Docker network

...and your `.pem` file (the login certificate from Cloudflare) needs to be mounted to `/etc/cloudflared/cert.pem` on the Argo container, as shown in the example.

## Usage

```
docker run -d \
           -e "TUNNEL_HOSTNAME=mytunnel.jarv.is" \
           -e "TUNNEL_URL=http://localhost:8080" \
           -v "/absolute/path/on/your/host/cert.pem:/etc/cloudflared/cert.pem" \
           jakejarvis/cloudflare-argo:latest
```

