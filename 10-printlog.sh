# 10-printlog.sh: helper functions for logging -*- mode: Sh; coding: utf-8; -*-
#
# The MIT License (MIT)
#
# Copyright (c) 2015 Sekadar Awan
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

TPUT="$( which tput )"
COLUMNS="$( ${TPUT} cols )"
if [ ${COLUMNS} -eq 0 ]; then
  COLUMNS=80
fi

BOLD="$( ${TPUT} bold )"
NORMAL="$( ${TPUT} sgr0 )"
SUCCESS="${BOLD}$( ${TPUT} setaf 2 )"
WARNING="${BOLD}$( ${TPUT} setaf 3 )"
FAILURE="${BOLD}$( ${TPUT} setaf 1 )"
INFO="${BOLD}$( ${TPUT} setaf 6 )"
BRACKET="${BOLD}$( ${TPUT} setaf 4 )"
CURS_ZERO="$( ${TPUT} cuu 0 )"
CURS_UP="$( ${TPUT} cuu1 )${CURS_ZERO}"
# vim: ft=sh:ts=2:sw=2:sts=2:syn=sh:et
