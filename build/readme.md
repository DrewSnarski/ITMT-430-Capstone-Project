(On the build server)
1) Go to where your Team repository is and do a git pull (Note: If you are doing this in Windows Powershell, you MUST run it as administrator)
   a. If you do not yet have it, run git clone git@github.com:illinoistech-itm/2022-team01m.git
2) cd packer-builds - > ubuntu_20043_vanilla-multi-build
3) Execute mv copy-of-variables.pkr.hcl variables.pkr.hcl
4) Execute vim variables.pkr.hcl
   a. enter all the appropriate usernname, password, ip address information for the blank default = "" lines
   b. save and exit vim (:wq)
5) Generate a new ssh key
   a. ssh-keygen -t ed25519
		i. save it to /datadisk1/home/(HAWKID)/2022-team01m/packer-builds/ubuntu_20043_vanilla-multi-build/id_ed25519_build_server_key
   b. Execute cat id_ed25519_build_server_key.pub and copy it
6) Go to https://github.com/illinoistech-itm/2022-team01m , settings on the top row, deploy keys on the sidebar, add new deploy key. Paste your public key and give it a name
7) Execute vim config. It should read the following and save (:wq)

Host github.com
   User (github username)
   Hostname github.com
	StrictHostKeyChecking no
	IdentityFile /home/vagrant/.ssh/id_ed25519_build_server_key

8) exit build server and go to your local team01 repo

(On your local system)
9) cd to build ->
   a. Windows Powershell - powershell
   b. Mac or Windows Terminal- bash
      i. If you have any vagrant boxes currently running, execute halt script
         a. Windows Powershell - .\halt.ps1
         b. Mac or Windows Terminal - sh ./halt.sh (prior leading sh only needed for Mac, it seems)
            1. If you are getting permission denied, try chmod +x ./(script).sh then re-run

10) Execute remove-and-retrieve-and-add-vagrant-boxes script
   a. Powershell - .\remove-and-retrieve-and-add-vagrant-boxes.ps1 01
   b. Mac or Terminal - sh ./remove-and-retrieve-and-add-vagrant-boxes.sh 01
11) Run Up script
   a. Powershell - .\up.ps1
   b. Mac or Terminal - sh ./up.sh (prior leading sh only needed for Mac, it seems)
12) cd to desired vagrant file (db, lb, ws1, ws2, ws3)
13) Enter vagrant ssh
14) The team repo is already pre-downloaded, so you can just cd right into it and make any changes you want.
   a. Note: Any changes made here are temporary and are removed when you run the remove-and-retrieve script. In order to save this code, it must be copied back out into your LOCAL HOST team repo and pushed back to Github
15) After making necessary changes, exit the vagrant box and cd back to where you ran the remove-and-retrieve script and execute the halt script
   a. Powershell - .\halt.ps1
   b. Mac or Terminal - sh ./halt.sh
16) Rinse and repeat steps 8-13
