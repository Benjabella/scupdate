#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Request: Debian 9+/Ubuntu 18.04+/20+
# Developer: Darkanonc
# Email: darkanoncc@gmail.com
# Telegram: https://t.me/darkanonc
# WhatsApp: wa.me/+254706376682
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Darkanonc

NS=$(cat /etc/xray/dns)
PUB=$(cat /etc/slowdns/server.pub)
domain=$(cat /etc/xray/domain)
# color
grenbo="\e[92;1m"
NC='\e[0m'
# install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/genome96/scupdate/main/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/genome96/scupdate/main/bot/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt

clear
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m           » ADD BOT PANEL «           \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Create Bot and Telegram ID${NC}"
echo -e "${grenbo}[»] Create Bot and Bot Token: @BotFather${NC}"
echo -e "${grenbo}[»] Telegram ID Info: @MissRose_bot${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -e -p "[»] Input your Bot Token: " bottoken
read -e -p "[»] Input Your Telegram ID: " admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt
systemctl enable kyt
systemctl restart kyt
cd /root
rm -rf kyt.sh
echo "Data Input Processed Successfully!"
echo "Your Telegram Bot Data"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Bot Token: $bottoken"
echo "Admin: $admin"
echo "Domain: $domain"
# echo "Pub: $PUB"
# echo "Host: $NS"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Bot Setting Success!"
sleep 2
clear

echo "Installation complete, type /menu on your bot"
read -p "Press Enter to go back to the menu"
menu
