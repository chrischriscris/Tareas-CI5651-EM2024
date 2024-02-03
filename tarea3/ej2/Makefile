.PHONY: all
all: perrin_solver

perrin_solver: perrin/*.go
	go build -C perrin -o ../perrin_solver

bench: perrin/main_test.go
	cd perrin && go test -bench=.

clean:
	rm -f perrin_solver
