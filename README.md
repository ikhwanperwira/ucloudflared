# ucloudflared
[![Docker Image CI](https://github.com/ikhwanperwira/ucloudflared/actions/workflows/docker-image.yml/badge.svg)](https://github.com/ikhwanperwira/ucloudflared/actions/workflows/docker-image.yml)

User-space cloudflared.

# Setup
```bash
pip install udocker
```

# Run
* linux-arm64
  ```
  udocker run ikhwanperwira/ucloudflared:linux-arm64 --hello-world
  ```
  OR
  ```
  udocker run ikhwanperwira/ucloudflared:latest --hello-world
  ```
  
* linux-amd64
  ```
  udocker run ikhwanperwira/ucloudflared:linux-amd64 --hello-world
  ```
