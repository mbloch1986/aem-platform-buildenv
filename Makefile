version ?= 0.12.0-pre.0

ci: clean deps lint docker-base docker-sandpit

clean:
	rm -rf logs modules

init:
	mkdir -p artifacts

deps:
	gem install bundler
	bundle install
	r10k puppetfile install --moduledir modules --verbose

lint:
	puppet-lint \
		--fail-on-warnings \
		--no-documentation-check \
		provisioners/*.pp
	shellcheck \
		provisioners/*.sh

docker-base:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/aem-platform-buildenv.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-base.json

docker-sandpit:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/aem-platform-buildenv-sandpit.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-sandpit.json

docker-publisher:
	mkdir -p logs/
	mkdir -p stage/artifacts-publisher/
	PACKER_LOG_PATH=logs/aem-platform-buildenv-publisher.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-publisher.json

publish-base:
	docker push shinesolutions/aem-platform-buildenv:latest
	docker push shinesolutions/aem-platform-buildenv:$(version)

publish-sandpit:
	docker push shinesolutions/aem-platform-buildenv-sandpit:latest
	docker push shinesolutions/aem-platform-buildenv-sandpit:$(version)

build:
	scripts/run-playbook-stack.sh build "${config_path}"

publish:
	scripts/run-playbook-stack.sh publish "${config_path}"

release:
	rtk release
	
.PHONY: ci clean init deps lint docker-base docker-sandpit docker-publisher publish-base publish-sandpit release
