# 1 Haskell A Day exercises

This project provides a git support for 1HaskellADay's exercises
(see [@1HaskellADay](http://twitter.com/1HaskellADay) and the hashtag [#1HaskellADay](https://twitter.com/search?q=%231HaskellAday&src=hash))

## Getting started

- Find an exercise in the `exercises` folder (there is one in the `Exercise.hs`
  file of each "leaf/date folder").  For example, the first one is in
  `HAD\Y2014\M02\D24\Exercise.hs`
- Do it.
- At the root of the project, run `stack ghci`: E.g.,<br/>
```
[~/Sources/learning/haskell/3rd/1HaskellADay (feature/stack)]
$ stack ghci
```
- check your answer with `check`. E.g.,<br/>
```
λ> check =<< date 2017 2 6
Examples: 3  Tried: 3  Errors: 0  Failures: 0
```
- compare your answer with the proposed one in the respective `Solution.hs` file; in order to check the solution, run
```
λ> doctest ["-iexercises/HAD", "exercises/HAD/Y2017/M02/D06/Solution.hs"]
Examples: 3  Tried: 3  Errors: 0  Failures: 0
```

### The 1had executable

If you install 1HaskellADay, you can use the `1had` executable for an easier access
to the tests and exercices.

```
[~/Sources/learning/haskell/3rd/1HaskellADay (feature/stack)]
$ stack install

[~/Sources/learning/haskell/3rd/1HaskellADay (feature/stack)]
$ 1had check 2017 2 6
Examples: 3  Tried: 3  Errors: 0  Failures: 0
```
