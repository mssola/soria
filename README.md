<p align="center">
  <a href="https://travis-ci.org/mssola/soria" title="Travis CI status for the master branch"><img src="https://travis-ci.org/mssola/soria.svg?branch=master" alt="Build Status for master branch" /></a>
  <a href="http://www.gnu.org/licenses/gpl-3.0.txt" rel="nofollow"><img alt="License GPL 3" src="https://img.shields.io/badge/license-GPL_3-blue.svg" style="max-width:100%;"></a>
</p>

---

Soria is a color theme which mixes:

- [xoria256](http://www.vim.org/scripts/script.php?script_id=2140): a color
  theme by Dmitry Zotikov, originally for Vim. I did not do the initial porting
  from Vim to Emacs, I took it from [[https://github.com/suxue/xoria256-emacs][suxue]].
- openSUSE: I took some colors from [openSUSE's Brand Guidelines](http://opensuse.github.io/branding-guidelines/).

In the `soria-theme.el` file I list further acknowledgements. To install it,
just drop the =soria-theme.el= file into your `~/.emacs.d` and load it with
`load-theme`.

## Configuration

This color theme defines the =soria= group, which in turn has only one
configuration option:

- `soria-theme-hide-helm-header`: the Helm package in combination with
  Projectile shows a header that in my humble opinion is quite useless and it's
  distracting. For this reason, this header is hidden by default. If you set it
  to false, then you'll see the header with the same colors as the status line.

Moreover, this theme also provides one function that can be used as a hook:
`soria-theme-purple-identifiers`. As a reminder, this color theme is a port from
Vim, and Vim and Emacs have some different takes on function identifiers. As
such, the original Vim theme defines identifiers as purple, but only method
definitions in Ruby, Perl and PHP (languages that I've used with these theme,
there might be more) were highlighted this way, but that wasn't the case for C,
C++ or Go. This is certainly a bug in Vim, but I got used to it, and when doing
this port I could notice this a lot. For this reason, by default this color
theme for Emacs defines function identifiers as white, but it provides this
function so in other languages can be drawn in purple.

## Screenshots

I've saved some screenshots in the =screenshots= directory. They do not show a
full sample of all the defined colors, but it will give you a good idea of the
look and feel of this theme. A glimpse:

![Overview screenshot](screenshots/c.png)

## Contributing

Do you want to contribute with code, or to report an issue you are facing? Read
the [CONTRIBUTING.org](./CONTRIBUTING.org) file.

## [Changelog](https://pbs.twimg.com/media/DJDYCcLXcAA_eIo?format=jpg&name=small)

Read the [CHANGELOG.org](./CHANGELOG.org) file.

## License

```
Copyright (C) 2016-2020 Miquel Sabaté Solà <mikisabate@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```