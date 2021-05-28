{ pkgs, ... }:
let 
  mkWireGuard = { ip, name, endpoint, port, publicKey
  , dns ? []
  , persistentKeepalive ? 25
  , allowedIPs ? []
  , extraIPs ? [] }: {
    address = [ ip ] ++ extraIPs;
    privateKeyFile = "/etc/wireguard/${name}/private";
    peers = [
      {
        endpoint = "${endpoint}:${toString port}";
        inherit publicKey allowedIPs persistentKeepalive;
      }
    ];
  };
  hermes = {
    endpoint = "82.65.118.1"; # hermes.wg2.dev as IPv4.
    publicKey = "E8tYmhZ8oR5Pdhi3u7fvvdcDvK3GOjU561gmRPkPS1Q=";
  };
in
  {
    environment.systemPackages = with pkgs; [
      wireguard
    ];

    networking.wg-quick.interfaces = {
      wgv6 = mkWireGuard {
        ip = "2a01:e0a:5f9:9685::3/64";
        name = "hermes";
        port = 500;
        allowedIPs = [ "::/0" ];
        inherit (hermes) publicKey endpoint;
      };
      wgmgtdc1 = mkWireGuard {
        ip = "10.23.5.4/24";
        name = "hermes";
        port = 12501;
        allowedIPs = [ "10.32.64.1/24" "10.23.5.1/24" ];
        inherit (hermes) publicKey endpoint;
      };
    };
  }
