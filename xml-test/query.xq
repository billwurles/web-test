let $doc :=/module
let $numberRegExp := "(P009[0-9]+)"
for $var in (doc("computing.xml")//module)
	where $var/status = "treble"
	or $var/prerequisites != ""
	or matches($var/number, $numberRegExp)
		return <ul>
				<li>Module name: {data($var/name)}</li>
				<li>Module no: {data($var/number)}</li>
				<li>Module  leader: {data($var/leader)}</li>
				<li>Compulsory For: {data($var/compulsoryFor)}</li>
				<li>Prerequisites: {data($var/prerequisites)}</li>
				<li>Module Length: {data($var/status)}</li>
				<li>Semester: {data($var/semester)}</li>
			</ul>