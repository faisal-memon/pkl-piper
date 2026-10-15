# pkl-piper

Typed Pkl module for a local [Piper](https://github.com/OHF-Voice/wyoming-piper) text-to-speech service. It renders a versioned `rhasspy/wyoming-piper` Docker Compose deployment that serves the Wyoming protocol and retains downloaded voice models under `/data`.

The default voice is `en_US-lessac-medium`. Piper downloads it automatically on the first start; the container image includes its own Wyoming health check.

## Example

```pkl
amends "@piper/src/Piper.pkl"

import "@docker/src/Compose.pkl"

config {
  voice = "en_US-lessac-medium"
  port = 10200
  hostDataDirectory = "/var/lib/piper"
  networkNames = new Listing { "ai_net" }
}

networks = new Mapping {
  ["ai_net"] = new Compose.Network { `external` = true }
}
```

The rendered service publishes Wyoming on TCP port `10200`. Keep `hostPublishing` null when only Docker-network clients should reach it.

## Development

```sh
make validate
make package VERSION=0.0.1
```
