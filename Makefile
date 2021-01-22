SRC = $(wildcard ./*.ipynb)

it: 
	nbdev_read_nbs
	nbdev_build_lib
	nbdev_clean_nbs
	git status

docs_serve: docs
	cd docs && bundle exec jekyll serve

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

clean:
	rm -rf dist

github:
	act -P ubuntu-latest=github_workflow_tester
