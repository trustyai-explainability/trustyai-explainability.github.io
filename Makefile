.PHONY: install
install:
	npm install

.PHONY: build
build: install
	npx antora antora-playbook.yml

.PHONY: serve
serve: build-local
	npx http-server build/site -p 8080 -a 0.0.0.0 --ext html -c-1

.PHONY: build-local
build-local: install
	@GIT_ROOT=$$(dirname "$$(git rev-parse --git-common-dir)"); \
	BRANCH=$$(git branch --show-current); \
	BRANCH=$${BRANCH:-HEAD}; \
	yq ".content.sources[0].branches = [\"$$BRANCH\"] | .content.sources[0].url = \"$$GIT_ROOT\"" antora-playbook.yml > antora-temp.yml; \
	npx antora antora-temp.yml; STATUS=$$?; \
	rm -f antora-temp.yml; \
	exit $$STATUS
