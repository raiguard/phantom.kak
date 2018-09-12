# Phantom

[![IRC Badge]][IRC]

###### [Usage] | [Documentation] | [Contributing]

> Seamless integration of phantom selections for [Kakoune].

## Installation

``` sh
ln --symbolic $PWD/rc $XDG_CONFIG_HOME/kak/autoload/phantom
```

## Usage

``` kak
hook global WinCreate .* %{
  phantom-enable
}
```

- Use <kbd>Space</kbd> to clear the selections, leaving you the see of phantom selections.
- Use <kbd>(</kbd> or <kbd>)</kbd> to re-activate the selections.
- Use <kbd>Escape</kbd> to suppress highlighting.

## Commands

- `phantom-enable`: Enable phantom selections
- `phantom-disable`: Disable phantom selections

## Faces

- `Phantom` `black,green`: Phantom face

[Kakoune]: http://kakoune.org
[IRC]: https://webchat.freenode.net?channels=kakoune
[IRC Badge]: https://img.shields.io/badge/IRC-%23kakoune-blue.svg
[Usage]: #usage
[Documentation]: #commands
[Contributing]: CONTRIBUTING
