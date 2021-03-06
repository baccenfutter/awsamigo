.PHONE: help install uninstall build distribute clean

PROJECT_NAME := "awsamigo"

ifdef PYPI_REPO
export TWINE_OPTS = --repository=$(PYPI_REPO)
else
export TWINE_OPTS = ""
endif

ifndef VIRTUAL_ENV
$(error You are not inside a Python virtualenv!)
endif

export TWINE = $(shell which twine)

help:
	@echo
	@echo "Available targets:"
	@echo "  install    - Install $(PROJECT_NAME)"
	@echo "  uninstall  - Uninstall $(PROJECT_NAME)"
	@echo "  build      - Build source distribution for $(PROJECT_NAME)."
	@echo "  distribute - Upload source distribution to PyPi via TWINE."
	@echo

install:
	pip install -e .[dev]

uninstall:
	pip uninstall -y blunix_toolkit

build:
	python setup.py sdist

distribute: clean build
	if [[ -z $(PYPI_REPO) ]]; then echo "PYPI_REPO is not defined!"; fi
	$(TWINE) upload dist/* $(TWINE_OPTS)

release:
	@git status
	@echo
	@echo "Current version is: $(shell git describe)"
	@read -p "What's the new version? " new_version; \
		if [[ -n "$$new_version" ]]; then \
			git tag -s -a "$$new_version"; \
			if [[ $$? -eq 0 ]]; then \
				echo git push && \
				echo git push --tags && \
				echo PYPI_REPO=baccenfutter $(MAKE) clean build distribute; \
			fi; \
		fi

clean:
	rm -rf *.egg-info
	rm -rf build/ dist/ MANIFEST
	find -name \*.pyc -delete
