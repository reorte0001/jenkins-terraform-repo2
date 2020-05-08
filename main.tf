resource "docker_service" "mysql-server" {
  name = var.mysql_network_alias
  task_spec {
    container_spec {
      image = var.mysql_image
      env = {
        MYSQL_ROOT_PASSWORD = var.mysql_root_password
      }
      mounts {
        target = "/var/lib/mysql"
        type = "volume"
        source = docker_volume.mysql_data_volume.name
      }
    }
    networks = [docker_network.private_bridge_network.name]
  }
}
resource "docker_service" "ghost-service" {
  name = "ghost"
  task_spec {
    container_spec {
      image = var.ghost_image
      env = {
        database_client = "mysql"
        database_connection_host = var.mysql_network_alias
        database_connection_user = var.ghost_db_username
        database_connection_password = var.mysql_root_password
        database_connection_database = var.ghost_db_name
      }
    }
    networks = [docker_network.public_bridge_network.name, docker_network.private_bridge_network.name]
  }
  endpoint_spec {
    ports {
      target_port = 2368
      published_port = var.ghost_ext_port
    }
  }
}