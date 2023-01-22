#!/bin/bash
CURDIR=`pwd`
TMPDIR=`mktemp -d /tmp/sfx-XXXXXXXXXXXX`
ARCHIVE=`awk '/^__ARCHIVE_FOLLOWS__/ { print NR + 1; exit 0; }' $0`
tail -n +$ARCHIVE $0 | tar xz -C $TMPDIR
cd $TMPDIR
if [ -f "autorun.sh" ]; then sh autorun.sh; fi
cd $CURDIR
rm -rf $TMPDIR;
exit 0
__ARCHIVE_FOLLOWS__
