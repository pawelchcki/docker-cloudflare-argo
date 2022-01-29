target "default" {
    args = {
        CLOUDFLARED_VERSION = "",
    }
    output = ["type=docker"]
    tags = ["jakejarvis/cloudflare-argo:latest"]
}