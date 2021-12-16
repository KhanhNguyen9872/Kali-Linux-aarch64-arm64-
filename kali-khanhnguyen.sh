#kali_arm64_khanhnguyen9872
termux-setup-storage
termux-wake-lock
cd $HOME
echo "termux-wake-lock" > ~/.bash_profile
pkg update -y && pkg upgrade -y
pkg install wget proot tar pv p7zip -y
rm -f install-kali-khanhnguyen 2> /dev/null && rm -f install-nethunter-termux 2> /dev/null && rm -f update-kali-khanhnguyen 2> /dev/null && rm -f restore-khanhnguyen 2> /dev/null
wget -O install-kali-khanhnguyen https://tinyurl.com/yj85cahd 2> /dev/null
chmod +x ~/install-kali-khanhnguyen 2> /dev/null
bash ~/install-kali-khanhnguyen
#####
