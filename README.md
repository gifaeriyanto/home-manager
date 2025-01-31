# Gifa's Home Manager with Ansible

Automate local apps installation and configuration with Ansible.

## Get Started

- make sure the script executable with this command `chmod +x install.sh` to install homebrew and ansible.
- run the script `setup.sh` to install homebrew and ansible
- run the ansible playbook `ansible-playbook -K install.yml`

## After Installation

### iTerm2

Import profile, [here](https://gist.github.com/gifaeriyanto/1c2cfea240fdcf9360afe9cb51ae5a4b) is my JSON profile.

### Import GPG Keys

#### 1. Connect to existing key

For **Public Key**

```bash
gpg --search-keys your_address@example.net
```

Choose the number, then it will be automatically imported.

For **Private Key**

```bash
# [FOR ME] download it from telegram with "gpg secret key" keyword
gpg --import secret.pgp

# verify the key
gpg --edit-key your_address@example.net
# then fill next with "**trust"**
# last, choose ultimate
```

If fail because no pinentry, do these:

```bash
# check pinentry-program
cat ~/.gnupg/gpg-agent.conf
# should be `pinentry-program $(brew --prefix)/bin/pinentry-mac`

# restart gpg agent if you edit the gpg-agent.conf
gpgconf --kill gpg-agent
```

#### 2. Configure GPG to Use pinentry-mac

Set GPG to use the pinentry-mac program for passphrase prompts. Edit `~/.gnupg/gpg-agent.conf` and add following line:

```
pinentry-program /opt/homebrew/bin/pinentry-mac
```

#### 3. Set the GPG_TTY Environment Variable in Fish

Inform GPG about the terminal it’s operating in by setting the GPG_TTY environment variable in Fish. Edit `~/.config/fish/config.fish` and add following line:

```
set -x GPG_TTY (tty)
```

#### 4. Restart the GPG Agent

```bash
gpgconf --kill gpg-agent
```

### Node install

Install node latest lts version and node 14

```bash
n lts
```

### Github CLI

Login to github via cli to validate your account

```bash
gh auth login
```

Fill password with your personal access token. See [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) for more information.
