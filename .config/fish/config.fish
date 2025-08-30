if status is-interactive
  set -x EDITOR nvim
  set -x VISUAL nvim
  
 	set -g fish_greeting
  set -U fish_key_bindings fish_vi_key_bindings
  
  # Starship custom prompt
  starship init fish | source
  
  # Aliases
  alias lf="yazi"
  alias start_ssh_agent='eval (ssh-agent -c); ssh-add ~/.ssh/id_ed25519'
  alias cat="bat"
  alias sc="sesh connect (sesh list | fzf)"
  alias se="sudoedit"
  alias ls="eza -lha --group-directories-first --icons=auto"
  alias code="codium"

  # Shell Integration
  zoxide init fish | source
  fzf --fish | source    
  

end
