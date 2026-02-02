{
  config,
  pkgs,
  username,
  stateVersion,
  ...
}:

let
  sockDir = "${config.xdg.runtimeDir}/run/host-services";
  sockPath = "${sockDir}/ssh-auth.sock";
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = stateVersion;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    wsl2-ssh-agent
  ];

  home.sessionVariables = {
    SSH_AUTH_SOCK = sockPath;
  };

  systemd.user.startServices = "suggest";

  systemd.user.services.wsl-ssh-agent = {
    Unit = {
      Description = "WSL SSH Agent Bridge";
    };

    Service = {
      Type = "simple";

      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p -m 700 ${sockDir}";

      ExecStart = "${pkgs.wsl2-ssh-agent}/bin/wsl2-ssh-agent --foreground --socket=${sockPath}";

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
