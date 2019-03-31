# Phantom

[![IRC Badge]][IRC]

###### [Usage] | [Documentation] | [Contributing]

> Seamless integration of phantom selections for [Kakoune].

## Installation

### [Pathogen]

``` kak
pathogen-infect /home/user/repositories/github.com/alexherbo2/phantom.kak
```

## Usage

``` kak
hook global WinCreate .* %{
  phantom-enable
}
```

Iterate phantom selections in insert mode:

``` kak
map global insert <a-h> '<esc><space>i'
map global insert <a-l> '<esc><space>a'
map global insert <a-j> '<esc><space>)<space>i'
map global insert <a-k> '<esc><space>(<space>i'
```

- Use <kbd>Space</kbd> to clear the selections, leaving you the see of phantom selections.
- Use <kbd>(</kbd> or <kbd>)</kbd> to re-activate the selections.
- Use <kbd>Space</kbd> twice to suppress highlighting.

## Commands

- `phantom-enable`: Enable phantom selections
- `phantom-disable`: Disable phantom selections
- `phantom-toggle`: Toggle phantom selections

## Options

- `phantom_enabled` `bool`: Whether Phantom is active (Read-only)

## Faces

- `Phantom` `black,green`: Phantom face

## Credits

Similar extension from [occivink].

❯ [occivink]/[kakoune-phantom-selection]

[Kakoune]: https://kakoune.org
[IRC]: https://webchat.freenode.net?channels=kakoune
[IRC Badge]: https://img.shields.io/badge/IRC-%23kakoune-blue.svg
[Usage]: #usage
[Documentation]: #commands
[Contributing]: CONTRIBUTING
[Pathogen]: https://github.com/alexherbo2/pathogen.kak
[occivink]: https://github.com/occivink
[kakoune-phantom-selection]: https://github.com/occivink/kakoune-phantom-selection
