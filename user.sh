#!/bin/bash
set -e

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"

rustup toolchain install 1.47.0
rustup default 1.47.0
cargo install cargo-bpf

cd /vagrant
bin_name="block_http"
artifact_path="/vagrant/target/bpf/programs/block_http/block_http.elf"

echo "building $bin_name"
cargo bpf build $bin_name

echo "doing postprocessing hack as per https://github.com/aquarhead/protect-the-rabbit/blob/1a73618ebc656d0f10771ba3e205ba10ebd53f60/Makefile.toml#L10-L19"

llvm-objcopy --remove-section .text --rename-section xdp/block_http=prog "$artifact_path"

# Do not need to explicitly state section anymore.
# `ip link set ... xdp` defaults to loading the "prog" section
sudo ip link set dev eth0 xdp obj $artifact_path
ip link show eth0
