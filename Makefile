JEKYLL_IMAGE = jekyll/minimal
JEKYLL_VERSION = 3.8
SITE_NAME = $(shell basename $(CURDIR))

.PHONY: build
build: ## Run jekyll build
	@docker run --rm \
		--volume="${PWD}:/srv/jekyll:cached" \
		--volume="${PWD}/vendor/bundle:/usr/local/bundle:cached" \
		-it $(JEKYLL_IMAGE):$(JEKYLL_VERSION) \
	  jekyll build

.PHONY: serve
serve: ## Run jekyll serve
	@docker run --rm \
		--volume="${PWD}:/srv/jekyll:cached" \
		--volume="${PWD}/vendor/bundle:/usr/local/bundle:cached" \
		--name=$(SITE_NAME) \
		-P \
		-it $(JEKYLL_IMAGE):$(JEKYLL_VERSION) \
	  jekyll serve


.PHONY: open
open: ## Open web browser with URL from jekyll serve
	@open http://$(shell docker port $(SITE_NAME) 4000)

CMD?=help

.PHONY: bundle
bundle: ## Run bundle command (set with CMD)
	@docker run --rm \
		--volume="${PWD}:/srv/jekyll:cached" \
		--volume="${PWD}/vendor/bundle:/usr/local/bundle:cached" \
		-it $(JEKYLL_IMAGE):$(JEKYLL_VERSION) \
	  bundle $(CMD)

.PHONY: jekyll
jekyll: ## Run bundle command (set with CMD)
	@docker run --rm \
		--volume="${PWD}:/srv/jekyll:cached" \
		--volume="${PWD}/vendor/bundle:/usr/local/bundle:cached" \
		-it $(JEKYLL_IMAGE):$(JEKYLL_VERSION) \
	  jekyll $(CMD)

.PHONY: help
.DEFAULT_GOAL := help
help: ## Print help message (default)
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
