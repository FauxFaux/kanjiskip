#!/bin/sh
(echo '<kanjidic2>'; zcat kanjidic2.xml.gz | sed '1,/^<kanjid/d') |
	xqilla -i /dev/stdin make.xqy |
	gzip --best > datums.json.gz
