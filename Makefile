centos7-up:
	docker build -t centos7-ssh ./centos7-ssh-image/
	docker run --privileged -d -p 20022:22 -t centos7-ssh:latest

centos7-rm:
	docker rm -f $(shell docker ps -qa --filter ancestor=centos7-ssh:latest)

centos7-copy-id:
	ssh-keygen -f "/home/yuta/.ssh/known_hosts" -R "[127.0.0.1]:20022"
	ssh-copy-id root@127.0.0.1 -p 20022

centos7-ansible-exec:
	ansible-playbook main.yaml -u root -vvv
