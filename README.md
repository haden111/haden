# Random SSH Banner for OpenWRT

This repository contains a small shell script that displays a random banner each
SSH login on an OpenWRT device.

## Installation

1. Copy `random_banner.sh` to `/etc/profile.d/` on your OpenWRT router and make
   it executable:

```sh
cp random_banner.sh /etc/profile.d/
chmod +x /etc/profile.d/random_banner.sh
```

2. Create a directory `/etc/banner.d/` and place one or more text files inside.
   Each file represents a complete banner. Example files are provided in the
   `banners/` directory of this repository:

```text
/etc/banner.d/
  welcome.txt
  security.txt
  greeting.txt
```

3. Log out and log back in via SSH. Each session should display one random
   banner file from `/etc/banner.d/`.

## Building an .ipk package

If you prefer to install the script as a package, run `build_ipk.sh` to
create `random-banner_1.0_all.ipk`:

```sh
./build_ipk.sh
```

Copy the resulting file to your router and install it with `opkg`:

```sh
opkg install random-banner_1.0_all.ipk
```
