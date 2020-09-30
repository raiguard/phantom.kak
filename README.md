# phantom.kak

A [Kakoune] plugin that lets you iterate selections, one by one.

[Kakoune]: https://kakoune.org

## Installation

Add [`phantom.kak`](rc/phantom.kak) to your autoload or source it manually.

``` kak
require-module phantom
```

## Usage

Enable phantom with `phantom-enable` and `phantom-add-mappings`.

In _normal mode_:

- Press <kbd>F</kbd> to add selections.
- Press <kbd>f</kbd> to restore selections and consume register.
- Press <kbd>Alt</kbd> + <kbd>f</kbd> to clear phantom selections.
- Press <kbd>Space</kbd> (the keep selection command) twice to clear phantom selections.

In _insert mode_:

- Press <kbd>Alt</kbd> + <kbd>i</kbd> to _insert_ the main selection.
- Press <kbd>Alt</kbd> + <kbd>a</kbd> to _append_ the main selection.
- Press <kbd>Alt</kbd> + <kbd>n</kbd> to _insert_ the next selection.
- Press <kbd>Alt</kbd> + <kbd>p</kbd> to _insert_ the previous selection.

You can configure the `Phantom` face to your liking, which defaults to bold-italic-underline.

## Credits

Initial implementation and original idea from [occivink]/[kakoune-phantom-selection].

[occivink]: https://github.com/occivink
[kakoune-phantom-selection]: https://github.com/occivink/kakoune-phantom-selection
