ARQUIVO=IF
current_dir=$(shell pwd)
OS := $(shell uname)

ifeq ($(OS),Linux)
  PDFVIEW=xdg-open
endif
ifeq ($(OS),Darwin)
  PDFVIEW=open
endif

.PHONY: all

all:	msg.intro main clean view msg.final

msg.intro:
	@echo ""
<<<<<<< HEAD
<<<<<<< HEAD
	@echo "Instituto de Física - Universidade Federal de Goiás"
	@echo "==================================================="
=======
	@echo "Instituto de Informática - Universidade Federal de Goiás"
	@echo "========================================================"
>>>>>>> 822d513afa02fb06a0aad35331c56deb6f3d6a73
=======
	@echo "Instituto de Informática - Universidade Federal de Goiás"
	@echo "========================================================"
>>>>>>> 822d513afa02fb06a0aad35331c56deb6f3d6a73
	@echo "Classe LaTeX: if-ufg.cls. Versão: 1.0 - 19/04/2015."
	@echo ""
	@echo "Formatação de TCC, Monografia, Dissertação e Tese (ABNT)"
	@echo "--------------------------"
	@echo "(c) 2015 Alexandre Barbosa"		
	@echo "" ;\

msg.final:
	@echo ""
	@echo "Trabalho finalizado com sucesso!"	
	@echo "";\

main:
	@ pdflatex -file-line-error -halt-on-error $(ARQUIVO).tex | grep ".*:[0-9]*:.*" ;\
	bibtex -terse $(ARQUIVO).aux ;\
	pdflatex -file-line-error -halt-on-error $(ARQUIVO).tex | grep ".*:[0-9]*:.*" ;\
	pdflatex -file-line-error -halt-on-error $(ARQUIVO).tex 1> /dev/null ;\

view:
	$(shell $(PDFVIEW) $(ARQUIVO).pdf)

clean:
	@rm -rf *.aux *.soc *.toc *.lo[fpt] *.blg *.bbl *.log *.out \
	*.ind *.ilg *.idx *.glo *.gls *~ *.bm *.ps *.vbr *.backup \
<<<<<<< HEAD
<<<<<<< HEAD
	*.run.xml *.bcf *.brf *loa *lol	
=======
	*.run.xml *.bcf *.brf *loa *lol	
>>>>>>> 822d513afa02fb06a0aad35331c56deb6f3d6a73
=======
	*.run.xml *.bcf *.brf *loa *lol	
>>>>>>> 822d513afa02fb06a0aad35331c56deb6f3d6a73
