setup:
	python3 -m venv ~/.PaulNO-ML-api-CICD
	source ~/.PaulNO-ML-api-CICD/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv test_hello.py


lint:
	pylint --disable=R,C app.py

all: install lint test
