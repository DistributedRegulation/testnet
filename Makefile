BITCOIND=bitcoind
BITCOINDCLEAN=bitcoind-clean
BITCOINGUI=bitcoin-qt
B1_FLAGS=-regtest
B2_FLAGS=-regtest
B1=-datadir=1 $(B1_FLAGS)
B2=-datadir=2 $(B2_FLAGS)
B3=-datadir=3 $(B2_FLAGS)
B4=-datadir=4 $(B2_FLAGS)
B5=-datadir=5 $(B2_FLAGS)

start:
	$(BITCOIND) $(B1) -daemon
	$(BITCOINDCLEAN) $(B2) -daemon	
	$(BITCOIND) $(B3) -daemon	
	$(BITCOIND) $(B4) -daemon	
	$(BITCOIND) $(B5) -daemon	

start-gui:
	$(BITCOINGUI) $(B1) &
	$(BITCOINGUI) $(B2) &
	$(BITCOINGUI) $(B3) &
	$(BITCOINGUI) $(B4) &
	$(BITCOINGUI) $(B5) &

generate-true:
	$(BITCOIND) $(B1) setgenerate true

clean-generate-true:
	$(BITCOINDCLEAN) $(B2) setgenerate true

generate-false:
	$(BITCOIND) $(B1) setgenerate false

clean-generate-false:
	$(BITCOINDCLEAN) $(B2) setgenerate false

getinfo:
	$(BITCOIND) $(B1) getinfo
	$(BITCOINDCLEAN) $(B2) getinfo
	$(BITCOIND) $(B3) getinfo
	$(BITCOIND) $(B4) getinfo
	$(BITCOIND) $(B5) getinfo

stop:
	$(BITCOIND) $(B1) stop &
	$(BITCOINDCLEAN) $(B2) stop &
	$(BITCOIND) $(B3) stop &
	$(BITCOIND) $(B4) stop &
	$(BITCOIND) $(B5) stop &

clean:
	git clean -fd 1/regtest
	git clean -fd 2/regtest
	git clean -fd 3/regtest
	git clean -fd 4/regtest
	git clean -fd 5/regtest
	git checkout -- 1/regtest
	git checkout -- 2/regtest
	git checkout -- 3/regtest
	git checkout -- 4/regtest
	git checkout -- 5/regtest

