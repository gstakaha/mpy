
all:
	# sudo apt install -y gcc-arm-none-eabi build-essential cmake git python3
	git submodule update --init --recursive
	$(MAKE) -C micropython/mpy-cross
	$(MAKE) -C micropython/ports/rp2 BOARD=RPI_PICO_W USER_C_MODULES="$(CURDIR)/modules/usqlite/micropython.cmake"
	cp micropython/ports/rp2/build-RPI_PICO_W/firmware.uf2 .
