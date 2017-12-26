Puppet
======

Puppet Deployment scripts

## Instructions

* `sudo apt-get install ruby`
* `sudo gem install puppet`
* Overwrite the /passwords.json file created with the correct passwords, delete the file afterwards, used by `get_passwords()`
	```
	{
		"gmail": "app password"
	}
	```
 	* Use of an [app password](https://security.google.com/settings/security/apppasswords) may be needed.
* `sudo puppet apply site.pp --modulepath modules --trace --debug --verbose`

### Fix for dvorak keyboard:
* [Possible Fix](https://www.kaufmann.no/roland/dvorak/linux.html) and [Keyboard](https://wiki.archlinux.org/index.php/Logitech_Unifying_Receiver)
* `/etc/default/keyboard`

```
XKBMODEL="pc105"
XKBLAYOUT="us,us"
XKBVARIANT="dvp,"
XKBOPTIONS="grp:alt_shift_toggle"
```

* Also

```bash
sudo dpkg-reconfigure keyboard-configuration
sudo service keyboard-setup restart
sudo service lightdm start
```

* Further: `/etc/X11/xorg.conf.d/20-keyboard.conf`

```bash
Section "InputClass"
    Identifier "keyboard"
    MatchIsKeyboard "yes"
    Option "XkbLayout" "us"
    Option "XkbVariant" "dvp"
EndSection
```

### Fix <Ctrl><Shift>c
* If the terminal isn't working update ` ~/.config/xfce4/terminal/terminalrc`
	`AccelCopy=<Control><Shift>c`


### TODO:

* `modules/git/manifests/init.pp` create the `files/git-completion.bash` @ `/etc/bash_completion.d/git` script
* Add `~/bin/git-diff-wrapper.sh`:
	```
	#!/bin/bash
	meld $2 $5
    ```
