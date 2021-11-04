#kali_arm64_khanhnguyen9872
cd $HOME
pkg update -y && pkg upgrade -y
pkg install wget proot tar pv p7zip -y
rm -f install-kali-khanhnguyen && rm -f install-nethunter-termux && rm -f update-kali-khanhnguyen
wget -O update-kali-khanhnguyen https://tinyurl.com/368d8bkr
chmod +x ~/update-kali-khanhnguyen
bash ~/update-kali-khanhnguyen
#####
