
.PHONY: help
help: ### Display this help screen.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: run_site_locally
run_site_locally: ### Run the site locally.
	@(docsify serve docs)

.PHONY: run_site
run_site: ### Run the site in a daemon process.
	@(pm2 start docs/index.js --name wtf-rag-technical-manual)

.PHONY: re_run_site
re_run_site: ### Re-run the site.
	@(pm2 restart wtf-rag-technical-manual)

.PHONY: stop_site
stop_site: ### Stop the site.
	@(pm2 stop wtf-rag-technical-manual)
