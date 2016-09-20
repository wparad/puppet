Puppet
======

Puppet Deployment scripts

## Instructions

* `sudo apt-get install ruby`
* `sudo gem install puppet`
* Overwrite the /passwords.json file created with the correct passwords, delete the file afterwards, used by `get_passwords()`
	```
	{
		"gmail": "app password",
		"xmpp": "xmpp password"
	}
	```
 	* Use of an [app password](https://security.google.com/settings/security/apppasswords) may be needed.
* `sudo puppet apply site.pp --modulepath modules --trace --debug --verbose`

### XMPP: create users
`sudo ejabberdctl register USERNAME localhost PASSWORD`

### Fix for dvorak keyboard:

* `/etc/default/keyboard`

```
XKBMODEL="pc105"
XKBLAYOUT="us,us"
XKBVARIANT="dvp,"
XKBOPTIONS="grp:alt_shift_toggle"
```

* Also

```bash
dpkg-reconfigure keyboard-configuration
sudo service keyboard-setup restart
sudo service lightdm start
```

### TODO:

* `modules/git/manifests/init.pp` create the `files/git-completion.bash` @ `/etc/bash_completion.d/git` script
* Add `~/bin/git-diff-wrapper.sh`:
	```
	#!/bin/bash
	meld $2 $5
    ```
