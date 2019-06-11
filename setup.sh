# Apps
flatpak remote-add --if-not-exists --no-gpg-verify chrome http://blog.kukuh.syafaat.id/google-chrome-flatpak-repo-testing/repo
flatpak remote-add --if-not-exists firefox https://firefox-flatpak.mojefedora.cz/org.mozilla.FirefoxRepo.flatpakrepo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install chrome com.google.Chrome
flatpak install firefox org.mozilla.FirefoxNightly
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub net.scribus.Scribus
flatpak install flathub com.visualstudio.code.oss
flatpak install flathub io.github.liberodark.OpenDrive

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
