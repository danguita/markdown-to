DOCKER_IMAGE_NAME := jagregory/pandoc:latest
FILE_DIR_NAME     := $(shell dirname $(SOURCE_FILE))
FILE_BASE_NAME    := $(shell basename $(SOURCE_FILE) | cut -d. -f1)
DOCKER_RUN        := docker run -it --rm -v "$(FILE_DIR_NAME):/source"

.PHONY: pdf html

pdf:
	$(DOCKER_RUN) $(DOCKER_IMAGE_NAME) -f markdown -t latex $(FILE_BASE_NAME).md -o $(FILE_BASE_NAME).pdf

html:
	$(DOCKER_RUN) $(DOCKER_IMAGE_NAME) -f markdown -t html5 -c $(PWD)/template/github.css $(FILE_BASE_NAME).md -o $(FILE_BASE_NAME).html
