# Morpheus API

Morpheus API provides an API interface for the
[Morpheus](https://github.com/perseids-tools/morpheus)
morphological parsing tool.

It takes Ancient Greek or Latin text as input and then lemmatizes the text
and performs a morphological analysis.

## Running

### Docker Compose

#### Running a standalone server

```
docker-compose build
docker-compose up
```

#### Including in other compose files

Include `perseidsproject/morpheus-api` as one of your services in `docker-compose.yml`.
The simplest version would be:

```yaml
version: '3'
services:
  morph:
    image: perseidsproject/morpheus-api:v1.0.0
    ports:
      - "1315:1315"
```

The port can be customized using an environment variable.
For example, if you want to run on port 3000:

```yaml
version: '3'
services:
  morph:
    image: perseidsproject/morpheus-api:v1.0.0
    environment:
      - PORT=3000
    ports:
      - "3000:3000"
```

(See project on [Docker Hub](https://hub.docker.com/r/perseidsproject/morpheus-api/).)

### Unix/Linux

Requirements:

- ruby (~2.5)
- bundler

```bash
bundle install

MORPHLIB=/path/to/stemlib EXECUTABLE=/path/to/cruncher bundle exec ruby app.rb
```

## Usage

### Examples

`http://localhost:1315/greek/a)%2Fnqrwpos`:

```
a)/nqrwpos
<NL>N a)/nqrwpos  masc nom sg			os_ou</NL>
```

`http://localhost:1315/latin/cactus`:

```
cactus
<NL>N cactus  masc nom sg			us_i</NL>
```

`http://localhost:1315/greek/a)%2Fnqrwpou?opts=n`:

```
a)/nqrwpou
<NL>N a)nqrw/pou,a)/nqrwpos  masc gen sg			os_ou</NL><NL>V a_)nqrwpou=,a)nqrwpo/omai  imperf ind mp 2nd sg	doric aeolic	contr	ow_pr,ow_denom</NL><NL>V a)nqrwpou=,a)nqrwpo/omai  pres imperat mp 2nd sg		contr	ow_pr,ow_denom</NL><NL>V a)nqrwpou=,a)nqrwpo/omai  imperf ind mp 2nd sg	homeric ionic	contr unaugmented	ow_pr,ow_denom</NL><NL>N a)nqrwpou=,a)nqrwpw/  fem nom/voc/acc dual		contr	w_oos</NL>
```

### Details

There are two routes:

- `/greek/:word`
- `/latin/:word`

A GET request to one of those routes will call Morpheus with the input of `:word`.
The `/greek` route will call it configured for Greek and the `/latin` route will
call it configured for Latin.

Note that the `/greek` route expects the input to be in
[Beta Code](https://en.wikipedia.org/wiki/Beta_Code). Also note that `/` needs
to be escaped as `%2F`, so the word `ἄνθρωπος` would be entered as `a)%2Fnqrwpos`.

#### Options

Each route also accept the `?opts=:options` query parameter where `:options` contains the options
sent to Morpheus. Each option is a single letter and can be combined with other options.

For example, to find only headwords (`-l`) and ignore accents (`-n`) for the word `ἀστη`, go to
`http://localhost:1315/greek/a)sth?opts=nl`.

The result is:

```
form:a)sth
a)/stu
a)sth/
```

The full list of options and their equivalents in Morpheus is:

| Option | In Morpheus | Description |
| - | - | - |
| s | -S | Turn off Strict case. For Greek, this allows words with an initial capital to be recognized. For languages in the Roman alphabet, allows words with initial capital or in all capitals. |
| n | -n | Ignore accents.|
| d | -d | Database format. This switch changes the output from "Perseus format" to "database format." Output appears in a series of tagged fields. |
| e | -e | Ending index. Instead of showing the analysis in readable form, this switch gives the indices of the tense, mood, case, number, and so on (as appropriate) in the internal tables. |
| k | -k | Keep beta-code. When "Perseus format" is enabled (the default), this switch does nothing. When "Perseus format" is off, output (Greek as well as Latin) is converted to the old Greek Keys encoding. This switch disables that conversion so that Greek output stays in beta-code. |
| l | -l | Show lemma. When this switch is set, instead of printing the entire analysis, cruncher will only show the lemma or headword from which the given form is made. |
| p | -P | Turn off Perseus format. Output will be in the form `$feminam& is^M &from$ femina^M $fe\_minam^M [&stem $fe\_min-& ]^M & a\_ae fem acc sg^M`. Note the returns, without line feeds, between the fields. |
| v | -V | Analyze verbs only. |
