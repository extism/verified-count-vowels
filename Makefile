build: impl
	wasm32-wasi-cabal build
	@cp `find dist-newstyle -name 'verified-count-vowels.wasm'` .

impl:
	coqc CountVowels.v
	@rm -f CountVowels.glob CountVowels.vo* .CountVowels.aux .lia.cache

test:
	extism call ./verified-count-vowels.wasm count_vowels --wasi --input "this is a test"
