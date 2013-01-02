for $f in //character[query_code/q_code[@qc_type="skip"]]
	let $qcode := data($f/query_code/q_code[@qc_type="skip"][1])
	let $meanings := $f/reading_meaning/rmgroup/meaning[not(@m_lang)]
	order by
		fn:substring($qcode,1,1),
		not($f/misc/freq),
		xs:int($f/misc/freq),
		not($meanings)
	return fn:concat(
		$qcode,",",
		data($f/literal),",",
		string-join(
			for $m in $meanings
				return $m/text(),
			", "
		)
	)

