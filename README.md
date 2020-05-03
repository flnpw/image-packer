# flnpw/packer

This repo has packer installed for using on multilayer builds, as a installer or
as is.

## How to use

Using this image in a multilayered Dockerfile and fetching packer from it:
```
FROM flnpw/packer AS packer
...
FROM myimage
...
COPY --from=packer /usr/local/bin/packer /<wherever>/packer
...
```

Using this image as a local installer:
```
docker run --rm \
  --entrypoint='' \
  -v /usr/local/bin:/target \
  flnpw/packer \
  cp /usr/local/bin/packer /target
```
