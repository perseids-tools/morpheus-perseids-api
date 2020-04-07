# Processing Morpheus Output

The `processing-output` branch is intended to be used to figure out the best way
to process the order of Morpheus output.

## Setting up

```
docker-compose build
docker-compose run web ./scripts/setup.rb
```

These commands download a large number of treebanks and put them in the `./data` directory.
The treebanks are split into `training`, `validation`, and `test` sets.

## Running tests on data

To run the code on one of the data sets use the `test.rb` script:

```
docker-compose run web ./scripts/test.rb test
```

(Instead of `test` use `training` or `validation` to run it on another set.)

### Output

Without any changes to the code, this is the output on `test`:

```
Greek:
  Matches: 88079/147382, 59.76%
  Any match: 118388/147382, 80.33%
  Missing: 6983/147382, 4.74%
Latin:
  Matches: 12889/25315, 50.91%
  Any match: 21403/25315, 84.55%
  Missing: 1853/25315, 7.32%
Total:
  Matches: 100968/172697, 58.47%
  Any match: 139791/172697, 80.95%
  Missing: 8836/172697, 5.12%
```
