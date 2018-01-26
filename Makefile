export CWD=$(shell pwd)

all: environment gif clean

environment:
	vagrant up
	ssh-add -D
	ssh-add ~/.vagrant.d/insecure_private_key

gif:
	scripts/gbt_demo.scpt

clean:
	vagrant destroy -f
