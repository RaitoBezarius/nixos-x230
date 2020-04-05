{ pkgs, ... }:
let my_ip = "10.240.0.3/24";
in
{
  environment.systemPackages = with pkgs; [
    wireguard
  ];

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ my_ip ];
      dns = [ "1.1.1.1" ];

      privateKeyFile = "/etc/wireguard/private";

      peers = [
        {
          endpoint = "vpn.vieux.newtype.fr:50999";
          allowedIPs = [ "0.0.0.0/0" ];
          persistentKeepalive = 25;
          publicKey = "vqyxmx6XAuem+obsJRQeSPoih3DPHmatDxd9ztPnYFs=";
        }
      ];
    };
  };
}
