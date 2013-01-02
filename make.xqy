for $f in //character[query_code/q_code[@qc_type="skip"]]
	return fn:concat(
		data($f/literal),",",
		data($f/query_code/q_code[@qc_type="skip"][1]),",",
		data($f/misc/freq),",",
		string-join(
			for $m in $f/reading_meaning/rmgroup/meaning[not(@m_lang)]
				return $m/text(),
			", "
		)
	)

