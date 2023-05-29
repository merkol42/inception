DATA_DIR = /home/merkol/data

HOSTNAME = "127.0.0.1	merkol.42.fr"

all: dir
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env up -d --build
re: fclean dir
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env up -d --build
clean:
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env down --remove-orphans -v
fclean: clean
	cd ${HOME}/data && sudo rm -rf *
	docker system prune -afd
	docker container prune -f
	docker image prune -af
	docker builder prune --all --force
dir:
	sudo mkdir -p ${DATA_DIR}/wp
	sudo mkdir -p ${DATA_DIR}/db
	echo ${HOSTNAME}| sudo tee -a /etc/hosts
