FROM ubuntu:22.04 AS final

# copy the contents of the context/ directory to the image
COPY ./bashrc.custom /tmp/

RUN ln --symbolic /dev/null /root/.bash_history && \
	useradd default --user-group --no-create-home --shell /bin/false && \
	cat /tmp/bashrc.custom >> /root/.bashrc && \
	cat /tmp/bashrc.custom >> /etc/bash.bashrc && \
	rm /tmp/bashrc.custom && \
	apt-get update && \
	apt-get upgrade --yes && \
	DEBIAN_FRONTEND=noninteractive apt-get install tini && \
	apt-get clean autoremove && \
	rm --recursive --force /var/lib/apt/lists/*

# set tini as our PID 0 process
ENTRYPOINT ["/usr/bin/tini", "-vv", "--"]

USER default

WORKDIR /

# default to bash shell
CMD ["bash"]
