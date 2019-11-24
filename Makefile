# Master makefile of CollabVM Server

ifeq ($(OS), Windows_NT)
# Allow selection of w64 or w32 target
ifneq ($(WARCH), win32)
$(info [>] Compiling targeting Win64)
MKCONFIG=mk/win64.mk
ARCH=amd64
BINDIR=bin/win64/
else
$(info [>] Compiling targeting x86 Windows)
MKCONFIG=mk/win32.mkc
BINDIR=bin/win32/
ARCH=x86
endif

else

# Assume Linux or other *nix-likes
$(info [>] Compiling targeting *nix)
MKCONFIG=mk/linux.mkc
BINDIR=bin/
ARCH=$(shell uname -m)

endif

ifeq ($(DEBUG),)
DEBUG = 0
endif

ifeq ($(DEBUG),1)
$(info [>] Building in debug mode)
else
$(info [>] Building in release mode)
endif

all: pre_common
	@$(MAKE) -f $(MKCONFIG) DEBUG=$(DEBUG)
	@./scripts/build_site.sh $(ARCH)
	@mv -f http/ $(BINDIR)

pre_common:
	@if [ ! -d "bin" ]; then echo "[>] MKDIR 'bin'" && mkdir bin; fi
	@if [ ! -d "obj" ]; then echo "[>] MKDIR 'obj'" && mkdir obj; fi

clean:
	@$(MAKE) -f $(MKCONFIG) clean
	@echo "[>] RMDIR 'bin/'"
	@rm -rf bin/
	@echo "[>] RMDIR 'obj/'"
	@rm -rf obj/
help:
	@echo -e "CollabVM Server 1.2.9 Makefile help:\n"
	@echo "make - Build release"
	@echo "make DEBUG=1 - Build a debug build (Adds extra trace information and debug symbols)"
