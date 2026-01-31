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
          sha256 = "sha256-281c64f6079598de1a455292d533f3ae21837980a3d3012074bc14ad695325d8";
        };
        "aarch64-linux" = {
          url = "https://github.com/mame/wsl2-ssh-agent/releases/download/${version}/wsl2-ssh-agent-arm64";
          sha256 = "sha256-e9cb0347a72ca68a511e48779080b80a22af1bf670e5a52c9f35f95951ce5221";
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
