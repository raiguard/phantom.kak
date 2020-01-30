# phantom.kak

Phantom selections for [Kakoune].

## Installation

Add [`phantom.kak`](rc/phantom.kak) to your autoload or source it manually.

## Usage

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

You can configure the `Phantom` face to your liking, which defaults to green.

[Kakoune]: https://kakoune.org
