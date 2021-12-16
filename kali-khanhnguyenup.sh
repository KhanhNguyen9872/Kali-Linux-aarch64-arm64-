#kali_arm64_khanhnguyen9872
cd $HOME
pkg update -y && pkg upgrade -y
pkg install wget proot tar pv p7zip -y
rm -f install-kali-khanhnguyen 2> /dev/null && rm -f install-nethunter-termux 2> /dev/null && rm -f update-kali-khanhnguyen 2> /dev/null && rm -f restore-khanhnguyen 2> /dev/null
wget -O update-kali-khanhnguyen https://tinyurl.com/368d8bkr 2> /dev/null
chmod +x ~/update-kali-khanhnguyen 2> /dev/null
bash ~/update-kali-khanhnguyen
#####
