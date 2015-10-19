
PDFLATEX := docker run -it -v `pwd`:/mnt -w /mnt pdflatex pdflatex

PDFLATEX_OPTS := -interaction="nonstopmode" \
	              -halt-on-error

build/rmprofile.pdf: rmprofile.tex rmprofile.cls .docker/pdflatex.tar
	rm -rf build
	mkdir  build
	docker load -i .docker/pdflatex.tar
	${PDFLATEX} ${PDFLATEX_OPTS} -output-directory="build" $<


.docker/pdflatex.tar: pdflatex/Dockerfile
	if [ -e $@ ]; then docker load -i $@; fi
	docker build -t pdflatex pdflatex
	mkdir -p .docker
	docker save pdflatex > $@


.PHONY: clean
clean:
	rm -rf build
	rm -rf .docker
	docker rmi pdflatex || return 0
	@echo "cleaned."
