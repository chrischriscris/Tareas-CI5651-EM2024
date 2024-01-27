#!/usr/bin/env bash

# Compile the cargo project in tunnel_ads and copy the binary to the root directory

cargo build --release --manifest-path=tunnel_ads/Cargo.toml
# cp tunnel_ads/target/release/tunnel_ads ../tunnel_ads
