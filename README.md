# Phantom

[![IRC Badge]][IRC]

###### [Usage] | [Documentation] | [Contributing]

> Seamless integrate phantom selections in the existing command set of [Kakoune].

``` asciidoc
Phantom: Seamless integrate phantom selections in the existing command set.

Normal:
– *Space*: Clear selections *and show phantoms* (can be used to create new selections).
– Double-Space: Force the suppression of all selections (including phantoms).
– *Alt + Space*: Clear the main selection *including phantoms*.
– *)*: Rotate main selection forward *and re-hydrate the selections*.
– *(*: Rotate main selection backward *and re-hydrate the selections*.

Insert:
– Alt + i: Insert *before* the main selection.
– Alt + a: Insert *after* the main selection.
– Alt + n: Iterate *next* selection.
– Alt + p: Iterate *previous* selection.
```

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

- Use <kbd>Space</kbd> to clear the selections, leaving you the see of phantom selections.
- Use <kbd>(</kbd> or <kbd>)</kbd> to re-activate the selections.
- Use <kbd>Alt</kbd> + <kbd>Space</kbd> to clear a phantom selection.
- Use <kbd>Space</kbd> twice to suppress phantom selections.

In insert mode:

- Use <kbd>Alt</kbd> + <kbd>i</kbd> or <kbd>Alt</kbd> + <kbd>a</kbd> to freeze all selections except the main, and flip the direction.
- Use <kbd>Alt</kbd> + <kbd>n</kbd> or <kbd>Alt</kbd> + <kbd>p</kbd> to freeze all selections expect the main, and select the next or previous phantom selection.

## Keys

### Normal

- <kbd>Space</kbd>: Clear selections to only keep the main one, and show phantoms.  Pressing twice forces the suppression of all selections (including the phantom selections).
- <kbd>Alt</kbd> + <kbd>Space</kbd>: Clear the main selection (including phantoms).
- <kbd>)</kbd>: Rotate main selection forward.  When not possible (because of a single selection), re-activate the selections (phantom selections become normal selections).
- <kbd>(</kbd>: Rotate main selection backward.  When not possible (because of a single selection), re-activate the selections (phantom selections become normal selections).

### Insert

- <kbd>Alt</kbd> + <kbd>i</kbd>: Freeze all selections except the main, and flip the direction backward.
- <kbd>Alt</kbd> + <kbd>a</kbd>: Freeze all selections except the main, and flip the direction forward.
- <kbd>Alt</kbd> + <kbd>n</kbd>: Freeze all selections expect the main, and select the next phantom selection.
- <kbd>Alt</kbd> + <kbd>p</kbd>: Freeze all selections expect the main, and select the previous phantom selection.

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
[Documentation]: #keys
[Contributing]: CONTRIBUTING
[Pathogen]: https://github.com/alexherbo2/pathogen.kak
[occivink]: https://github.com/occivink
[kakoune-phantom-selection]: https://github.com/occivink/kakoune-phantom-selection
