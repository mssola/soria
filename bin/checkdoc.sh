#!/bin/bash
# Copyright (C) 2020-2021 Miquel Sabaté Solà <mikisabate@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# This whole file is an utter hack to workaround some issues I've had by
# directly evaluating Lisp code into the Makefile and then trying to make
# something out of it. Mostly, apparently checkdoc-* functions do not emit a
# proper exit code, and trying to get the output out of it (plus the nightmarish
# situation with Makefile) has been impossible. Instead, we are going to do
# everything here in good ol' bash.
#
# This script is expected to be called with a list of arguments which are the
# parts of the command to be used. This command will be suffixed by this script
# with the Lisp code.

file="checkdoc.txt"
eval "$*" "--eval '(checkdoc-file \"soria-theme.el\")'" > "$file" 2>&1
out=$(cat ${file})
rm "$file"

if [ "${out}" != "" ]; then
    echo "$out"
    exit 1
fi

exit 0
