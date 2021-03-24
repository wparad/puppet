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

### Uranium specific
* Add SSH two factor: https://www.rosehosting.com/blog/secure-your-ssh-using-two-factor-authentication-on-ubuntu-16-04/
* run

```sh
apt-get install libpam-google-authenticator
google-authenticator
```
* update
    * => /etc/pam.d/sshd
		  auth required pam_google_authenticator.so
		* => /etc/ssh/sshd_config
		  ChallengeResponseAuthentication yes

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

* Set the system keyboard: `sudo dpkg-reconfigure keyboard-configuration`

### Fix <Ctrl><Shift>c
* If the terminal isn't working update ` ~/.config/xfce4/terminal/terminalrc`
	`AccelCopy=<Control><Shift>c`


### TODO:

* `modules/git/manifests/init.pp` create the `files/git-completion.bash` @ `/etc/bash_completion.d/git` script

### Manual Configuration
* SUPER + M => Maximize
* SUPER + S => xfce4-screenshooter -c -r

#### UMS: Universal Media Server
* https://github.com/UniversalMediaServer/UniversalMediaServer/wiki/Linux-install-instructions

### SpaceView display remaining hard drive space
* http://www.webupd8.org/2016/10/spaceview-ubuntu-file-system-usage.html
  * And then edit the tools file and update it to return and use the actual size.

### Sambda setup
Run the following commands:
```sh
sudo smbpasswd -a warren
sudo smbpasswd -a ro
```

Check the list of users
`sudo pdbedit -L -v`