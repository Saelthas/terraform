
resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "az account show"
  }
  
}
resource "tls_private_key" "generated" {
  algorithm = "RSA"
}
resource "local_file" "private_key" {
  content = tls_private_key.generated.private_key_pem
  filename = "myazkey.pem"
}