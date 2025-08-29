function fish_prompt --description 'Write out the prompt adapted for Arch Linux'
    set -l last_pipestatus $pipestatus

    # Git prompt config remains unchanged
    if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    # ... (all other __fish_git_prompt_* settings remain the same) ...

    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color normal

    printf '%s ' (fish_vcs_prompt)
    
    set -l pipestatus_string (__fish_print_pipestatus "[" "] " "|" (set_color $fish_color_status) (set_color --bold $fish_color_status) $last_pipestatus)
    echo -n $pipestatus_string
    set_color normal

    echo -n "$suffix "

    # Adapt project detection to Linux home folder or your project layout
    set -l project

    if echo (pwd) | grep -qEi "^/home/$USER/c/"
        set project (echo (pwd) | sed "s#^/home/$USER/c/\\([^/]*\\).*#\\1#")
    else
        set project Fish
    end

    # WakaTime tracking - ensure wakatime CLI is installed on Arch
    wakatime --write --plugin "fish-wakatime/0.0.1" --entity-type app --project "$project" --entity (echo $history[1] | cut -d ' ' -f1) 2>&1 >/dev/null &
end

