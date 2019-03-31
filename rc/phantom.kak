declare-option -docstring 'Whether Phantom is active' bool phantom_enabled no

declare-option -hidden range-specs phantom
declare-option -hidden str phantom_last_key

set-face global Phantom 'black,green'

define-command -hidden phantom-update -params .. %{ evaluate-commands %sh{
  keys=$@
  count() {
    echo $#
  }
  selection_count=$(count $kak_selections_desc)
  if test $selection_count -gt 1; then
    eval "set -- $kak_selections_desc"
    selections=$(echo $@ | sed --regexp-extended s/'([0-9]+)[.]([0-9]+),([0-9]+)[.]([0-9]+)'/'\1.\2,\3.\4|Phantom'/g)
    echo set-option window phantom $kak_timestamp $selections
  fi
  if test $(count $keys) -gt 0; then
    if test "$kak_opt_phantom_last_key" = '<space>' -a "$keys" = '<space>'; then
      echo try %[remove-highlighter window/phantom]
    fi
    echo set-option window phantom_last_key %arg[@]
  fi
}}

define-command -hidden phantom-execute-keys -params .. %{ evaluate-commands %sh{
  keys=$@
  count() {
    echo $#
  }
  echo try %[add-highlighter window/phantom ranges phantom]
  selection_count=$(count $kak_selections_desc)
  phantom_selection_count=$(($(count $kak_opt_phantom) - 1))
  if test $selection_count = 1 -a $phantom_selection_count -gt 0; then
    eval "set -- $kak_opt_phantom"
    shift
    main_selection=$kak_selection_desc
    selections=$(echo $@ | sed s/'|Phantom'//g)
    echo select $main_selection $selections
    echo execute-keys $keys
  fi
}}

define-command phantom-enable -docstring 'Enable phantom selections' %{

  hook window -group phantom NormalKey .* %(phantom-update %val(hook_param))
  hook window -group phantom NormalIdle '' phantom-update
  hook window -group phantom InsertMove .* %(phantom-update %val(hook_param))

  hook window -group phantom NormalKey [()] %{
    phantom-execute-keys %val(hook_param)
  }

  set-option window phantom_enabled yes

}

define-command phantom-disable -docstring 'Disable phantom selections' %{
  remove-highlighter window/phantom
  remove-hooks window phantom
  set-option window phantom_enabled no
}

define-command phantom-toggle -docstring 'Toggle phantom selections' %{ evaluate-commands %sh{
  if test $kak_opt_phantom_enabled = true; then
    echo phantom-disable
  else
    echo phantom-enable
  fi
}}
