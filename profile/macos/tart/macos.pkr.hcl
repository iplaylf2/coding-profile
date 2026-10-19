packer {
  required_plugins {
    tart = {
      version = "= 1.21.0"
      source  = "github.com/cirruslabs/tart"
    }
  }
}

variable "bootstrap_password" {
  description = "Password for the macOS admin account and Packer's SSH connection."
  type        = string
  sensitive   = true

  # The pinned Tart plugin interpolates this password into a shell at shutdown.
  validation {
    condition     = can(regex("^[A-Za-z0-9]+$", var.bootstrap_password))
    error_message = "Use an alphanumeric password for compatibility with the Tart plugin."
  }
}

source "tart-cli" "macos" {
  from_ipsw          = "latest"
  vm_name            = "macos-dev"
  disk_format        = "asif"
  recovery_partition = "keep"
  headless           = true
  disable_vnc        = true
  ssh_username       = "admin"
  ssh_password       = var.bootstrap_password

  run_extra_args = [
    "--provisioning-opts=fullName=Developer,username=admin,password=${var.bootstrap_password},logsInAutomatically=false,enablesRemoteLogin=true"
  ]
}

build {
  sources = ["source.tart-cli.macos"]
}
