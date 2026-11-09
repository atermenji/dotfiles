function dotpush --description 'Refresh Brewfile, commit all changes to tracked dotfiles, push to GitHub'
    # Only taps/formulae/casks: other dump types probe tools like cargo via asdf shims
    HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump --tap --formula --cask --force --file ~/.config/homebrew/Brewfile
    or return 1

    # Stage changes to files that are already tracked. New files need an explicit `config add <path>`.
    config add -u

    if config diff --cached --quiet
        echo "No changes to commit."
    else
        # The repo is public: refuse to commit anything that looks like a credential
        set -l suspicious (config diff --cached -U0 | string match -r '^\+.*' | string match -ri '^.*(?:api[_-]?key|secret|passw(?:or)?d|token\s*[:=]|bearer |gh[pousr]_[A-Za-z0-9]{20,}|github_pat_|sk-[A-Za-z0-9]{20,}|xox[abpr]-|AKIA[0-9A-Z]{16}|BEGIN [A-Z ]*PRIVATE KEY).*$')
        if test (count $suspicious) -gt 0
            set_color red
            echo "Refusing to commit: staged changes look like they contain a secret:"
            set_color normal
            printf '  %s\n' $suspicious
            echo "Fix it (or unstage with `config restore --staged <file>`), then re-run."
            return 1
        end

        config diff --cached --stat
        set -l msg (string join ' ' -- $argv)
        test -n "$msg"; or set msg "Update dotfiles"
        config commit -m "$msg"; or return 1
    end

    config push
end
