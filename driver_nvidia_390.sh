#!/bin/bash

# 1. Menghapus driver NVIDIA yang terinstal
echo "Menghapus driver NVIDIA yang lama..."
sudo apt purge '^nvidia-.*' -y
sudo apt autoremove -y

# 2. Masuk ke direktori Downloads
cd ~/Downloads || exit

# 3. Unduh driver legacy NVIDIA 390.157 dari situs resmi NVIDIA
echo "Mengunduh NVIDIA 390.157 driver dari situs resmi..."
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/390.157/NVIDIA-Linux-x86_64-390.157.run

# 4. Memberikan izin eksekusi
chmod +x NVIDIA-Linux-x86_64-390.157.run

# 5. Beralih ke mode teks (non-GUI)
echo "Beralih ke mode teks (non-GUI)..."
sudo systemctl isolate multi-user.target

# 6. Menjalankan installer
echo "Menjalankan installer NVIDIA..."
sudo ./NVIDIA-Linux-x86_64-390.157.run --no-opengl-files

# 7. Reboot sistem
echo "Instalasi selesai. Me-reboot sistem..."
sudo reboot