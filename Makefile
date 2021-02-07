build:
	docker build -t $(NAME) ./$(NAME)

run:
	docker run -d -v /mnt/$(NAME):/root/$(NAME) $(OPTIONS) --restart=unless-stopped --name $(NAME) $(NAME)

7_days_to_die: NAME=7_days_to_die
7_days_to_die: OPTIONS=-p 26900:26900/tcp -p 26900-26903:26900-26903/udp
7_days_to_die: build run

conan_exiles: NAME=conan_exiles
conan_exiles: OPTIONS=-p 7777-7778:7777-7778/udp -p 27015:27015/udp
conan_exiles: build run

minecraft: NAME=minecraft
minecraft: OPTIONS=-p 25565:25565/tcp
minecraft: build run

valheim: NAME=valheim
valheim: OPTIONS=-p 2456-2457:2456-2457/udp
valheim: build run
