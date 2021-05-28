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

  # Beauty stuff for GNOME.
  programs.dconf.enable = true;

  # Useful packages.
  environment.systemPackages = with pkgs; [
    # Debugging & development tools.
    tcpdump gdb gradle python3Packages.virtualenv
    telnet heaptrack strace linuxPackages.perf lshw
    rustup gcc qemu clang-tools
    man man-pages posix_man_pages stdman
    pythonFull python3Full jq
    gitAndTools.gitFull inotify-tools
    sqliteInteractive curl remmina
    # config.boot.kernelPackages.bpftrace # yes, I'm really edgy.
    llvm haskellPackages.ghc
    # Lean
    elan # mathlibtools
    # Password management
    pass-wayland
    # System & monitoring tools.
    parted psmisc atop hdparm sdparm sysstat nload iftop
    smartmontools pciutils lsof schedtool dmidecode iotop
    usbutils w3m autossh lm_sensors
    # Shell tools.
    file parallel finger_bsd
    progress pv mc mkpasswd ripgrep zstd ag pixz
    mbuffer fd which bc ncdu ntfs3g picocom
    exfat dosfstools patchutils pmutils
    graphviz flameGraph pwgen tree
    # File transfer tools.
    rsync rtorrent unison sshfsFuse borgbackup
    # Build system
    cmake gnumake
    # Nix tools.
    nox nix-prefetch-scripts
    # Video manipulation
    mkvtoolnix-cli ffmpeg-full
    # Image-manipulation tools
    fgallery pngcrush imagemagickBig

    # LaTeX
    (texlive.combine {
      inherit (texlive) scheme-medium enumitem sectsty;
    })
    # Wayland
    grim slurp wf-recorder wl-clipboard
    # Great tooling
    pdftk pandoc zathura taskwarrior # beets
    masterpdfeditor4
    # Misc tooling
    mp3gain aspell
    # Misc Misc
    zip unzip shared_mime_info
    unrar encfs pdftk neofetch
  ];

  # Here we go again.
  virtualisation.docker.enable = false;

  # Locator
  services.locate.enable = true;
}
