all: fclean_bonus
	mkdir -p /home/mportrai/data/mariadb
	mkdir -p /home/mportrai/data/wordpress
	chmod 755 /home/mportrai/data/mariadb
	chmod 755 /home/mportrai/data/wordpress
	docker-compose -f srcs/docker-compose.yml up -d --build

up:
	docker-compose -f srcs/docker-compose.yml up -d

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean: stop
	docker-compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af
	rm -rf /home/mportrai/data/wordpress
	rm -rf /home/mportrai/data/mariadb
	rm -rf /home/mportrai/data

re:	fclean all

bonus: fclean
	mkdir -p /home/mportrai/data_bonus/mariadb
	mkdir -p /home/mportrai/data_bonus/wordpress
	chmod 755 /home/mportrai/data_bonus/mariadb
	chmod 755 /home/mportrai/data_bonus/wordpress
	docker-compose -f srcs/docker-compose-bonus.yml up -d --build

up_bonus:
	docker-compose -f srcs/docker-compose-bonus.yml up -d

stop_bonus:
	docker-compose -f srcs/docker-compose-bonus.yml stop

clean_bonus: stop_bonus
	docker-compose -f srcs/docker-compose-bonus.yml down -v

fclean_bonus: clean_bonus
	docker system prune -af
	rm -rf /home/mportrai/data_bonus/wordpress
	rm -rf /home/mportrai/data_bonus/mariadb
	rm -rf /home/mportrai/data_bonus

re_bonus: fclean_bonus bonus

.PHONY: all up stop clean fclean re bonus up_bonus stop_bonus clean_bonus fclean_bonus re_bonus