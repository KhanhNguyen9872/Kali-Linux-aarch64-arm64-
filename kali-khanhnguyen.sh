#kali_arm64_khanhnguyen9872
termux-setup-storage
termux-wake-lock
echo "termux-wake-lock" > ~/.bash_profile
pkg update -y && pkg upgrade -y
pkg install wget -y && pkg install pv -y
wget -O install-kali-khanhnguyen https://tinyurl.com/yj85cahd
chmod +x install-kali-khanhnguyen
./install-kali-khanhnguyen
#####