#! /usr/bin/bash

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Helpers
cargo install du-dust
cargo install exa
cargo install bottom

# Generate deb from rust projects
cargo install cargo-deb
