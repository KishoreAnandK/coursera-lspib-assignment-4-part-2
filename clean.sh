#! /bin/sh

# Script to enter into the "buildroot" directory, and perform a full clean (distclean)

cd `dirname $0`

make -C buildroot distclean
