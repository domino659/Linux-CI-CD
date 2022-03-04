terraform {
  required_providers {
    proxmox = {
      source    = "telmate/proxmox"
      version   = "2.9.6"
    }
  }
}

provider "proxmox" {
  pm_api_url            = "https://espace.gwath-land.fr/api2/json"
  pm_api_token_id       = "lolog@pam!tst"
  pm_api_token_secret   = "773e3786-8922-4115-a101-0b2dd442290a"
  pm_tls_insecure       = true
}

resource "proxmox_lxc" "my_container" {
  target_node     = "ns3077523"
  hostname        =  "ganymede"
  ostemplate      = "template:vztmpl/debian-11-standard_11.0-1_amd64.tar.gz"
  password        = "AwasawA1234"
  unprivileged    = true

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHo+vkYbYsM1IRjfh18KbkP0inFL6LfVZV5aKxm2jwhU gwatharta@oxygene-14/10/2020
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGRcoQQLa0PB7j9kjF2SJ8xpfW97nktu69AEdcejhDry domino659 15/02/2022
  EOT

  start           = true
  vmid            = "802"
  memory          = "512"
  cores           = "1"
  pool            = "CT-TEST"
  searchdomain    = "gwath-land.fr"

  rootfs {
    storage       = "backup"
    size          = "10G"
  }

  network {
    name          = "eth0"
    bridge        = "vmbr0"
    firewall      = false
    gw            = "147.135.129.254"
    hwaddr        = "02:00:00:e4:56:d2"
    ip            = "213.32.112.171/32"
  }
}
