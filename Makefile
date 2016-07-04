all: test

test:
	crystal build --release src/kemal-monetdb-test.cr
