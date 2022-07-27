output "webserver_public_ip" {
  value = toset([ for instance in aws_instance.webserver: instance.public_ip])
}

output "webserver_public_dns" {
  value = tomap({ for az, instance in aws_instance.webserver: az => instance.public_dns})
}