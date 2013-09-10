
all:		log2bin$(EXE) awimage$(EXE) awflash$(EXE)

clean:
		rm -f awimage$(EXE) awflash$(EXE) log2bin$(EXE) parsecfg$(EXE)

log2bin$(EXE):	log2bin.c
		$(CC) -Wall -o $@ $^

awimage$(EXE):	awimage.c parsecfg.c twofish.c rc6.c
		$(CC) -Wall -o $@ $^

awflash$(EXE):	awflash.c
		$(CC) -Wall -o $@ $^ $(shell pkg-config --libs libusb)

parsecfg$(EXE):	parsecfg.c
		$(CC) -DSTANDALONE -Wall -o $@ $^
