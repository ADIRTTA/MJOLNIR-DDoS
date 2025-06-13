#!/bin/bash

# MJOLNIR Installer/Updater Script by ADIRTTA

clear
echo "⚡ Installing or Updating MJOLNIR DDoS Tool..."
sleep 1

# Clean old directory and clone fresh copy
cd $HOME
rm -rf MJOLNIR-DDoS
git clone https://github.com/ADIRTTA/MJOLNIR-DDoS.git
cd MJOLNIR-DDoS

# Install dependencies
echo "📦 Installing dependencies..."
pkg install -y python git wget
pip install -r requirements.txt

# Create the MJOLNIR launcher (without git pull!)
echo "⚙️ Creating launcher command..."

cat << EOF > /data/data/com.termux/files/usr/bin/MJOLNIR
#!/bin/bash
cd \$HOME/MJOLNIR-DDoS
python3 MJOLNIR.py
EOF

chmod +x /data/data/com.termux/files/usr/bin/MJOLNIR

echo ""
echo "✅ MJOLNIR installed!"
echo "🚀 Now run it by typing: MJOLNIR"
echo "🔁 To update later, just run: bash MJOLNIR.sh"
