FROM archlinux:latest

# Update system and install base development packages, sudo, git, and GUI display utilities
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel sudo git wget which less \
    xvfb x11vnc fluxbox websockify novnc && \
    pacman -Scc --noconfirm

# Create a non-root user named 'vscode' with sudo privileges
RUN useradd -m -s /bin/bash vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER vscode
WORKDIR /home/vscode