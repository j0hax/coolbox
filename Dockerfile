FROM registry.fedoraproject.org/fedora-toolbox:latest

# Keep DNF from asking for confirmation
RUN echo "assumeyes=True" >> /etc/dnf/dnf.conf

# Install DNF5
RUN dnf install dnf5

# Install RPM Fusion
RUN dnf5 install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable Microsoft and VS Code repositories
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

# Enable Sublime Code repository
RUN rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
RUN dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# Enable Iosevka COPR (the best monospace font)
RUN dnf copr enable peterwu/iosevka

# Upgrade to latest versions of everything
RUN dnf5 upgrade

# Enable DNF5 for the user
RUN ln -sf /usr/bin/dnf5 /usr/bin/dnf

