{ config, inputs, username, ... }:
{
  # Homebrew installation itself, with pinned taps
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = username;
    autoMigrate = true;
    mutableTaps = true;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
      "argoproj/homebrew-tap" = inputs.homebrew-argoproj;
    };
  };

  # Declarative package list (brew bundle)
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    enableZshIntegration = true;
    global.autoUpdate = true;

    # Declare the taps nix-homebrew manages so `brew bundle cleanup` doesn't try to untap them
    taps = builtins.attrNames config.nix-homebrew.taps;

    brews = [
      # Kubernetes / cloud
      "ansible"
      "ansible-lint"
      "awscli"
      "azure-cli"
      "eksctl"
      "hcloud"
      "helm"
      "k8sgpt"
      "k9s"
      "kind"
      "kubecolor"
      "kubernetes-cli"
      "kubeshark"
      "minikube"
      "oci-cli"
      "opentofu"
      "stern"

      # Containers
      "colima"
      "docker"
      "docker-completion"
      "docker-compose"
      "lima"
      "podman"

      # Languages / runtimes
      "go"
      "lua"
      "lua@5.4"
      "node"
      "pyenv"
      "python@3.13"
      "python@3.14"
      "ruby"

      # Shell / CLI utilities
      "bat"
      "binutils"
      "coreutils"
      "findutils"
      "fzf"
      "htop"
      "jless"
      "jo"
      "jq"
      "moreutils"
      "p7zip"
      "powerlevel10k"
      "pstree"
      "rsync"
      "screen"
      "sqlite"
      "ssh-copy-id"
      "tmux"
      "trash"
      "tree"
      "vim"
      "watch"
      "yq"
      "zsh-completions"

      # Networking
      "dnstracer"
      "dnsx"
      "iproute2mac"
      "nmap"
      "socat"

      # Build tools and libraries. Kept explicit so `cleanup = "uninstall"` doesn't
      # remove them from under pyenv-built Pythons and other locally compiled tools.
      "autoconf"
      "ca-certificates"
      "certifi"
      "cffi"
      "cryptography"
      "gettext"
      "gmp"
      "libevent"
      "libgit2"
      "liblinear"
      "libsodium"
      "libssh"
      "libssh2"
      "libunistring"
      "libyaml"
      "llhttp"
      "lz4"
      "m4"
      "mpdecimal"
      "ncurses"
      "oniguruma"
      "openssl@3"
      "pcre2"
      "pkgconf"
      "popt"
      "pycparser"
      "readline"
      "rpds-py"
      "utf8proc"
      "xxhash"
      "xz"
      "zstd"
    ];

    casks = [
      "1password"
      "bitwarden"
      "caffeine"
      "claude"
      "copyclip"
      "dbeaver-community"
      "docker-desktop"
      "font-jetbrains-mono-nerd-font"
      "font-meslo-for-powerlevel10k"
      "gcloud-cli"
      "google-chrome"
      "grammarly-desktop"
      "iterm2"
      "maccy"
      "macdirstat"
      "microsoft-teams"
      "mstystudio"
      "obsidian"
      "pearcleaner"
      "rapidapi"
      "raycast"
      "slack"
      "visual-studio-code"
      "vlc"
      "windows-app"
      "zoom"
    ];
  };
}
