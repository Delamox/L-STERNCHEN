#!/usr/bin/env sh
elephant query "desktopapplications;$1;2048;false" | sed -r 's/qid:([0-9]+).*identifier:\"([^\"]+)\".* text:\"([^\"]+)\".*icon:\"([^\"]+)\".*/\{\"id\":\"\1\",\"ident\":\"\2\",\"name\":\"\3\"\,\"icon\":\"\4\"},/g' | tr '\n' ' ' | sed -r 's/(.*), $/\{\"response\":\[\1\]\}/'
