#!/bin/sh
# Usage: ./generateCert.sh /my/local/directory my/ssh/key/path ssh@url domain1 domain2 domain3...

if [ "$#" -lt 4 ]; then
  echo "Error: insufficient arguments. Please supply:"
  echo "1) full path of local directory where you want to save certs"
  echo "2) full path of ssh key"
  echo "3) ssh url"
  echo "4) at least one domain"
  exit 1
fi

# Store local directory and remove it from args.
local_dir="$1"
shift

# If the local directory doesn't exist, create it.
mkdir -p $local_dir

# Store ssh key location and remove it from args.
key_location="$1"
shift

# Store ssh url and remove it from args.
ssh_url="$1"
shift

# Store domains as space-separated string.
domains="$@"

# Run docker.
# docker build --tag 'custom_certbot' . --build-arg ssh_url="$ssh_url" --build-arg domains="$domains" && docker run -ti -v $key_location:/root/.ssh/id_rsa -v $local_dir/docker-volumes/etc_letsencrypt:/etc/letsencrypt -v $local_dir/docker-volumes/var_lib_letsencrypt:/var/lib/letsencrypt -v $local_dir/docker/web/src/letsencrypt/letsencrypt-site:/data/letsencrypt -v $local_dir/docker-volumes/var_log_letsencrypt:/var/log/letsencrypt 'custom_certbot'

docker build --tag 'custom_certbot' . --build-arg ssh_url="$ssh_url" --build-arg domains="$domains" && docker run -v $key_location:/root/.ssh/id_rsa -v $local_dir/docker-volumes/etc_letsencrypt:/etc/letsencrypt -v $local_dir/docker-volumes/var_lib_letsencrypt:/var/lib/letsencrypt -v $local_dir/docker/web/src/letsencrypt/letsencrypt-site:/data/letsencrypt -v $local_dir/docker-volumes/var_log_letsencrypt:/var/log/letsencrypt 'custom_certbot'
