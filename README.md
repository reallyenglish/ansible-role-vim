# ansible-role-vim

Install `vim`

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `vim_package` | | `{{ __vim_package }}` |
| `vim_additional_packages` | | `[]` |

## Debian

| Variable | Default |
|----------|---------|
| `__vim_package` | `vim-nox` |

## FreeBSD

| Variable | Default |
|----------|---------|
| `__vim_package` | `vim-lite` |

## OpenBSD

| Variable | Default |
|----------|---------|
| `__vim_package` | `vim--no_x11` |

## RedHat

| Variable | Default |
|----------|---------|
| `__vim_package` | `vim-minimal` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-vim
  vars:
    # XXX shells/tcshrc is NOT related to vim at all but is included in
    # vim_additional_packages just for testing purpose
    vim_additional_packages: "{% if ansible_os_family == 'OpenBSD' %}[ 'vim-spell-uk' ]{% elif ansible_os_family == 'Debian' %}[ 'vim-scripts' ]{% elif ansible_os_family == 'RedHat' %}[ 'protobuf-vim' ]{% elif ansible_os_family == 'FreeBSD' %}[ 'shells/tcshrc' ]{% else %}[]{% endif %}"
```

# License

```
Copyright (c) 2017 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

This README was created by [qansible](https://github.com/trombik/qansible)
