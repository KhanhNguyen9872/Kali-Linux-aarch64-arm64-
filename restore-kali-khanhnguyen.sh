#kali_arm64_khanhnguyen9872
cd $HOME
pkg update -y && pkg upgrade -y
pkg install wget proot tar pv p7zip -y
rm -f install-kali-khanhnguyen && rm -f install-nethunter-termux && rm -f update-kali-khanhnguyen && rm -f restore-khanhnguyen
wget -O restore-khanhnguyen https://tinyurl.com/fx27vc6z
chmod +x ~/restore-khanhnguyen
bash ~/restore-khanhnguyen
#####
