# SPDX-PackageName: vnc-image-docker
# SPDX-PackageSupplier: Ryan Finnie <ryan@finnie.org>
# SPDX-PackageDownloadLocation: https://codeberg.org/rfinnie/vnc-image-docker
# SPDX-FileCopyrightText: © 2025 Ryan Finnie <ryan@finnie.org>
# SPDX-License-Identifier: MPL-2.0

FROM alpine:latest

COPY image.ppm /srv/vnc-image/image.ppm
COPY init /srv/vnc-image/init
COPY extract-image /srv/vnc-image/extract-image

RUN apk add --no-cache x11vnc python3 && adduser -D app

USER app
CMD [ "/srv/vnc-image/init" ]
EXPOSE 5900/tcp
