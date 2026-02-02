{
  pkgs,
  username,
  stateVersion,
  ...
}:

let
  sockDir = "host-services";
  sockName = "ssh-auth.sock";
  sockPath = "${sockDir}/${sockName}";
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
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/${sockPath}";
  };

  systemd.user.startServices = "suggest";

  systemd.user.services.wsl-ssh-agent = {
    Unit = {
      Description = "WSL SSH Agent Bridge";
    };

    Service = {
      Type = "simple";

      RuntimeDirectory = sockDir;
      RuntimeDirectoryMode = "0700";

      ExecStart = "${pkgs.wsl2-ssh-agent}/bin/wsl2-ssh-agent --foreground --socket=%t/${sockPath}";

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
