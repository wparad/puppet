Puppet
======

Puppet Deployment scripts


## Instructions

* `sudo apt-get install ruby`
* `sudo gem install puppet`
* Overwrite the /passwords.json file created with the correct passwords, delete the file afterwards
* `sudo puppet apply site.pp --modulepath modules --trace --debug --verbose`

