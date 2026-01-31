{ stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "wsl2-ssh-agent";
  version = "v0.9.7";

  src =
    let
      system = stdenvNoCC.hostPlatform.system;
      artifacts = {
        "x86_64-linux" = {
          url = "https://github.com/mame/wsl2-ssh-agent/releases/download/${version}/wsl2-ssh-agent";
          sha256 = "sha256-KBxk9geVmN4aRVKS1TPzriGDeYCj0wEgdLwUrWlTJdg=";
        };
        "aarch64-linux" = {
          url = "https://github.com/mame/wsl2-ssh-agent/releases/download/${version}/wsl2-ssh-agent-arm64";
          sha256 = "sha256-6csDR6cspopRHkh3kIC4CiKvG/Zw5aUsnzX5WVHOUiE=";
        };
      };

      artifact =
        if builtins.hasAttr system artifacts then
          artifacts.${system}
        else
          throw "wsl2-ssh-agent: unsupported hostPlatform.system=${system}";
    in
    fetchurl artifact;

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 "$src" "$out/bin/wsl2-ssh-agent"
    runHook postInstall
  '';
}
