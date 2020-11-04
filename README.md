# redbpf-postprocessing

Minimal repro of workaround referenced in https://github.com/redsift/redbpf/issues/100 and detailed in https://github.com/aquarhead/protect-the-rabbit/blob/master/Makefile.toml#L10-L18

Run by installing [virtualbox](https://www.virtualbox.org/wiki/Downloads), [vagrant](https://www.vagrantup.com/downloads.html), and then running `vagrant up` from the project root. You'll need to enter a password for ssh. It is `vagrant`. The `system.sh` and `user.sh` should do the end to end flow of:

* Creating a VM
* Installing system dependencies
* Installing rust
* Installing cargo bpf
* Building the sample program
* Postprocessing the elf file to make it loadable by `ip`
* Loading the file by `ip`
* Verifying that the file was loaded by `ip`. The `eth0` interface should show `xdpgeneric` in the output.

After `vagrant up` runs, you can log in and poke around with `vagrant ssh`. You'll need to enter the password (`vagrant`)
