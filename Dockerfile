FROM busybox
ARG VERSION_TAG=1.5.6
ARG ARTIFACT=packer_${VERSION_TAG}_linux_amd64.zip
ENV URL=https://releases.hashicorp.com/packer/$VERSION_TAG/$ARTIFACT
ENV BINARY=packer

ADD $URL /tmp/$ARTIFACT
RUN set -exuo pipefail; \
  mkdir -p /usr/local/bin \
  && unzip /tmp/$ARTIFACT -d /usr/local/bin/ \
  && rm -rf /tmp/$ARTIFACT \
  && chmod 755 /usr/local/bin/$BINARY

ENTRYPOINT ["packer"]
CMD ["--help"]
