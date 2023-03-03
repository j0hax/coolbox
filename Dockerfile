FROM registry.fedoraproject.org/fedora-toolbox:38

# Keep DNF from asking for confirmation
RUN echo "assumeyes=True" >> /etc/dnf/dnf.conf

# Install RPM Fusion
RUN dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Upgrade to latest versions of everything
RUN dnf upgrade
