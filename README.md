# MacOS Laptop Configuration

This repository handles all `~/.config` that I prefer to include when setting up a new MacBook.

Note: this excludes certain configuration, but that can be modified in [`.gitignore`](./.gitignore)

## Getting Started

1. Patiently Install Dependencies
   ```bash
   xcode-select --install
   ```

2. Install [Nix](https://nixos.org/download.html).

    ```
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    ```

    To enable them, add the following to your `/etc/nix/nix.conf`:
    ```
    experimental-features = nix-command flakes
    ```

3. Install [Brew](https://brew.sh/)
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   
## How to use

1. Clone this repository in `~/`:
   ```bash
   git clone git@github.com:willsather/.config.git
   cd .config
   ```

2. Update the `/machine` configuration with your details:

   Open `flake.nix` and set:
    - `hostname`: Your machine's hostname.
    - `username`: Your macOS username.
    - `system`: Your system architecture (e.g., `x86_64-darwin` or `aarch64-darwin`).

   Example:
   ```
    username = "willsather"; # FIXME: update to username
    system = "aarch64-darwin"; # FIXME: set system architecture as aarch64-darwin or x86_64-darwin
    hostname = "will-laptop"; # FIXME: update to machine hostname
   ```

3. Apply the configuration:
   ```bash
   nix run nix-darwin -- switch --flake ./machine
   ```

   This will:
    - Install Nix-Darwin if not already installed.
    - Apply the configurations defined in the flake.


