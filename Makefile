PREFIX=/usr/local
INSTALL=install

CONFIG=config
CONFIG_OPTS=-o root -g root -m 0644

BIN=monitorMe
BIN_OPTS=-o root -g root -m 0755

.PHONY: $(BIN) $(CONFIG)

all:
	@echo "type 'make install' to install"
	@echo "type 'make uninstall' to uninstall"

install: $(BIN) $(CONFIG)

$(BIN):
	$(INSTALL) $(BIN_OPTS) $@ $(PREFIX)/bin/$@

$(CONFIG): config_dir
	$(INSTALL) $(CONFIG_OPTS) $@ /etc/monitorMe/$@

config_dir:
	mkdir -p /etc/monitorMe

uninstall:
	@for bin in $(BIN) ; do rm -vf $(PREFIX)/bin/$$bin ; done
	@rm -rvf /etc/monitorMe
