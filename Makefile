all: test

test:
	crystal compile --release src/kemal-monetdb-test.cr
