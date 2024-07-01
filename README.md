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

### Setup OBS
https://www.youtube.com/watch?v=ljAO6j5Ln9Q

</details>

<details>

<summary>dot-files</summary>

### .bashrc
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
