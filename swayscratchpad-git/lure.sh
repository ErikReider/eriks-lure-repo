#!/bin/zsh
# vim: ft=sh
_pkgname="SwayScratchpad"
_pkgname_lower="swayscratchpad"
name="$_pkgname_lower-git"
_ver="0.1.0"
version="$_ver-r5.8186474"
release=1
desc="A GTK based on scratchpad picker for Sway"
homepage="https://github.com/ErikReider/$_pkgname"
architectures=("amd64")
license=("GPL3")
provides=("$_pkgname_lower=$_ver")
conflicts=("$_pkgname_lower")

build_deps=("git" "meson" "rust" "cargo" "gtk-layer-shell")
build_deps_fedora=("git" "meson" "rust" "cargo" "rust-glib-devel" "gtk-layer-shell-devel" "pulseaudio-libs-devel" "glib2-devel" "gtk3-devel")

deps=("gtk3" "gtk-layer-shell" "glib2" "gobject-introspection" "gtk-layer-shell" "libpulse")
deps_fedora=("gtk-layer-shell" "pulseaudio-libs" "gtk3" "glib2")

sources=("git+https://github.com/ErikReider/$_pkgname.git")
checksums=("SKIP")

version() {
    cd "$srcdir/$_pkgname"
    printf "$_ver-r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "target/release/$_pkgname_lower" "$pkgdir/usr/bin/$_pkgname_lower"
}
