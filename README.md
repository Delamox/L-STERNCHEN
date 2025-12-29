# L-STERNCHEN
A desktop shell designed to integrate the Signalis user interface into your Linux machine.

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/fbc452e6-81ed-498e-97e4-b6b6a52d47ee" />


## Features
Overlay:
- Receiver panel containing media integration, a volume indicator and a visualiser.
- Memory panel containing an app launcher.
- Diagnostics panel that does nothing but sure looks cool, although the health indicator does show your battery status, and pulses if you are charging.
- Custom written shaders to best replicate the real overlay.

## Usage
The executable is available as `L-STERNCHEN` in your shell.
Currently does not feature customisation, the project is still work-in-progress.

Set hotkeys in your hyprland.conf, the buttons can be customised:
```hyprlang
bind = $mainMod, Tab, global, quickshell:visibility
bind = $mainMod, R, global, quickshell:launcher
```

The overlay can be opened with your visibility keybind. The buttons and scanner in the receiver panel can be interacted with to control your media player.
Opening the overlay with your launcher keybind will automatically focus the launcher inputbox, begin typing and use the arrow keys to select the desired entry, then press enter to launch it. 


## Installation
Currently only supports Nix through flakes, an example flake configuration is provided below.

> [!WARNING]
> Only works on Hyprland.

Example flake.nix:
```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    L-STERNCHEN = {
      url = "github:Delamox/L-STERNCHEN";
      inputs.nixpkgs.follows = "nixpkgs";
    }
  };

  outputs = inputs @ { nixpkgs, L-STERNCHEN }: {
    # change `yourhostname` to your actual hostname
    nixosConfigurations."yourhostname" = nixpkgs.lib.nixosSystem {
      # customize to your system
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        L-STERNCHEN.nixosModules.L-STERNCHEN
      ];
    };
  };
}
```
Then add this to your configuration.nix:
```nix
programs.L-STERNCHEN.enable = true;
```
