# Raw endpoints

These API endpoints provide direct access to Morpheus.

# Examples

## Greek

`http://localhost:1500/raw/greek/a)%2Fnqrwpos`:

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
## Latin

`http://localhost:1500/raw/latin/cactus`:

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

## Verbose

`http://localhost:1500/raw/greek/a)%2Fnqrwpos?verbose=true`:

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

## Details

There are two routes:

- `/raw/greek/:word`
- `/raw/latin/:word`

A `GET` request to one of these routes will call Morpheus with the input of `:word`.
The `/raw/greek` route will call it configured for Greek and the `/raw/latin` route will
call it configured for Latin.

Note that the `/raw/greek` route expects the input to be in
[Beta Code](https://en.wikipedia.org/wiki/Beta_Code). Also note that `/` needs
to be escaped as `%2F`, so the word `ἄνθρωπος` would be entered as `a)%2Fnqrwpos`.

## Options

Each route also accepts following query parameters which are passed to Morpheus:

| Option        | In Morpheus | Description |
| ------------- | ----------- | ----------- |
| strict\_case  | -S          | Set `?strict_case=true` to turn off Strict case. For Greek, this allows words with an initial capital to be recognized. For languages in the Roman alphabet, allows words with initial capital or in all capitals. |
| verbs\_only   | -V          | Analyze verbs only. |
| verbose       | -i          | Show more detailed output |

The accepted values for each parameter are `true` and `false`.
