# Things to do when you start in fedora

## System setup

<details>

<summary>System</summary>

### Decrease visual perfomence (if needed)
settings > display - refresh rate

### Audio/video
https://rpmfusion.org/Howto/Multimedia?highlight=%28%5CbCategoryHowto%5Cb%29

### Scaling
https://www.omglinux.com/how-to-enable-fractional-scaling-fedora/

### Minimize & Maximize
https://ostechnix.com/how-to-enable-minimize-and-maximize-buttons-in-fedora/

### Problem for refresh button
https://support.mozilla.org/en-US/questions/1295110

### Two Panel Layout
https://linuxhint.com/create_two_panel_layout_gnome_shell_us/

</details>

<details>

<summary>Apps</summary>

### Install VSC
https://linuxiac.com/how-to-install-vs-code-on-fedora-linux/

### Install Ferdium
https://snapcraft.io/install/ferdium/fedora

fix discord issue:

https://github.com/ferdium/ferdium-app/issues/718
![image](https://github.com/user-attachments/assets/ccbdf165-49c8-42b4-ae3e-b99697da5054)


### Setup OBS
https://www.youtube.com/watch?v=ljAO6j5Ln9Q

</details>

<details>

<summary>dot-files</summary>

### .bashrc

Run this command so can your git-branch in prompt works:

```bash

curl -o ~/.git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
```

Add this code to your .bashrc to have similar prompt as me
```bash
# Command line prompt
PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs

__prompt_command() {
    local EXIT="$?"                # This needs to be first
    PS1=""

    # Your Username
    local USERNAME="FalconIzmi"

    # Colors
    local RCol='\[\e[0m\]'    # Exit color-change mode
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local LightGreenBold='\[\e[1;92m\]'
    local LightBlueBold='\[\e[38;5;45;1m\]'
    local DarkBlueBold='\[\e[38;5;33;1m\]'

    # Setup Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path
    local RemovePrefix="${VIRTUAL_ENV##*/}"
    #  Leave the env name
    local RemoveSufix="${RemovePrefix%-*}"
    local Venv="(${LightGreenBold}venv${RCol}:${RemoveSufix}) "
    else
        # In case you don't have one activated
        local Venv=''
    fi
    PS1+="${Venv}"

    # Setup Git
    source ~/.git-prompt.sh
    local GIT=$(__git_ps1 " (%s)")

    # Start adding code
    # Exit Code
    if [ $EXIT != 0 ]; then
        PS1+="[${Red}$EXIT${RCol}] "        # Add red if exit code non 0
    else
        PS1+="[${Gre}$EXIT${RCol}] "
    fi

    # First line
    PS1+="[\t] ${DarkBlueBold}[\w]${RCol}\n"
    # Second line
    PS1+="${LightGreenBold}${USERNAME}${RCol}${LightBlueBold}${GIT}${RCol} ${Gre}\$${RCol} "
}
```

https://github.com/falconizmi/start-fedora/blob/main/.bashrc

</details>

## Git setup

<details>

<summary>Install & keys</summary>

### Install git
```bash
sudo dnf install git
```

### Setup keys
```bash
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_NAME -C "EMAIL"
```

### Connect keys to github
[https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#adding-a-new-ssh-key-to-your-account)

</details>

## Encoured Problems Lenovo Legion 

<details>

<summary>Not found input sound when headphone removed mic</summary>

### 
Microphone is not recognized in discord when you have headphone that it has been removed microphone from it.
Follow steps under this comment: https://forum.manjaro.org/t/lenovo-legion-5-internal-mic-not-working/68064/8

</details>
