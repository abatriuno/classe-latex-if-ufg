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
	@echo "Instituto de Física - Universidade Federal de Goiás"
	@echo "==================================================="
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
	*.run.xml *.bcf *.brf *loa *lol	