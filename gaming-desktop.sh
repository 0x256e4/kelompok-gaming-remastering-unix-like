#!/usr/bin/env bash

banner_line="========================================="

desktop() {
       sudo apt install openbox git obconf zsh curl lxappearance
       git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes
       sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
       obconf; lxappearance
       exit
}

terminal() {
	wget https://raw.githubusercontent.com/downthecrop/URxvt-themes/master/LightPurpleGreen; mv LightPurpleGreen ~/.Xdefaults
	sudo update-alternatives --config x-terminal-emulator
	exit
}

taskbar() {
	sudo apt install tint2
	rm -rf ~/.config/openbox 2>/dev/null; mkdir ~/.config/openbox
	cat <<EOL >> ~/.config/openbox/autostart
tint2 -c .config/tint2/unleashed/unleashed-taskbar.tint2rc &
EOL
	exit
}

wallpaper() {
	sudo apt-get install xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev wget mpv
	git clone https://github.com/ujjwal96/xwinwrap.git
	cd xwinwrap
	make -j $(nproc)
	sudo make -j $(nproc) install
	make clean
	cd ; mkdir .local/bin; cd .local/bin; wget https://raw.githubusercontent.com/Christopher96/.dotfiles/master/.scripts/wallpaper-wrap; wget https://raw.githubusercontent.com/Christopher96/.dotfiles/master/.scripts/wallpaper-live; echo "/home/gaming-stations/Downloads/texas-petting-wolf-arknights-moewalls.com.mp4" > wallpaper-save

	exit
}

gaming() {
	sudo add-apt-repository ppa:lutris-team/lutris; sudo apt update; sudo apt install lutris
}

cat <<EOL
=========================================
|	    kelompok gaming		|
|	Installer untuk Desktop		|	
|=======================================|
|					|
|	   Anggota Kelompok		|
| 1. 					|
| 2. 					|
| 3. 					|
| 4. 					|
=========================================
EOL


cat<<EOL

Silahkan Pilih Menu:
1. Desktop Dependensi
2. Taskbar
3. Wallpaper (Live)
4. Gaming

EOL

echo -n "Pilihan : "; read pilihan
case $pilihan in
1)
	clear; desktop; clear; echo "berhasil terpasang!"
	;;
2)
	clear; taskbar; clear; echo "berhasil terpasang!"
	;;
3)
	clear; wallpaper; clear; echo "berhasil terpasang!"
	;;
4)
	clear; gaming; clear; echo "berhasil terpasang!"
	;;
*)
	clear; echo -n "Bukan sebuah angka !"
	clear
	;;
esac
