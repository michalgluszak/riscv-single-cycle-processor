SOURCES = $(wildcard top/*.v) \
	  $(wildcard blocks/*/*_module/*.v)

top.vvp: $(SOURCES) 
	iverilog -o top.vvp $(SOURCES) 

show: 
	@echo $(SOURCES)

run: top.vvp
	vvp top.vvp

clean:
	rm -f top.vvp 

.PHONY: run show clean
