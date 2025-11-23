qemu-system-x86_64 \
  -drive file=ubu-maui.qcow2,format=qcow2 \
  -m 22G \
  -cpu host \
  -enable-kvm \
  -smp cores=4,threads=2,sockets=1 \
  -machine vmport=off \
  -display none \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-pci,netdev=net0
# ssh -XC -p 2222 user@localhost
# code

# Install waypipe on both
# Use wayland on local

# sudo apt install waypipe
# sudo dnf install waypipe

# On remote: `waypipe server`

# On local: `waypipe --no-gpu ssh -p 2222 user@localhost "code --new-window --wait --ozone-platform=wayland"`
