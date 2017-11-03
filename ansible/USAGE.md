Usage: docker run --rm --interactive --tty \
                  --volume "$KRB5CONF":/etc/krb5.conf \
                  --volume "$KRB5CCNAME":/tmp/krb5cc \
                  ansible /bin/bash

Note that if you are on macOS you need to use `/private/etc` instead of `/etc`
because _Docker for Mac_ doesn't whitelist `/etc` by default for "seamless
volume binding".

You should set `KRB5CONF` to the path to your `krb5.conf`, e.g.
`/etc/krb5.conf`.

If you know your default `KRB5CCNAME` then you can use that otherwise set it to
something arbitrary and authenticate to Kereberos,

    # export KRB5CCNAME="/tmp/${USER}_krb5cc"
    # kinit --cache="$KRB5CCNAME"

# Common Setup for macOS

    # export KRB5CONF="/private/etc/krb5.conf"
    # export KRB5CCNAME="/tmp/${USER}_krb5cc"
    # kinit --cache="$KRB5CCNAME"
    # docker run --rm --interactive --tty \
                 --volume "$KRB5CONF":/etc/krb5.conf \
                 --volume "$KRB5CCNAME":/tmp/krb5cc \
                 registry.gsc.wustl.edu/nnutter/ansible /bin/bash
