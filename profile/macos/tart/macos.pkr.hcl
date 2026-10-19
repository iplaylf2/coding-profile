packer {
  required_plugins {
    tart = {
      version = "= 1.21.0"
      source  = "github.com/cirruslabs/tart"
    }
  }
}

variable "ipsw" {
  type    = string
  default = "latest"
}

variable "vm_name" {
  type    = string
  default = "macos-dev"
}

variable "cpu_count" {
  type    = number
  default = 4
}

variable "memory_gb" {
  type    = number
  default = 8
}

variable "disk_size_gb" {
  type    = number
  default = 160
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
  from_ipsw          = var.ipsw
  vm_name            = var.vm_name
  cpu_count          = var.cpu_count
  memory_gb          = var.memory_gb
  disk_size_gb       = var.disk_size_gb
  disk_format        = "asif"
  recovery_partition = "keep"
  headless           = true
  disable_vnc        = true
  ssh_username       = "admin"
  ssh_password       = var.bootstrap_password
  ssh_timeout        = "30m"

  run_extra_args = [
    "--provisioning-opts=fullName=Developer,username=admin,password=${var.bootstrap_password},logsInAutomatically=false,enablesRemoteLogin=true"
  ]
}

build {
  sources = ["source.tart-cli.macos"]
}
