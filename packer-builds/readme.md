# Please note this document assumes you have already successfully implemented Drew's server build document located at https://github.com/illinoistech-itm/2022-team01m/tree/main/build#readme.

# Server build configuration (one-time only)
1. rename and edit variables.pkr.hcl:
	* `ssh -i ~/.ssh/id_ed25519_username_key username@192.168.172.44`
	* `cd ~/2022-team01m/packer-builds/ubuntu_20044_vanilla-multi-build`
	* `git pull`
	* `mv template-for-variables.pkr.hcl variables.pkr.hcl`
	* `vi variables.pkr.hcl`
	* edit lines 74, 80 with credentials from Prof. Hajek
	* save and quit

# Server build process (repeat as necessary for new server builds)
1. to build:
	* `ssh -i ~/.ssh/id_ed25519_username_key username@192.168.172.44`
	* `cd ~/2022-team01m/packer-builds/ubuntu_20044_vanilla-multi-build`
	* `git pull`
	* `packer build .`
2. to build failed servers individually:
	* `cd ~/2022-team01m/packer-builds/ubuntu_20044_vanilla-multi-build`
	* `git pull`
	* build the server want (change the server name as appropriate: ws1/ws2/ws3/db/lb or the proxmox equivalant)
	* `packer build -only "virtualbox-iso.ws1" .`
	* or multiples (no space after the comma)
	* `packer build -only "virtualbox-iso.ws1,virtualbox-iso.db"`

# Terraform build configuration (one-time only)
1. SSH to build server:
	* `ssh -i ~/.ssh/id_ed25519_username_key username@192.168.172.44`
	* `cd ~/2022-team01m/packer-builds/terraform/proxmox-three-tier-application-ubuntu`
	* `git pull`
2. create a new ssh key:
	* `ssh-keygen -t ed25519`
	* file: `./id_ed25519_proxmox_terraform_deploy_key`
3. cat the new key file and copy/paste the string into the file:
	* `cat id_ed25519_proxmox_terraform_deploy_key`
	* copy/paste file contents into:
	* `vi ~/2022-team01m/packer-builds/ubuntu_20044_vanilla-multi-build/subiquity-proxmox/http/user-data`
	* under authorized-keys (within the single quotes)
4. rename and edit terraform.tfvars and add your ssh key file name:
	* `mv template-terraform.tfvars terraform.tfvars`
	* `vi ~/2022-team01m/packer-builds/terraform/proxmox-three-tier-application-ubuntu/terraform.tfvars`
	* edit lines 6, 7 with credentials from Prof. Hajek
	* verify line 8
	* change lines 27, 28, 29 to add your initials instead of mine if you want
	* save and quit
5. run `terraform init`
6. run `terraform validate`

# Terraform build process (repeat as necessary for new cloud server deployments)
1. you are ready to deploy by running:
	* `terraform destroy` (if you did not deploy the existing running proxmox servers, you will need to manually stop and delete them via the proxmox admin console at `https://192.168.172.41:8006` prior to deploying again (or have the person who deployed them run terraform destroy). The terraform destroy command only works with destroying servers that you have previously deployed.
	* `terraform apply -parallelism=1`
	* (this command will deploy the new proxmox servers)
