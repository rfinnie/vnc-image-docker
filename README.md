# vnc-image-docker

This is a quick-and-dirty Docker image which serves a static image.

## Building

The easiest way is to simply replace `image.ppm`.
This must be a full-color "P6" forman PPM / PNM image; size should not matter.

Then run:

```shell
docker image build -t vnc-image-docker .
```

## Usage

Run:

```shell
docker run -it --rm -p 5900:5900/tcp --ulimit nofile=1024:1024 vnc-image-docker
```

Please note the `ulimit`: Docker will set `nofile` in the billions, and `x11vnc` is a program which will try to close all unused filehandles at certain points in its operation, so we need to keep `nofile` low.

## License

This document is provided under the following license:

    SPDX-PackageSummary: vnc-image-docker
    SPDX-FileCopyrightText: © 2025 Ryan Finnie <ryan@finnie.org>
    SPDX-License-Identifier: CC-BY-SA-4.0
