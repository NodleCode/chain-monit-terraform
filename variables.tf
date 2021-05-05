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
    loictosser : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWk977LhEyAprSulC/OITPioNV9f0OCEvAKAMpCN9uhkWc8t7v4Bclylhpb2Rb1JW1yuKREDZh1dW/w5hzkGFYttPaoKfWYzZVG9pqWE0ZVk0YaHbm4wf66IRULqKG1Vpc9oHYUayqSD3UAKJ6SdFptEmqMEcufgCt76etCrUTTKxaRx9IBbt8hBuZAbr+uKVRQBRD1kStCZ8ZE0pT4+iH1ws7jVop/7r8j7ZnOTKH2oH2Gn5XskEYUcK32ecIh7L+/Zvxw7clKG7HRN7SP4GuLwHAOj8eYAufZkG0uyy/Vu0HxSbBfWqCeJlFAH5Ly/V3wYejOmW7C3GNPGEroFZlTVU4npWNciQtyLd//tbiXX6XG01aBaOw8YxIZZmRcKM+zrDzTyhzmZEmz8z7PjsQhC9ZSvGydZxw95YInJJrbmA97zVqZvfmgOYPXaCg4Hk0m8KkWvDC+kKVSCZtotd+Pcq4KglI6nGzUly/LTco35MXx7zFkApoI3u8MxKoWkc= loictosser@nodle",
    eliott : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3NGKCRfi2gh8mHF8u0tFFcv/H0BQyY8KHrO5OXsusUTnI0ll97Y238wt8wqo+hoea+Hzu67uT7VI58YlqMhxY52YhqlX1k5EAKhNRwvabnC11wR8cI6/Jo+W8b6o8Sf79IUMojUfg9Xc9VzGCias35+emkIeEO7QBkT2wDihFkjjIunqch3niaHS9tyM7Bd2uxZlxtFLkj4LqNcwRx6m6czrrICZpgMzTiq8ZABxiBGyhmjcKyj2PX4/5W6kYJGFLbhC9c5iUixRo2Rl590fQCX0+8y1/lOpjBfoDpLSbFONqMWxPxNOU6DS8XJEgf07zEa98ZH/NJyeeVCoUb1QVTSL13VVJARS54X5ygB0mLoUypp+JuP83fCh7b+g+P+cIxOnliGhU/1gXzMQXHX1Gb/plEJqLmzlFfBjyZnkGmkv0rdxPnt3ckWrIliALY8gqeJyf7/9IWYR7u+2ZCEfLpvKDGuJhE9BNmGQuosTiU0BXHcUXG10Gh3AVJK/Bovk= eliottteissonniere@Pandora.local",
  }
  description = "SSH Keys with user for the VMs"
}

variable "chain_tag_version" {
  default     = "sub3"
  description = "Version of nodle chain to deploy"
}
