install:
	pip install --upgrade pip
	pip install -r requirement.txt

test:
	python -m pytest -vvv --cov=hello --cov=greeting --cov=smath --cov=web tests
	python -m pytest --nbval notebook.ipynb
	# python -m pytest -v tests/test_web.py

debug:
	python -m pytest -v --pdb

one-test:
	python -m pytest -vv tests/test_greeting.py::test_my_name4

debugthree:
	python -m pytest -v --pdb --maxfail=4

format:
	black *.py

lint:
	pylint --disable=R,C *.py

all: install lint test format