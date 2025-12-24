if status is-interactive
    # Commands to run in interactive sessions can go here
    alias helix="hx"
    alias shd="shutdown now"
    alias l="lazygit"

    theme_gruvbox dark hard

    zoxide init fish | source
end
