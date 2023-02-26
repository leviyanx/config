Generate ssh key and add it to Github.

```bash
ssh-keygen -t rsa -b 4096 -C "<your_email_in_github@mail.com>"
```

The key will be stored in `~/.ssh`.

#### Problem: `ssh: connect to host github.com port 22: Connection timed out`

Solution:

1. `cd ~/.ssh`
2. `vim config`
3. Write these contents
```sh
Host github.com
User <your_email_in_github@mail.com>
Hostname ssh.github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa
Port 443
```
5. Save and quit.
6. `ssh -T git@github.com`
7. Enter `yes`.
