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

sudo apt update
# Bluetooth enabled https://howchoo.com/pi/bluetooth-raspberry-pi
sudo apt install bluetooth pi-bluetooth bluez blueman
# If the sound doesn't work revalidate the asoundrc file
# sudo rm /etc/modprobe.d/usb-audio-by-default.conf
# rm ~/.asoundrc

## Custom dance pads
# https://www.popsci.com/story/diy/build-arcade-dance-game/
# sudo apt install arduino
