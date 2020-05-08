variable "mysql_image" {
  default = "mysql:5.7"
}
variable "mysql_root_password" {
  default = "Lnx#2020"
}
variable "mysql_network_alias" {
  default = "db"
}
variable "mysql_voulme_name" {
  default = "ghost_mysql_data"
}
variable "mysql_internal_network" {
  default = "ghost_mysql_internal_network"
}
variable "ghost_image" {
  default = "ghost:alpine"
}
variable "ghost_db_username" {
  default = root
}
variable "ghost_db_name" {
  default = "ghost"
}
variable "ghost_network_alias" {
  default = "ghost"
}
variable "ghost_public_network" {
  default = "ghost_public_network"
}
variable "ghost_ext_port" {
  default = 80
}