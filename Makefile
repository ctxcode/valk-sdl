vc ?= valk
SDL_LIB ?=
LINK := $(if $(SDL_LIB),-L $(SDL_LIB) --link-arg -rpath=$(abspath $(SDL_LIB)),)
RUN := $(if $(SDL_LIB),LD_LIBRARY_PATH=$(SDL_LIB) DYLD_LIBRARY_PATH=$(SDL_LIB),)

test:
	@mkdir -p debug
	$(vc) build ./tests --test -o ./debug/tests $(LINK)
	$(RUN) ./debug/tests

lint:
	$(vc) build ./src --lint --deny-warnings
	$(vc) build ./tests --lint --deny-warnings

example:
	@mkdir -p debug
	$(vc) build ./example -o ./debug/example $(LINK)
	$(RUN) ./debug/example

docs:
	@mkdir -p docs
	$(vc) doc . -o docs/api.md --markdown --no-private

.PHONY: test lint example docs
