
VERSION      ?=$(shell svu current)
BUMPED_PATCH ?=$(shell svu patch)
BUMPED_MINOR ?=$(shell svu minor)
BUMPED_MAJOR ?=$(shell svu major)

build:
	docker build -t go-present:just-built .

build-onbuild:
	docker build -t go-present:onbuild-just-built -f onbuild.Dockerfile .

build-all: build build-onbuild
	
push-patch: build-all
	docker tag go-present:just-built mkboudreau/go-present:$(BUMPED_PATCH)
	docker tag go-present:onbuild-just-built mkboudreau/go-present:$(BUMPED_PATCH)-onbuild
	docker push mkboudreau/go-present:$(BUMPED_PATCH) 
	docker push mkboudreau/go-present:$(BUMPED_PATCH)-onbuild

push-minor: build-all
	docker tag go-present:just-built mkboudreau/go-present:$(BUMPED_MINOR)
	docker tag go-present:onbuild-just-built mkboudreau/go-present:$(BUMPED_MINOR)-onbuild
	docker push mkboudreau/go-present:$(BUMPED_MINOR) 
	docker push mkboudreau/go-present:$(BUMPED_MINOR)-onbuild

push-major: build-all
	docker tag go-present:just-built mkboudreau/go-present:$(BUMPED_MAJOR)
	docker tag go-present:onbuild-just-built mkboudreau/go-present:$(BUMPED_MAJOR)-onbuild
	docker push mkboudreau/go-present:$(BUMPED_MAJOR) 
	docker push mkboudreau/go-present:$(BUMPED_MAJOR)-onbuild

push-latest:
	docker tag go-present:just-built mkboudreau/go-present:latest
	docker tag go-present:onbuild-just-built mkboudreau/go-present:latest-onbuild
	docker push mkboudreau/go-present:latest
	docker push mkboudreau/go-present:latest-onbuild

debug-versions:
	@echo "current: $(VERSION)"
	@echo "if bumped..."
	@echo "patch  : $(BUMPED_PATCH)"
	@echo "minor  : $(BUMPED_MINOR)"
	@echo "major  : $(BUMPED_MAJOR)"

