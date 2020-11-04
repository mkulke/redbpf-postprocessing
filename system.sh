#!/bin/bash
set -e

yum updateinfo
yum update -y
yum install -y \
  kernel \
  kernel-devel \
  elfutils-libelf-devel \
  ca-certificates \
  clang \
  llvm \
  llvm-libs \
  llvm-devel \
  llvm-static
