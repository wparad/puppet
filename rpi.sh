# Raspberry PI 4

# Instructions from RPI stepmania: https://github.com/SpottyMatt/raspbian-stepmania-arcade#map-the-controller-normally

# Setup
mkdir /media/warren/rootfs/setup
cd /media/warren/rootfs/setup
git clone https://github.com/SpottyMatt/raspbian-stepmania-arcade
git clone https://github.com/Workshopshed/DanceController

# Bluetooth part 1
# https://www.raspberrypi.org/forums/viewtopic.php?f=28&t=201519&hilit=.asoundrc#p1344830
cat >> home/pi/.asoundrc <<EOF
defaults.bluealsa.interface "hci0"
defaults.bluealsa.device "XX:XX:XX:XX:XX:XX"
defaults.bluealsa.profile "a2dp"
defaults.bluealsa.delay 10000
EOF

# Run on device
# Build step mania
cd raspbian-stepmania-arcade
make
make arcade-setup

sudo apt update

# Bluetooth enabled https://howchoo.com/pi/bluetooth-raspberry-pi
sudo apt install bluetooth pi-bluetooth bluez blueman joystick jstest-gtk

## Custom dance pads
# https://www.popsci.com/story/diy/build-arcade-dance-game/
# sudo apt install arduino

# Change size of desktop and stepmania
=> 1600 x 900

# AudioSync .120

# Get Noteskins https://www.reddit.com/r/Stepmania/comments/4ngqme/any_good_noteskins_for_51/
mkdir -p ~/.stepmania-5.1/NoteSkins/dance

#Mount remote share
//palladium.warrenparad.net/ddr/ /home/pi/.stepmania-5.1/Songs cifs credentials=/home/pi/credentialsrw,user,relatime,cache=strict,soft,echo_interval=60,actimeo=1,_netdev,x-systemd.automount,x-systemd.device-timeout=30,noperm,nofail 0 0



## Debugging
`udevadm info /dev/input/event0 | awk -F'=' '/ID_SERIAL=(.*)/{print $2}'`
# => 0079_USB_Gamepad
`ls -hal /dev/input/by-id`
# =>
# lrwxrwxrwx 1 root root   9 Dec 17 14:39 usb-0079_USB_Gamepad-event-joystick -> ../event0
# lrwxrwxrwx 1 root root   6 Dec 17 14:39 usb-0079_USB_Gamepad-joystick -> ../js0

## Prevent Sleeping https://stackoverflow.com/questions/30985964/how-to-disable-sleeping-on-raspberry-pi
echo "xserver-command=X -s 0 -p 0 -dpms" >> /etc/lightdm/lightdm.conf

# Fullscreen exit: https://github.com/SpottyMatt/raspbian-stepmania-arcade/blob/master/arcade-setup/user-settings/Save/Default-Preferences.ini
alt + enter