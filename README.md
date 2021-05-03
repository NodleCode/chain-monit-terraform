## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 3.63.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.63.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_chain"></a> [chain](#module\_chain) | ./modules/chain |  |
| <a name="module_jenkins"></a> [jenkins](#module\_jenkins) | ./modules/jenkins |  |
| <a name="module_storage"></a> [storage](#module\_storage) | ./modules/storage |  |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc |  |

## Resources

| Name | Type |
|------|------|
| [google_compute_project_metadata.default_project_metadata](https://registry.terraform.io/providers/hashicorp/google/3.63.0/docs/resources/compute_project_metadata) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_GOOGLE_BACKEND_CREDENTIALS"></a> [GOOGLE\_BACKEND\_CREDENTIALS](#input\_GOOGLE\_BACKEND\_CREDENTIALS) | n/a | `string` | n/a | yes |
| <a name="input_chain_tag_version"></a> [chain\_tag\_version](#input\_chain\_tag\_version) | n/a | `string` | `"sub3"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | n/a | yes |
| <a name="input_public_ssh_keys_map"></a> [public\_ssh\_keys\_map](#input\_public\_ssh\_keys\_map) | n/a | `map` | <pre>{<br>  "nofal": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1h0RZlJej1owu73Adu64PFHtPaEYAVcjE/Z/2zVoiyNmxfatCb55uOTQKNL/5Wh7eIvIvgti5EOG09mB4rG4X1e4Z3ZWLO+ZkNBB5kWINbJS9OBElONdUnHDko02CqaocPGStNkTF9+K4QiyzeAHx9/Zub0vAr2NFPA7az5yFjIUzA+5m6qfucUhxO9WlcpEu5hVx0CjlUswPLXTUUyJyE4y6FSKc2iYb5j39TAr4wsqMUfjWsJrvlZeQV94NGAf8zyKxCSZ6N5UBsAFsbOqOPrlOx/c1wVXSQcctuBgtcXr06OBuOza68M6QfSATTV2/UE3o+JJ8FL+PGjMMBWlzvodmfrE/+wACXVJFKeObyJmcUIspTNMcI6KBaH5KSgX1q0iBOnXJHe/2oLDCkI3QjDRGtXqgM/kaoE9V4RaNrpMG75YkvFYp5wdWGvuWYsi4eWySCCqsOhsiKSIg8suaw8bz7Cx+hEg3h6ve0sDcbunKz6NQ+DBYsCAxZYDfuh8= ahmad@ahmad-working-laptop"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
