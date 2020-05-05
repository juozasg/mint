build:
	shards build --error-on-warnings --error-trace

test-core: build
	cd core/tests && ../../bin/mint test

development: build
	cp bin/mint ~/.bin/mint-dev

documentation:
	rm -rf docs && crystal docs

ls:
	crystal build src/lsp.cr -o mint-ls -p && mv mint-ls ~/.bin/mint-ls
