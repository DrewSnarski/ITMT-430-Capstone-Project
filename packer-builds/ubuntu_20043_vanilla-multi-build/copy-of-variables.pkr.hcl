variable "headless_build" {
  type =  bool
  default = true
  # If using the IIT Build Server - change this value to true
}

variable "memory_amount" {
  type =  string
  default = "4096"
}

variable "SSHPW" {
  sensitive = true
  type = string
  default = "vagrant"
}

variable "build_artifact_location" {
  type = string
  # default = "../build/"
  # If building the artifact on your local system -- keep the default
  # If you are building on the ITM Build Server (192.168.172.44) then 
  # uncomment the value below and comment out the initial default value
  # The teamXX can be replaced by your team number
  default = "/datadisk2/boxes/team01-"
}