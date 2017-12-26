class game_controller() {
    # To test the gamepad works: jstest /dev/input/js0
    # If this doesn't work try: lsmod | grep xpad && sudo modprobe xpad (http://askubuntu.com/questions/783587/how-do-i-get-an-xbox-one-controller-to-work-with-16-04-not-steam)
    # Configure joysticks: http://askubuntu.com/questions/32031/how-do-i-configure-a-joystick-or-gamepad/270111#270111

    package{'joystick':}
    -> package{'jstest-gtk':}
    -> package{'qjoypad':}
    -> exec{'git clone https://github.com/paroj/xpad.git /usr/src/xpad-0.4':
        path => $path,
        creates => '/usr/src/xpad-0.4'
    }
    -> package{'dkms':}
    -> exec{'dkms install -m xpad -v 0.4':
        path => $path
    }
}