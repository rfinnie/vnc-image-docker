# SPDX-PackageSummary: vnc-image-docker
# SPDX-FileCopyrightText: © 2025 Ryan Finnie <ryan@finnie.org>
# SPDX-License-Identifier: MPL-2.0

FROM ubuntu:24.04

COPY image.ppm /srv/vnc-image/image.ppm
COPY init /srv/vnc-image/init
COPY extract-image /srv/vnc-image/extract-image

RUN apt-get update && apt-get -y install x11vnc python3 && apt-get clean && useradd -ms /bin/bash app

USER app
CMD [ "/srv/vnc-image/init" ]
EXPOSE 5900/tcp
