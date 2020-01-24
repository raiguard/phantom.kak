hook global ModuleLoaded phantom %{
  phantom-enable
}

provide-module phantom %{

  # Options ────────────────────────────────────────────────────────────────────

  declare-option -hidden range-specs phantom_highlighter

  # Faces ──────────────────────────────────────────────────────────────────────

  set-face global Phantom 'black,green'

  # Highlighters ───────────────────────────────────────────────────────────────

  add-highlighter shared/phantom ranges phantom_highlighter

  # Commands ───────────────────────────────────────────────────────────────────

  define-command phantom-enable -docstring 'Enable phantom' %{
    add-highlighter global/phantom ref phantom
    # Update highlighter when saving marks
    hook -group phantom global NormalKey 'Z' phantom-update-highlighter
    hook -group phantom global NormalKey '<a-Z>' %{
      hook -always -once window ModeChange '\Qpop:next-key[combine-selections]:normal\E' %{
        hook -always -once window NormalIdle .* %{
          phantom-update-highlighter
        }
      }
    }
    # Mappings
    map global normal Z ': phantom-append<ret>'
    map global normal z ': phantom-restore; phantom-clear<ret>'
    # Iterate phantom selections in insert mode.
    map global insert <a-i> '<esc>: phantom-append<ret><space>i'
    map global insert <a-a> '<esc>: phantom-append<ret><space>a'
    map global insert <a-n> '<esc>: phantom-append; phantom-restore<ret>)<space>i'
    map global insert <a-p> '<esc>: phantom-append; phantom-restore<ret>(<space>i'
  }

  define-command phantom-disable -docstring 'Disable phantom' %{
    remove-highlighter global/phantom
    remove-hooks global phantom
    unmap global normal Z
    unmap global normal z
    unmap global insert <a-i>
    unmap global insert <a-a>
    unmap global insert <a-n>
    unmap global insert <a-p>
  }

  define-command phantom-save -docstring 'Save phantom selections' %{
    execute-keys -save-regs '' Z
    phantom-update-highlighter
  }

  define-command phantom-append -docstring 'Append current selections to phantom selections' %{
    try %{
      execute-keys -draft z
      execute-keys -save-regs '' <a-Z>a
    } catch %{
      execute-keys -save-regs '' Z
    }
    phantom-update-highlighter
  }

  define-command phantom-restore -docstring 'Restore phantom selections' %{
    execute-keys z
    phantom-update-highlighter
  }

  define-command phantom-clear -docstring 'Clear phantom selections' %{
    set-register ^
    phantom-update-highlighter
  }

  define-command -hidden phantom-update-highlighter %{
    evaluate-commands %sh{
      eval "set -- $kak_quoted_reg_caret"
      metadata=$1
      shift
      phantom_highlighter=$kak_timestamp
      for selection_desc do
        phantom_highlighter="$phantom_highlighter $selection_desc|Phantom"
      done
      printf 'set-option window phantom_highlighter %s' "$phantom_highlighter"
    }
  }
}

require-module phantom
