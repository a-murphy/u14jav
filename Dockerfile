FROM drydock/u14:{{%TAG%}}

ADD . /u14jav

RUN /u14jav/install.sh
