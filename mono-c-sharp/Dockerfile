FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive


#ADD http://download.mono-project.com/repo/xamarin.gpg .
#RUN apt-key add xamarin.gpg
#RUN apt-key adv --keyserver-options http_proxy=http://www-proxy:8080 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#RUN echo "deb http://download.mono-project.com/repo/ubuntu xenial main" > /etc/apt/sources.list.d/mono-xamarin.list
#RUN echo "deb http://download.mono-project.com/repo/ubuntu xenial-apache24-compat main" >> /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get -qq update&& apt-get install -y --no-install-recommends apt-utils
RUN apt list --installed
RUN apt-get install -qq -y --allow-downgrades --allow-remove-essential --allow-change-held-packages software-properties-common gcc 
RUN apt-get install --assume-yes --allow-remove-essential --allow-change-held-packages mono-complete
RUN apt-get clean all
