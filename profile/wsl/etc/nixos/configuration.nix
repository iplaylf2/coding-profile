{
  userName,
  proxy,
  ...
}:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  wsl.enable = true;
  wsl.defaultUser = userName;
  wsl.docker-desktop.enable = true;
}
// (
  if proxy == null then
    { }
  else
    let
      address = proxy.address;
      httpUrl = "http://${address}";
      socksUrl = "socks5://${address}";
    in
    {
      systemd.services.nix-daemon.environment = {
        http_proxy = httpUrl;
        https_proxy = httpUrl;
        all_proxy = socksUrl;
      };
    }
)
