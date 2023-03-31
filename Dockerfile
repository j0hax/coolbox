FROM registry.fedoraproject.org/fedora-toolbox:38

# Keep DNF from asking for confirmation
RUN echo "assumeyes=True" >> /etc/dnf/dnf.conf

# Install RPM Fusion
RUN dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable VS Code repositories
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc && sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Upgrade to latest versions of everything
RUN dnf upgrade
