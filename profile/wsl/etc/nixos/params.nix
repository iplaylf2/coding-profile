{
  system = "x86_64-linux";
  hostName = "nixos";
  userName = "i-use-wsl";

  proxy = {
    address = "host.docker.internal:7897";
  };
}
