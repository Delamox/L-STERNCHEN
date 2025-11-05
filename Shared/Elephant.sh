#!/usr/bin/env sh
elephant query "desktopapplications;$1;2048;false" | sed -r 's/.*identifier:\"([^\"]+)\".* text:\"([^\"]+)\".*icon:\"([^\"]+)\".*qid:([0-9]+).*/\{\"id\":\"\4\",\"ident\":\"\1\",\"name\":\"\2\"\,\"icon\":\"\3\"},/g' | tr '\n' ' ' | sed -r 's/(.*), $/\{\"response\":\[\1\]\}/'
