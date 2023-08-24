all: clean_bonus
	mkdir -p /home/mportrai/data/mariadb
	mkdir -p /home/mportrai/data/wordpress
	chmod 755 /home/mportrai/data/mariadb
	chmod 755 /home/mportrai/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean: stop
	docker-compose -f srcs/docker-compose.yml down -v
	# docker-compose -f srcs/docker-compose-bonus down -v

fclean: clean
	docker system prune -af
	rm -rf /home/mportrai/data/wordpress
	rm -rf /home/mportrai/data/mariadb
	rm -rf /home/mportrai/data

re:	fclean all

bonus: clean
	docker-compose -f srcs/docker-compose-bonus.yml build
	docker-compose -f srcs/docker-compose-bonus.yml up

stop_bonus:
	docker-compose -f srcs/docker-compose-bonus.yml stop

clean_bonus: stop_bonus
	docker-compose -f srcs/docker-compose-bonus down -v

fclean_bonus: clean_bonus
	docker system prune -af
	rm -rf /home/mportrai/data/wordpress
	rm -rf /home/mportrai/data/mariadb
	rm -rf /home/mportrai/data

re_bonus: fclean_bonus bonus

.PHONY: all stop clean fclean re bonus stop_bonus clean_bonus fclean_bonus re_bonus