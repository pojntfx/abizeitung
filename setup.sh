# Apps
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub net.scribus.Scribus -y
flatpak install flathub com.visualstudio.code.oss -y
flatpak install flathub org.gnome.Evince -y

# Fonts
mkdir -p ~/.local/share/fonts/
wget https://www.freebestfonts.com/download?fn=284 -O ~/.local/share/fonts/AtlasRegular.ttf
wget https://www.freebestfonts.com/download?fn=283 -O ~/.local/share/fonts/AtlasSolid.ttf
wget https://indestructibletype.com/Jost.zip -O /tmp/Jost.zip
unzip /tmp/Jost.zip -d /tmp/jost
cp /tmp/jost/TrueType/* ~/.local/share/fonts
mkdir -p public/

# Wallpapers
wget https://wallpapercave.com/wp/5XdwsKO.jpg -O ~/Pictures/hawaii.jpg
