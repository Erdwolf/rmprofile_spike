
PDFLATEX := docker run -it -v `pwd`:/mnt -w /mnt pdflatex pdflatex

PDFLATEX_OPTS := -interaction="nonstopmode" \
	              -halt-on-error

rmprofile.pdf: rmprofile.tex docker-pdflatex
	rm -rf build
	mkdir  build
	${PDFLATEX} ${PDFLATEX_OPTS} -output-directory="build" $<

.PHONY: docker-pdflatex clean
docker-pdflatex: Dockerfile
	docker build -t pdflatex .

.PHONY: clean
clean:
	rm -f rmprofile.pdf
	rm -f rmprofile.aux
	rm -f rmprofile.log
	docker rmi pdflatex || return 0
	@echo "cleaned."
