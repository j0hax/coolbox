FROM registry.fedoraproject.org/fedora-toolbox:40

# Keep DNF from asking for confirmation
RUN echo "assumeyes=True" >> /etc/dnf/dnf.conf

# Install DNF5
RUN dnf install dnf5

# Install RPM Fusion
RUN dnf5 install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install VS Code Repository
RUN sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# Install Vim as default editor
RUN dnf install --allowerasing vim-default-editor

# Upgrade to latest versions of everything
RUN dnf5 upgrade
