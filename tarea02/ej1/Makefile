.PHONY: all
all: tunnel_ads_solver

tunnel_ads_solver: tunnel_ads/src/*.rs
	cargo build --release --manifest-path=tunnel_ads/Cargo.toml
	cp ./tunnel_ads/target/release/tunnel_ads $@

clean:
	rm -f tunnel_ads_solver
