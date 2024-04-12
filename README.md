# ucloudflared
[![Docker Image CI](https://github.com/ikhwanperwira/ucloudflared/actions/workflows/docker-image.yml/badge.svg)](https://github.com/ikhwanperwira/ucloudflared/actions/workflows/docker-image.yml)

User-space cloudflared.

# Setup
```bash
pip install udocker
```

# Hello World
* linux-arm64
  ```bash
  udocker run ikhwanperwira/ucloudflared:linux-arm64 --hello-world
  ```
  OR
  ```bash
  udocker run ikhwanperwira/ucloudflared:latest --hello-world
  ```
  
* linux-amd64
  ```bash
  udocker run ikhwanperwira/ucloudflared:linux-amd64 --hello-world
  ```
  
# Installation
```bash
git clone https://github.com/ikhwanperwira/ucloudflared && ucloudflared/install.sh
```

# Usage
```bash
ucloudflared --hello-world
```
