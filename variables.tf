variable "GOOGLE_BACKEND_CREDENTIALS" {
 type        = string
 default     = ""
 description = "Google credentials"
}

variable "project_id" {
  type        = string
  default     = "nodle-chain-d08ab"
  description = "id of the project"
}
variable "region" {
  type        = string
  default     = "us-central1"
  description = "region of GCP to deploy the project"
}
variable "zone" {
  type        = string
  default     = "us-central1-f"
  description = "zone of GCP to deploy the project"
}
variable "public_ssh_keys_map" {
  default = {
    nofal : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1h0RZlJej1owu73Adu64PFHtPaEYAVcjE/Z/2zVoiyNmxfatCb55uOTQKNL/5Wh7eIvIvgti5EOG09mB4rG4X1e4Z3ZWLO+ZkNBB5kWINbJS9OBElONdUnHDko02CqaocPGStNkTF9+K4QiyzeAHx9/Zub0vAr2NFPA7az5yFjIUzA+5m6qfucUhxO9WlcpEu5hVx0CjlUswPLXTUUyJyE4y6FSKc2iYb5j39TAr4wsqMUfjWsJrvlZeQV94NGAf8zyKxCSZ6N5UBsAFsbOqOPrlOx/c1wVXSQcctuBgtcXr06OBuOza68M6QfSATTV2/UE3o+JJ8FL+PGjMMBWlzvodmfrE/+wACXVJFKeObyJmcUIspTNMcI6KBaH5KSgX1q0iBOnXJHe/2oLDCkI3QjDRGtXqgM/kaoE9V4RaNrpMG75YkvFYp5wdWGvuWYsi4eWySCCqsOhsiKSIg8suaw8bz7Cx+hEg3h6ve0sDcbunKz6NQ+DBYsCAxZYDfuh8= ahmad@ahmad-working-laptop",
  }
  description = "SSH Keys with user for the VMs"
}

variable "chain_tag_version" {
  default     = "sub3"
  description = "Version of nodle chain to deploy"
}
