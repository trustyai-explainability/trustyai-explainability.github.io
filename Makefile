.PHONY: install
install:
	npm install

.PHONY: build
build: install
	npx antora antora-playbook.yml

.PHONY: build-local
build-local: install
	yq '.content.sources[0].branches = ["HEAD"]' antora-playbook.yml > antora-temp.yml
	npx antora antora-temp.yml
	rm antora-temp.yml
