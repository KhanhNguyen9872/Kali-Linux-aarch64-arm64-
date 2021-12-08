#kali_arm64_khanhnguyen9872
termux-setup-storage
termux-wake-lock
cd $HOME
echo "termux-wake-lock" > ~/.bash_profile
pkg update -y && pkg upgrade -y
pkg install wget proot tar pv p7zip -y
rm -f install-kali-khanhnguyen && rm -f install-nethunter-termux && rm -f update-kali-khanhnguyen && rm -f restore-khanhnguyen
wget -O install-kali-khanhnguyen https://tinyurl.com/yj85cahd
chmod +x ~/install-kali-khanhnguyen
bash ~/install-kali-khanhnguyen
#####
