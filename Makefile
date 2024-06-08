all:
	mkdir -p /home/bcarolle/data/mariadb	
	mkdir -p /home/bcarolle/data/wordpress
	rc-service docker start
	docker-compose -f ./srcs/docker-compose.yml up

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

fclean:
	rm -rf /home/bcarolle/data/mariadb
	rm -rf /home/bcarolle/data/wordpress
	make stop

.PHONY: all stop fclean
