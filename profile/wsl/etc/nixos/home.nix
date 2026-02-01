{
  config,
  pkgs,
  username,
  stateVersion,
  ...
}:

let
  wsl2-ssh-agent = pkgs.callPackage ./pkgs/wsl2-ssh-agent.nix { };

  sockDir = "${config.home.homeDirectory}/run/host-services";
  sockPath = "${sockDir}/ssh-auth.sock";
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = stateVersion;

  programs.home-manager.enable = true;

  home.packages = [
    wsl2-ssh-agent
  ];

  programs.bash.enable = true;
  programs.bash.initExtra = ''
    export SSH_AUTH_SOCK="${sockPath}"
  '';

  systemd.user.startServices = "suggest";

  systemd.user.services.wsl-ssh-agent = {
    Unit = {
      Description = "WSL SSH Agent Bridge";
    };

    Service = {
      Type = "simple";

      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${sockDir}";

      ExecStart = "${wsl2-ssh-agent}/bin/wsl2-ssh-agent --foreground --socket=${sockPath}";

      Restart = "on-failure";
      RestartSec = 2;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.services.docker-desktop = {
    Unit = {
      Description = "Start Docker Desktop";
    };

    Service = {
      Type = "oneshot";

      RemainAfterExit = true;

      ExecStart = "/mnt/c/Windows/System32/cmd.exe /c start \"\" \"%%ProgramFiles%%/Docker/Docker/Docker Desktop.exe\"";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
