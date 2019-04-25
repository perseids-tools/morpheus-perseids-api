# Morpheus Perseids API

Morpheus Perseids API provides an API interface for the
[Morpheus Perseids](https://github.com/perseids-tools/morpheus-perseids)
version of the Morpheus morphological parsing tool.

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

Include `perseidsproject/morpheus-perseids-api` as one of your services in `docker-compose.yml`.
The simplest version would be:

```yaml
version: '3'
services:
  morph:
    image: perseidsproject/morpheus-perseids-api:v1.0.0
    ports:
      - "1316:1316"
```

The port can be customized using an environment variable.
For example, if you want to run on port 3000:

```yaml
version: '3'
services:
  morph:
    image: perseidsproject/morpheus-perseids-api:v1.0.0
    environment:
      - PORT=3000
    ports:
      - "3000:3000"
```

(See project on [Docker Hub](https://hub.docker.com/r/perseidsproject/morpheus-perseids-api/).)

### Unix/Linux

Requirements:

- ruby (~2.5)
- bundler

```bash
bundle install

MORPHLIB=/path/to/stemlib EXECUTABLE=/path/to/morpheus bundle exec ruby app.rb
```

## Usage

### Examples

`http://localhost:1316/greek/a)%2Fnqrwpos`:

```xml
<words>
  <word>
    <form xml:lang="grc-x-beta">a)/nqrwpos</form>
    <entry>
      <dict>
        <hdwd xml:lang="grc-x-beta">a)/nqrwpos</hdwd>
        <pofs order="3">noun</pofs>
        <decl>2nd</decl>
        <gend>masculine</gend>
      </dict>
      <infl>
        <term xml:lang="grc-x-beta">
          <stem>a)nqrwp</stem>
          <suff>os</suff>
        </term>
        <pofs order="3">noun</pofs>
        <decl>2nd</decl>
        <case order="7">nominative</case>
        <gend>masculine</gend>
        <num>singular</num>
        <stemtype>os_ou</stemtype>
      </infl>
    </entry>
  </word>
</words>
```

`http://localhost:1316/latin/cactus`:

```xml
<words>
  <word>
    <form xml:lang="lat">cactus</form>
    <entry>
      <dict>
        <hdwd xml:lang="lat">cactus</hdwd>
        <pofs order="3">noun</pofs>
        <decl>2nd</decl>
        <gend>masculine</gend>
      </dict>
      <infl>
        <term xml:lang="lat">
          <stem>cact</stem>
          <suff>us</suff>
        </term>
        <pofs order="3">noun</pofs>
        <decl>2nd</decl>
        <case order="7">nominative</case>
        <gend>masculine</gend>
        <num>singular</num>
        <stemtype>us_i</stemtype>
      </infl>
    </entry>
  </word>
</words>
```

`http://localhost:1316/greek/a)%2Fnqrwpos?opts=i`:

```xml
<words>
  <word>
    <form xml:lang="grc-x-beta">a)/nqrwpos</form>
    <dump_analysis>
      <self>
        <form>0200440000</form>
        <form.number>01</form.number>
        <form.case>01</form.case>
        <form.gender>01</form.gender>
        <stem>010201 os_ou</stem>
        <str>a)/nqrwpos</str>
      </self>
      <stem>
        <form>0200000000</form>
        <form.gender>01</form.gender>
        <stem>010201 os_ou</stem>
        <str>a)nqrwp</str>
      </stem>
      <end>
        <form>0200440000</form>
        <form.number>01</form.number>
        <form.case>01</form.case>
        <form.gender>01</form.gender>
        <stem>010201 os_ou</stem>
        <str>os</str>
      </end>
      <rawword>a)/nqrwpos</rawword>
      <wkword>a)/nqrwpos</wkword>
    </dump_analysis>
    <entry>
      <dict>
        <hdwd xml:lang="grc-x-beta">a)/nqrwpos</hdwd>
        <pofs order="3">noun</pofs>
        <decl>2nd</decl>
        <gend>masculine</gend>
      </dict>
      <infl>
        <term xml:lang="grc-x-beta">
          <stem>a)nqrwp</stem>
          <suff>os</suff>
        </term>
        <pofs order="3">noun</pofs>
        <decl>2nd</decl>
        <case order="7">nominative</case>
        <gend>masculine</gend>
        <num>singular</num>
        <stemtype>os_ou</stemtype>
      </infl>
    </entry>
  </word>
</words>
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

The full list of options and their equivalents in Morpheus Perseids is:

| Option | In Morpheus | Description |
| - | - | - |
| s | -S | Turn off Strict case. For Greek, this allows words with an initial capital to be recognized. For languages in the Roman alphabet, allows words with initial capital or in all capitals. |
| v | -V | Analyze verbs only. |
| i | -i | Show more detailed output |
