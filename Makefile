
PDFLATEX := docker run -it -v `pwd`:/mnt -w /mnt pdflatex pdflatex

PDFLATEX_OPTS := -interaction="nonstopmode" \
	              -halt-on-error

build/rmprofile.pdf: rmprofile.tex rmprofile.cls docker-pdflatex
	rm -rf build
	mkdir  build
	${PDFLATEX} ${PDFLATEX_OPTS} -output-directory="build" $<


.PHONY: docker-pdflatex
docker-pdflatex: pdflatex/Dockerfile
	docker build -t pdflatex pdflatex


.PHONY: clean
clean:
	rm -rf build
	docker rmi pdflatex || return 0
	@echo "cleaned."
