help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: setup
setup: ## setups up the dev environment
	@[[ "$(shell python3 --version 2>&1)" == "Python 3.7."* ]] || \
		(echo "Error: using $$(python --version 2>&1) not 3.7. Are you in your venv?" && exit 1)
	rm -rf venv
	python3 -m venv venv
	./venv/bin/python -m pip install --upgrade pip
	./venv/bin/python -m pip install -U setuptools
	./venv/bin/python -m pip install -r requirements.txt
	./venv/bin/pip install --editable ."[dev]"
	./venv/bin/python -m pre_commit install

.PHONY: build
build: coverage ## builds utiml-backup wheel
	@[[ "$(shell python3 --version 2>&1)" == "Python 3.7."* ]] || \
		(echo "Error: using $$(python --version 2>&1) not 3.7. Are you in your venv?" && exit 1)
	./venv/bin/pip install --editable ."[dev]"
	rm -rf utiml-backup-0.0.1-py37-none-any.whl
	./venv/bin/python setup.py bdist_wheel --dist-dir .

.PHONY: test
test: # runs all tests
	@[[ "$(shell python3 --version 2>&1)" == "Python 3.7."* ]] || \
		(echo "Error: using $$(python --version 2>&1) not 3.7. Are you in your venv?" && exit 1)
	./venv/bin/python -m pytest tests

.PHONY: lint
lint: ## lints the code and fails if errors
	./venv/bin/flake8 src tests --format=html --htmldir=flake-report

.PHONY: coverage
coverage: ## runs test coverage report and fails if below 75%
	./venv/bin/coverage run -m pytest tests
	./venv/bin/coverage combine
	./venv/bin/coverage report -m
	./venv/bin/coverage html
	./venv/bin/coverage xml
	./venv/bin/coverage report --fail-under=75

.PHONY: publish
publish: lint coverage build ## publishes utiml-backup in pypi
	echo "TODO"
	