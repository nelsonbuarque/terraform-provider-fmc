variable "fmc_username" {
    type = string
    sensitive = true
    default = "terraformapi"
}

variable "fmc_password" {
    type = string
    sensitive = true
    default = "C1sFMCT3rrafor"
}

variable "fmc_host" {
    type = string
    default = "142.40.22.179"
}

variable "fmc_insecure_skip_verify" {
    type = bool
    default = true
}
