
.PHONY: clean prepare fetch-cookbooks

all: prepare clean fetch-cookbooks

clean:
	rm -rf cookbooks
	rm -rf tmp

prepare:
	gem install "librarian-chef"

fetch-cookbooks:
	librarian-chef install
