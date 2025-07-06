variable "rg_names" {

}
variable "storage_accounts" {
  type = map(object({
    name                     = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}