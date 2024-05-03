# Generate cert

```bash
docker build -t acli .

docker run -d --name acli acli:latest

acli --version

acli --help

acli push:files

acli push:files --help

acli auth:login -k mytokendseicieeidie --secret mysecretiontocloud

docker run --rm -ti acli:latest bash

docker run --rm -ti acli:latest acli auth:login -k mytokendseicieeidie --secret mysecretiontocloud


acli env:certificate-create --ca-certificate=cert.chain cert.pem cert.key environmentId
```