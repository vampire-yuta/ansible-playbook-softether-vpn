centos7-up:
	docker build -t centos7-ssh ./centos7-ssh-image/
	docker run --privileged -d -p 20022:22 -t centos7-ssh:latest

centos7-rm:
	docker rm -f $(shell docker ps -qa --filter ancestor=centos7-ssh:latest)

centos7-copy-id:
	ssh-copy-id root@localhost -p 20022

centos7-ansible-exec:
	ansible-playbook main.yaml -u root -vvv
