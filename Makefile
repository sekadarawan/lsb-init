# Makefile: asboot's lsb-init makefile -*- mode: GNUmakefile; coding: utf-8; -*-
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

ETCDIR=${DESTDIR}/etc
LIBDIR=${DESTDIR}/lib
LSBDIR=${LIBDIR}/lsb
HELPERDIR=${LSBDIR}/init-functions.d
MODE=754
DIRMODE=755

all: install-files

install: all

install-dirs:
	install -dm ${DIRMODE} ${ETCDIR}
	install -dm ${DIRMODE} ${LIBDIR}
	install -dm ${DIRMODE} ${LSBDIR}
	install -dm ${DIRMODE} ${HELPERDIR}

install-files: install-dirs
	install -m ${MODE} init-functions ${LSBDIR}/
	install -m ${MODE} 10-printlog.sh ${HELPERDIR}/

uninstall: uninstall-dirs

uninstall-files:
	rm -f ${HELPERDIR}/10-printlog.sh
	rm -f ${LSBDIR}/init-functions

uninstall-dirs: uninstall-files
	rmdir ${HELPERDIR}
	rmdir ${LSBDIR}

.PHONY: all install install-dirs install-files uninstall uninstall-files uninstall-dirs
# vim: ft=make:ts=4:sw=4:sts=4:syn=make:noet
