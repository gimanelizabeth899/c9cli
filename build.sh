#!/bin/bash

echo "
==================================================
        ____ ___   ____ _     ___               
       / ___/ _ \ / ___| |   |_ _|              
      | |  | (_) | |   | |    | |               
      | |___\__, | |___| |___ | |               
 ___ _   _ \____|_/_/ \____|_____|___|  _____ ____  
|_ _| \ | / ___|_   _|/ \  | |   | |   | ____|  _ \ 
 | ||  \| \___ \ | | / _ \ | |   | |   |  _| | |_) |
 | || |\  |___) || |/ ___ \| |___| |___| |___|  _ < 
|___|_| \_|____/ |_/_/   \_\_____|_____|_____|_| \_\
==================================================
"

# Hindari prompt interaktif (noninteractive)
export DEBIAN_FRONTEND=noninteractive

# Step 1: Jalankan install.sh dari GitHub
sudo curl -fsSL https://raw.githubusercontent.com/gimanelizabeth899/c9cli/refs/heads/master/install.sh | sudo bash

# Step 2: Download c9cli.sh dan simpan ke /usr/local/bin/c9cli
sudo curl -fsSL https://raw.githubusercontent.com/gimanelizabeth899/c9cli/refs/heads/master/c9cli.sh -o /usr/local/bin/c9cli

# Step 3: Tes hasilnya
if [ $? -eq 0 ]; then
    echo "✅ c9cli installation successful!"
    echo "Installed version:"
    c9cli version
    echo "ℹ️  Type 'sudo c9cli help' to see the available commands."
else
    echo -e "\e[31m❌ c9cli installation failed.\e[0m"
fi
