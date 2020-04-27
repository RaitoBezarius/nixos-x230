{ pkgs, ... }:
let 
  my_ip = "10.240.0.3/24";
  my_ipv6 = "fd20:6753:f7af:f551::2/64"; # un petit préfixe /64 pépouze.
in
{
  environment.systemPackages = with pkgs; [
    wireguard
  ];

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ my_ip my_ipv6 ];
      dns = [ "127.0.0.1" "1.1.1.1" "1.0.0.1" ];

      privateKeyFile = "/etc/wireguard/private";

      peers = [
        {
          endpoint = "vpn.vieux.newtype.fr:50999";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          persistentKeepalive = 25;
          publicKey = "vqyxmx6XAuem+obsJRQeSPoih3DPHmatDxd9ztPnYFs=";
        }
      ];
    };
  };
}
