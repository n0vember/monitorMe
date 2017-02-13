PREFIX=/usr/local
INSTALL=install

CONFIG=config
CONFIG_OPTS=-o root -g root -m 0644

BIN=monitorMe
BIN_OPTS=-o root -g root -m 0755

all:
	@echo "type 'make install' to install"

install: $(BIN) $(CONFIG)

$(BIN): AnyEvent
	$(INSTALL) $(BIN_OPTS) $@ $(PREFIX)/bin/$@

$(CONFIG): config_dir
	$(INSTALL) $(CONFIG_OPTS) $@ /etc/monitorMe/$@

config_dir:
	mkdir -p /etc/monitorMe

AnyEvent:
	cpan AnyEvent
