output "ssh_command_for_pnap" {
  value       = module.baremetal-anthos-cluster.ssh_command
  description = "Command to run to SSH into the bastion host"
}

output "ssh_key_path" {
  value       = module.baremetal-anthos-cluster.ssh_key_path
  description = "Path to the SSH Private key for the bastion host"
}

output "pnap_bastion_host_ip" {
  value       = module.baremetal-anthos-cluster.bastion_host_ip
  description = "IP Address of the bastion host in the test environment"
}

output "pnap_bastion_host_username" {
  value       = module.baremetal-anthos-cluster.bastion_host_username
  description = "Username for the bastion host in the test environment"
}
