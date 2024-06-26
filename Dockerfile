# Official cloudflared image
FROM cloudflare/cloudflared:latest

# You can replace `resolv.conf` with `/data/data/com.termux/files/usr/etc/resolv.conf`
COPY resolv.conf /etc/resolv.conf

# You can replace 'hosts` with `/data/data/com.termux/files/usr/etc/hosts`
COPY hosts /etc/hosts

# Allow all users to perform ping.
COPY ping_group_range /proc/sys/net/ipv4/ping_group_range
