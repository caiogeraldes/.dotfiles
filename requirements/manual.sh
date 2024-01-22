#! /usr/bin/bash

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Helpers
cargo install du-dust
cargo install exa
cargo install bottom
cargo install tidy-viewer

# Generate deb from rust projects
cargo install cargo-deb

# betterlockscreen
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | bash -s user
betterlockscreen -u "img/wallp/the_biglin_brothers_racing_1953.7.1.jpg"
