DATA_DIR = /home/merkol/data

# HOSTNAME = "127.0.0.1	merkol.42.fr"

all: dir
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env up -d --build
re: fclean dir
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env up -d --build
clean:
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env down --remove-orphans -v
fclean: clean
	docker system prune -af
	docker container prune -f
	docker image prune -af
	docker builder prune --all --force
	if [ -d "/root/data" ]; then \
		cd /root/data && rm -rf *; \
	fi
dir:
	mkdir -p /root/data
	sudo mkdir -p ${DATA_DIR}/wp
	sudo mkdir -p ${DATA_DIR}/db
	echo ${HOSTNAME} | sudo tee -a /etc/hosts
