# 05-util.sh: common helper functions -*- mode: Sh; coding: utf-8; -*-
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

# check_signal() [ -{SIGNAL} | {SIGNAL} ] (not defined by LSB)
# Exit status
# - 0: Valid and term signal
# - 1: Valid and non term signal
# - 2: Invalid signal
check_signal() {
  local termsigs signals

  termsigs="-ALRM -INT -KILL -TERM -PWR -STOP -ABRT -QUIT -2 -3 -6 -9 -14 -15"

  signals="-HUP -PIPE -POLL -PROF -USR1 -USR2"
  signals="${signals} -VTALRM -STKFLT -WINCH -CHLD -URG -TSTP -TTIN"
  signals="${signals} -TTOU -CONT -FPE -ILL -SEGV -TRAP"
  signals="${signals} -SYS -EMT -BUS -XCPU -XFSZ -0 -1 -4 -5 -8 -11 -13"

  if echo "${termsigs}" | grep -- "${1}" > /dev/null 2>&1; then
    return 0
  elif echo "${signals}" | grep -- "${1}" > /dev/null 2>&1; then
    return 1
  else
    return 2
  fi
}

# is_true()
# Exit status
# true | false
is_true() {
  case "${1}" in
    1|Y|y|YES|yes|T|t|TRUE|true)
      true
      ;;
    *)
      false
      ;;
  esac
}
# vim: ft=sh:ts=2:sw=2:sts=2:syn=sh:et
