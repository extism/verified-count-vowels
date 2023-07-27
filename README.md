# verified-count-vowels

A formally verified Extism `count_vowels` implementation in Coq, extracted to Haskell

The Coq source can be found in [CountVowels.v](./CountVowels.v), during the build process the code is extracted to
[src/CountVowels.hs](./src/CountVowels.hs). 

## Building

You will need [wasm32-wasi-ghc](https://gitlab.haskell.org/ghc/ghc-wasm-meta), then:

```shell
$ make build
```

## Testing

```shell
$ make test
```
