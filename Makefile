
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	./gen/sbin/nginx -t

	kill -USR2 `cat ./gen/logs/nginx.pid`
	sleep 1
	test -f ./gen/logs/nginx.pid.oldbin

	kill -QUIT `cat ./gen/logs/nginx.pid.oldbin`
