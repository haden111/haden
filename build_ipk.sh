#!/bin/sh
set -e

PKG_NAME="random-banner"
VERSION="1.0"
ARCH="all"

TMPDIR=$(mktemp -d)
PKGDIR="$TMPDIR/$PKG_NAME"
CTRLDIR="$TMPDIR/CONTROL"

mkdir -p "$PKGDIR/etc/profile.d" "$CTRLDIR"

# Copy script
cp random_banner.sh "$PKGDIR/etc/profile.d/"

# Create control file
cat > "$CTRLDIR/control" <<CONTROL
Package: $PKG_NAME
Version: $VERSION
Architecture: $ARCH
Maintainer: unknown
Description: Display a random banner on SSH login.
CONTROL

echo "2.0" > "$TMPDIR/debian-binary"

tar -C "$CTRLDIR" -czf "$TMPDIR/control.tar.gz" .
tar -C "$PKGDIR" -czf "$TMPDIR/data.tar.gz" .

ar r "${PKG_NAME}_${VERSION}_${ARCH}.ipk" "$TMPDIR/debian-binary" "$TMPDIR/control.tar.gz" "$TMPDIR/data.tar.gz"

rm -rf "$TMPDIR"

echo "Created $(pwd)/${PKG_NAME}_${VERSION}_${ARCH}.ipk"
