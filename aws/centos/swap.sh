swapon -s
free -m
df -h
sudo dd if=/dev/zero of=/swapfile count=1024 bs=1MiB
ls -lh /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
swapon -s
free -m