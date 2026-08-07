# qylad-nixos

A Nix flake for my personal systems.

## Flake Outputs

### `qylad-msi`

Personal host configuration for my main laptop hardware. It is
hardware-dependent and not intended to be built or run on other machines.

### `qylad-msi-vm`

Virtual machine mirror to `qylad-msi`

```bash
nix run github:Debieche-Amine/qylad-nix#qylad-msi-vm
```

### `vm-test`

Test virtual machine environment.

```bash
nix run github:Debieche-Amine/qylad-nix#vm-test
```

### `just-a-vm`

Standalone test virtual machine instance.

```bash
nix run github:Debieche-Amine/qylad-nix#just-a-vm
```
