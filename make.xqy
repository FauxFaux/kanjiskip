let $kanjis := for $f in //character[query_code/q_code[@qc_type="skip"]]
	let $qcode := data($f/query_code/q_code[@qc_type="skip"][1])
	let $meanings := $f/reading_meaning/rmgroup/meaning[not(@m_lang)]
	let $skiptype := fn:substring($qcode,1,1)
	order by
		not($f/misc/freq),
		xs:int($f/misc/freq),
		not($meanings)
	return <kanji skiptype="{$skiptype}" skip="{$qcode}" literal="{$f/literal/text()}" meanings="{
		string-join(
			for $m in $meanings
				return $m/text(),
			", "
		)}"/>

return concat("[",string-join(for $st in (1,2,3,4)
	return fn:concat(
		"[",
		string-join(
		for $k in $kanjis[@skiptype=$st]
			return concat('{"s":[',
				replace(
					substring($k/@skip,3),
					"-",
					","),
				'],"l":"',
					$k/@literal,
				'","m":"',
					replace($k/@meanings,'"',"'"),
				'"}'),
			",
"),
		"]

"),
	","),"]")
