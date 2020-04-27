{ config, pkgs, ... }:
{
  # License to kill.
  services.earlyoom.enable = true;

  # I like my man.
  documentation.dev.enable = true;
  environment.extraOutputsToInstall = [ "info" "man" "devman" ];

  # I debug my network everyday.
  programs.mtr.enable = true;
  programs.wireshark.enable = true;

  # When vim is not available.
  programs.nano.nanorc = ''
    set nowrap
  '';

  # It's a pleasure.
  programs.mosh.enable = true;
  programs.tmux.enable = true;

  # Useful packages.
  environment.systemPackages = with pkgs; [
    # Debugging & development tools.
    tcpdump gdb gradle python3Packages.virtualenv
    telnet heaptrack strace linuxPackages.perf lshw
    rustup gcc qemu clang-tools cargo
    man man-pages posix_man_pages stdman
    pythonFull python3Full binutils jq
    gitAndTools.gitFull inotify-tools
    sqliteInteractive curl
    config.boot.kernelPackages.bpftrace # yes, I'm really edgy.
    llvm haskellPackages.ghc
    # Password management
    pass
    # System & monitoring tools.
    parted psmisc atop hdparm sdparm whois sysstat nload iftop
    smartmontools pciutils lsof schedtool dmidecode iotop
    usbutils w3m autossh inetutils lm_sensors
    # Shell tools.
    file parallel moreutils finger_bsd
    progress pv mc mkpasswd ripgrep zstd ag pixz
    mbuffer fd which bc ncdu ntfs3g picocom
    exfat dosfstools patchutils pmutils
    graphviz flameGraph pwgen tree
    # File transfer tools.
    rsync rtorrent unison sshfsFuse borgbackup
    # Build system
    cmake gnumake
    # Nix tools.
    nox nix-prefetch-git nix-prefetch-scripts
    # Video manipulation
    mkvtoolnix-cli ffmpeg-full
    # Image-manipulation tools
    fgallery pngcrush imagemagickBig
    # LaTeX
    (texlive.combine {
      inherit (texlive) scheme-small enumitem sectsty;
    })
    # Wayland
    grim slurp wf-recorder wl-clipboard
    # Great tooling
    beets pdftk pandoc zathura taskwarrior
    # Misc tooling
    mp3gain aspell
    # Misc Misc
    zip unzip shared_mime_info p7zip
    unrar encfs pdftk neofetch
  ];

  # Locator
  services.locate.enable = true;
}
