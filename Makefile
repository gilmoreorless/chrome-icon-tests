iconsizes := {16,19,24,32,38,48,64,96,128,256}
icondir := icons
iconfiles := $(shell echo $(icondir)/icon-$(iconsizes).png)

$(icondir)/icon-%.png:
	@mkdir -p $(@D)
	./create-icon.sh $* $@

icons: $(iconfiles)

clean:
	rm -f $(iconfiles)

.PHONY: icons clean
