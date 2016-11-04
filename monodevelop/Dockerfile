FROM mono-c-sharp
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -qq -y --allow-downgrades --allow-remove-essential --allow-change-held-packages monodevelop monodevelop-nunit monodevelop-versioncontrol
RUN apt-get clean all
ADD https://sdk.gnome.org/keys/gnome-sdk.gpg .
RUN sysctl kernel.unprivileged_userns_clone=1


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
ENTRYPOINT [ "/usr/bin/monodevelop" ]
