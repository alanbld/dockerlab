FROM mono-c-sharp
ENV DEBIAN_FRONTEND noninteractive

RUN add-apt-repository ppa:alexlarsson/flatpak
RUN apt-get update
RUN apt-get install -qq -y --allow-downgrades --allow-remove-essential --allow-change-held-packages flatpak
RUN apt-get clean all
ADD https://sdk.gnome.org/keys/gnome-sdk.gpg .
ADD https://download.mono-project.com/monodevelop/monodevelop-6.1.1.15-2.flatpak .
RUN sysctl kernel.unprivileged_userns_clone=1
RUN flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/
RUN flatpak install --user --bundle monodevelop-6.1.1.15-2.flatpak

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    mkdir -p /etc/sudoers.d && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
#CMD flatpak run com.xamarin.MonoDevelop
#CMD /usr/bin/firefox
