.PHONY: serve
serve: ## Run jekyll serve
	@docker-compose up

.PHONY: open
open: ## Open web browser with URL from jekyll serve
	@open http://localhost:4000

CMD?=help

.PHONY: bundle
bundle: ## Run bundle command (set with CMD, defaults to help)
	@docker-compose run --rm \
		jekyll \
		bundle $(CMD)

.PHONY: jekyll
jekyll: ## Run jekyll command (set with CMD, defaults to help)
	@docker-compose run --rm \
		jekyll \
		jekyll $(CMD)

.PHONY: help
.DEFAULT_GOAL := help
help: ## Print help message (default)
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
