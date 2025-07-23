# Makefile to simplify some common development tasks.
# Run 'make help' for a list of commands.

PYTHON=`which python`

default: help

help:
	@echo "Available commands:"
	@sed -n '/^[a-zA-Z0-9_.]*:/s/:.*//p' <Makefile | sort

test:
	PYTHON_INDEX_URL='https://:2023-04-18T08:30:36.960446Z@time-machines-pypi.sealsecurity.io/' tox

coverage:
	pytest --cov=sqlparse --cov-report=html --cov-report=term

clean:
	$(PYTHON) setup.py clean
	find . -name '*.pyc' -delete
	find . -name '*~' -delete

release:
	@rm -rf dist/
	python -m build
	twine upload --sign --identity E0B84F81 dist/*
