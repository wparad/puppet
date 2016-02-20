Puppet
======

Puppet Deployment scripts


## Instructions

* `sudo apt-get install ruby`
* `sudo gem install puppet`
* Overwrite the /passwords.json file created with the correct passwords, delete the file afterwards
    ```
    {
		"gmail": "app password"
	}
	```
 	* Use of an [app password](https://security.google.com/settings/security/apppasswords) may be needed.
* `sudo puppet apply site.pp --modulepath modules --trace --debug --verbose`

### Fix for dvorak keyboard:

* `/etc/default/keyboard`

```
XKBMODEL="pc105"
XKBLAYOUT="us,us"
XKBVARIANT="dvp,"
XKBOPTIONS="grp:alt_shift_toggle"
```
