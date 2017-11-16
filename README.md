# Vagrant Lamp Starter

## Introduction
This is a beginner-friendly starter pack that will automate the setup of a LAMP development environment for vagrant.

## What's Included
  * Ubuntu 16.04
  * Apache 2
  * Mysql
  * PHP 7
  * Python 2.7
  * PhpMyAdmin
  * Git
  * Composer

## Requirements
Before you use this repo, you will need to have the following:
* Some basic understanding of what the [LAMP](http://stackoverflow.com/questions/10060285/what-is-a-lamp-stack) Stack is.

* The idea of developing on a [virtual machine](https://www.chriswiegman.com/2013/08/virtual-machines-the-holy-grail-of-local-web-development/).

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

* A ssh-capable terminal shell. If you're a windows user, you should install one of the following terminal emulators to follow along:
  * [Cmder](http://cmder.net/)
  * [Git Bash](https://git-scm.com/downloads)
  * [Cygwin](https://www.cygwin.com/)

## Getting Started
Once you have the above requirements, open your terminal and use the [cd command](http://www.computerhope.com/unix/ucd.htm) to go to the directory where you want to store your projects.

Next, choose a project folder name and clone the repo:

    $ git clone https://github.com/crisnoel12/vagrant-lamp-starter.git project-folder-name

You should have a newly created folder with the repo files.

Now cd into the created folder

    $ cd project-folder-name

and remove the `.git` directory

    $ rm -rf .git

Next we will install the [Vagrant-Triggers](https://github.com/emyl/vagrant-triggers) plugin, to be able to backup your databases.

Just use this command to install it and it should be good to go:

    $ vagrant plugin install vagrant-triggers

We can finally boot up our virtual machine with:

    $ vagrant up

This will install the `ubuntu/trusty32` box if you dont already have it, the first time you run `vagrant up`.

Depending on your internet connection, the setup will take some time.

Once the install is finished you should see this webpage when you enter `192.168.33.10` in the browser:

![Vagrant Lamp Starter Screenshot](https://lh3.googleusercontent.com/bR9_bu_1osMGEXyctwuIUftZ8w_xYpH_9knVIIxEiYfsgq75BSHgA4x51Dlo4Y_vxILs6N8HwEB3zjXQbqIahy9oRDAQjqTgJB6KeFDL2JA3quJE1hpMfYcq9xZqrh7AEyq8dDh61PaQqrukmtnlxtalrxI8flV2aiJSdqBZ_sY2emMV9X19hppgxo5Fhij_DowThh7owe7FtSybv2VN726wtg8roOjJs_B-GqCe6iArLbKOqh6cHyxrlCOONP9IN9bGUvEH4p_hRhA3apENs1-E0b-Ywx4Jz1Dnzyv-Yz5eV8qVNsFzU9M--ZG_az1260O1cPkkTIjWjnT864xWUUJS166fvlGe54g-ybh4XQfG9b5kq6UeNx52pdjraze4nkgJSjz0UXxlBtZVLYa2dORv0O9DTYzY4zMOweFzbBg-CcEwfo0C78_O0Z_5INAZFMbr9NW_s-5LP6yYsZchJ_7Dm2YdRh3rIKY1s5WfgrksdqEvdl2XUZFNLGnoTf2cpuTb4wATcX15EeM2jn1TI-ZeEHwiWufli64GQl6HgJHYJ_lOUqsoaIYiu5BelWXXHUmsa_loMQiundIY6LvlQ8sT7APULuc=w566-h346-no)

## Setting a Domain Name
If you're like me, you don't want to enter an ip address everytime you visit your site. We can edit our hosts file and add a domain name that points to the Vagrantfile ip address `192.168.33.10`.

  * If you're on Windows, your hosts file should be located in: `C:\Windows\System32\drivers\etc`

  * If you're on a Mac, your hosts file should be located inside the `/etc` directory.
<br>
<br>

1. Open the `hosts` file with your preferred text editor as administrator.

2. Add the vagrant file default ip address and your preferred domain name on the same line like so:

        192.168.33.10 mysite.dev

3. Save the file and now instead of typing the ip address in the browser, you can just use `mysite.dev` to visit your site.

## Configuring the `lamp.sh` File
### Packages
You can alter the packages in the default `PACKAGES` array to the software you want to install.
### Adding Databases
Uncomment the DBA array by removing the preceding `#`, remove the pre-existing databases, then add the databases you want to create in the same format.

If you have any associated sql files of your database, then store them inside the `sqldump` folder. Make sure the sql file is the same name of the associated database you included in the DBA array. If no associated files, the script will create an empty database.

## Backing Up Your Databases
As long as you have the `vagrant-triggers` plugin installed, the vagrant file will automatically back up all of your databases whenever you choose to run the `vagrant destroy` command. Check out the [documentation](https://github.com/emyl/vagrant-triggers) if u need to edit this feature.

## Using Your Machine
Once the virtual machine is up and running you can run `vagrant ssh` to access it inside and make any further system configurations. You can type `exit;` to exit the shell and return to your main project folder.

You can use this development environment for a one project site or multiple, just create different site folders at the root of your main project folder. To access your different sites in the browser just enter

    mysite.dev/site-1

    or

    192.168.33.10/site-1

When you're finished developing, you can shutdown the VM to free up your computer's RAM. In your terminal, go to the directory of your main project folder and run:

    $ vagrant halt

 To start it up again, run:

    $ vagrant up

If you want to completely remove the VM from your machine to save disk space, run:

    $ vagrant destroy

The next time you run vagrant up, all your project files and databases will remain in tact, but any further configurations you made inside the shell will be gone. Edit the `lamp.sh` file for permanent configurations.

## MySQL Default Credentials
|USERNAME|PASSWORD|
|--------|--------|
|  root  |password|
