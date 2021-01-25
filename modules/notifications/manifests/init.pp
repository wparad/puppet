class notifications($user = 'warren')
{
    # https://www.addictivetips.com/ubuntu-linux-tips/set-up-better-system-notifications-on-linux-with-dunst/
    # package{'xfce4-notifyd':
    #     ensure => absent
    # }
    # ~> exec{'sudo kill -9 `pidof xfce4-notifyd`'
    #     path => $path
    # }
    # -> package{'suckless-tools':}
    # -> package{'dunst':}
    # -> file{"/home/${user}/.config/dunst":
    # 	ensure => directory,
    # 	mode => '0755'
    # }
    # -> file {"/home/${user}/.config/dunst/dunstrc":
    #     ensure => 'file',
    #     owner => $user,
    #     group => $user,
    #     mode => '0644',
    #     source => 'puppet:///modules/notifications/dunstrc'
    # }
    # ~> exec{'systemctl enable --user dunst.service && systemctl start --user dunst.service':
    #     path => $path
    # }

}
