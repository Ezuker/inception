all:
	sudo mkdir -p /home/bcarolle/data/mariadb	
	sudo mkdir -p /home/bcarolle/data/wordpress
	@sleep 5
	sudo docker compose -f ./srcs/docker-compose.yml up --build -d

stop:
	sudo docker compose -f ./srcs/docker-compose.yml stop
	@sleep 5
	sudo docker system prune --all --force
	# sudo docker volume prune --force
	docker volume ls -qf dangling=true | xargs -r docker volume rm
	sudo docker network prune --force

fclean:
	sudo rm -rf /home/bcarolle/data/mariadb
	sudo rm -rf /home/bcarolle/data/wordpress
	make stop

re: fclean all

.PHONY: all stop fclean re
