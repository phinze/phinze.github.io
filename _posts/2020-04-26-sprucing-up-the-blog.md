---
title: "Sprucing up the Blog"
slug:  sprucing-up
date:  2020-04-26
---

<label for="mn-update-prediction" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="mn-update-prediction" class="margin-toggle"/>
<span class="marginnote">
_**Update July 30th, 2020**:
  Why oh why do I ever make predictions about my posting frequency in writing?! :joy:_
</span>


I'm going to start trying to write more. I'm setting myself a modest goal of
minimum one post per month for the next year. Let's see how we do. For
starters, let's do a classic and time-honored style of post - the "how this
blog is set up" post.

## Before

What we have here is a pretty straightforward Jekyll + GitHub Pages setup, with
a Docker-based workflow for local development. I like trying to play "the floor
is lava" with my base machine - trying to keep all my development environments
either in VMs or containers. I basically always end up giving up and
"polluting" my machine w/ stuff like `chruby` and the Homebrew copy of
`postgres`.

This site is simple enough for me to try to keep things "pure". Also, as a
bonus, messing with the website's setup helps me procrastinate from actually
writing anything! :joy:

So over the past few years I've gotten the bones of a Docker-based setup working
decently. Until recently it centered around a [`Makefile` that looked like
this](https://github.com/phinze/phinze.github.io/blob/240120aa9d71477275513ffcbd4b52f7a02953ea/Makefile).

The core targets were `make serve` and `make open`:

```make
JEKYLL_VERSION = 3.8
SITE_NAME = $(shell basename $(CURDIR))

.PHONY: serve
serve: ## Run jekyll serve
	@docker run --rm \
		--volume="${PWD}:/srv/jekyll" \
		--volume="${PWD}/vendor/bundle:/usr/local/bundle" \
		--name=$(SITE_NAME) \
		-P \
		-it jekyll/jekyll:$(JEKYLL_VERSION) \
		jekyll serve

.PHONY: open
open: ## Open web browser with URL from jekyll serve
	@open http://$(shell docker port $(SITE_NAME) 4000)
```

The `serve` target was pretty much right out of the [instructions for the
`jekyll/jekyll` docker
image](https://github.com/envygeeks/jekyll-docker#caching) with one tweak for
ports.
When I set this up, I thought that using `-P` to get a random port and then
looking it up with `make open` was _very_ clever and I was _very_ pleased with
myself. :innocent:

## Friction

It wasn't perfect though. There were a few problems though that were exposed by
the fact that [you need to restart `jekyll` anytime you change
`_config.yml`](https://github.com/jekyll/jekyll/issues/2302).

1. In practice it was silly to have to re-roll the port on every reload - each
   `CTRL-C <up> <enter>` loop invalidated the current working browser tab and
   forced me to re-run `make open`.
2. It was _incredibly_ slow to boot, and really, to do anything. Turns out this was
   stemming from what I have come to learn are [_infamous_ performance issues
   with Docker volumes on
   Mac](https://docs.docker.com/docker-for-mac/osxfs/#performance-issues-solutions-and-roadmap).

## Now

So I've spent a few weekends now dusting this thing off. My big goal this time
around was to start collecting a [list of the talks I've given](/talks). I
switched Jekyll theme from the barebones [Lanyon](https://lanyon.getpoole.com/)
to the more fully featured [Minimal
Mistakes](https://mmistakes.github.io/minimal-mistakes/). Now that I've gotten
it all up and running, though, I find myself missing the typography and
simplicity of Lanyon. I am forcing myself to write this post instead of
endlessly futzing with themes, though.

On the Docker front, after playing around with the [`cached` volume
settings](https://docs.docker.com/docker-for-mac/osxfs-caching/) and only
seeing marginal improvements I took a closer look and realized that my gem
cache didn't actually need to be synced with the host. I could just use a named
volume instead.

I took that opportunity to rework the "Docker layer" encoded into the Makefile
into a `docker-compose` setup.

```yaml
version: '3'

volumes:
  jekyll_gems:
  jekyll_site:

services:
  jekyll:
    image: jekyll/jekyll:3.8
    command: jekyll serve --watch
    ports:
      - 4000:4000
    volumes:
      - .:/srv/jekyll
      - jekyll_site:/srv/jekyll/_site
      - jekyll_gems:/usr/local/bundle
```

I've not totally tested my assumptions here but my general understanding is
that named volumes are faster than mounted volumes because they don't need to
sync with the host. I made a second volume for `_site` since that dir is always
git-ignored and never used on the host - I haven't confirmed if this is helping
at all though. Regardless, the performance is oodles better, and the `Makefile`
is much simpler now. Here it is in its entirety:

```make
.PHONY: serve
serve: ## Run jekyll serve
	@docker-compose up

.PHONY: open
open: ## Open web browser with URL from jekyll serve
	@open http://localhost:4000

CMD?=help

.PHONY: jekyll
jekyll: ## Run jekyll command (set with CMD, defaults to help)
	@docker-compose run --rm \
		jekyll \
		jekyll $(CMD)

.PHONY: help
.DEFAULT_GOAL := help
help: ## Print help message (default)
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
```

That last `help` target is one of my favorite snippets of the past few years.
I'm pretty sure it came from this ["Self-Documented Makefile"
article](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html),
so props to François for that!

## Next

<label for="mn-update-theme" class="margin-toggle">&#8853;</label>
<input type="checkbox" id="mn-update-theme" class="margin-toggle"/>
<span class="marginnote">
_**Update July 30th, 2020**:
  In line with my prediction, I've already overhauled the theme to a custom one based on [tufte.css](https://edwardtufte.github.io/tufte-css/)._
</span>

I'm pretty sure that this theme is not going to last long w/o some significant
tweaks if not another theme shopping spree. Beyond that I want to continue
making the talks section better and mostly just getting things settled in a way
that I can find fewer excuses to futz with the site instead of just writing.

This thing is [all up on GitHub](https://github.com/phinze/phinze.github.io/)
so feel free to poke around!

Until next time.

