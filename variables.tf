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
    eliott : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3NGKCRfi2gh8mHF8u0tFFcv/H0BQyY8KHrO5OXsusUTnI0ll97Y238wt8wqo+hoea+Hzu67uT7VI58YlqMhxY52YhqlX1k5EAKhNRwvabnC11wR8cI6/Jo+W8b6o8Sf79IUMojUfg9Xc9VzGCias35+emkIeEO7QBkT2wDihFkjjIunqch3niaHS9tyM7Bd2uxZlxtFLkj4LqNcwRx6m6czrrICZpgMzTiq8ZABxiBGyhmjcKyj2PX4/5W6kYJGFLbhC9c5iUixRo2Rl590fQCX0+8y1/lOpjBfoDpLSbFONqMWxPxNOU6DS8XJEgf07zEa98ZH/NJyeeVCoUb1QVTSL13VVJARS54X5ygB0mLoUypp+JuP83fCh7b+g+P+cIxOnliGhU/1gXzMQXHX1Gb/plEJqLmzlFfBjyZnkGmkv0rdxPnt3ckWrIliALY8gqeJyf7/9IWYR7u+2ZCEfLpvKDGuJhE9BNmGQuosTiU0BXHcUXG10Gh3AVJK/Bovk= eliottteissonniere@Pandora.local",
  }
  description = "SSH Keys with user for the VMs"
}

variable "chain_tag_version" {
  default     = "2.0.7"
  description = "Version of nodle chain to deploy"
}
