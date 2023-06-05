DATA_DIR = /home/merkol/data

# HOSTNAME = "127.0.0.1	merkol.42.fr"

all: dir
	docker-compose -f srcs/docker-compose.yml up -d --build

re: fclean dir
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env up -d --build

clean:
	docker-compose -f srcs/docker-compose.yml --env-file=srcs/.env down --remove-orphans -v

fclean: clean
	docker system prune -af
	docker container prune -f
	docker image prune -af
	docker builder prune --all --force
	docker network prune -f
	if [ -d "${DATA_DIR}" ]; then \
		cd ${DATA_DIR} && rm -rf *; \
	fi

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

dir:
	mkdir -p /root/data
	sudo mkdir -p ${DATA_DIR}/wp
	sudo mkdir -p ${DATA_DIR}/db
	echo ${HOSTNAME} | sudo tee -a /etc/hosts

.PHONY: all re clean fclean dir up down