(define 
	(domain packages)
	(:requirements :adl)
	(:predicates 
		(floor ?p)
		(on ?p1 ?p2)
		(air ?p)
		(air-poluted)
		(on-top ?p)
	)
	(:action podnies-z-paczki
		:parameters (?p1 ?p2)
		:precondition
		(and
			(not (= ?p1 ?p2))
			(on ?p1 ?p2)
			(on-top ?p1)
			(not (air-poluted))
		)
		:effect
		(and
			(air ?p1)
			(air-poluted)
			(not (on-top ?p1))
			(on-top ?p2)
			(not (on ?p1 ?p2))
		)
	)
	(:action opusc-na-podloge
		:parameters (?p)
		:precondition
		(and
			(air ?p)
		)
		:effect
		(and
			(not (air ?p))
			(not (air-poluted))
			(floor ?p)
			(on-top ?p)
		)
	)
	(:action opusc-na-paczke
		:parameters (?p1 ?p2)
		:precondition
		(and
			(not (= ?p1 ?p2))
			(air ?p2)
			(on-top ?p1)
			(air-poluted)
		)
		:effect
		(and
			(not (air ?p2))
			(not (air-poluted))
			(on ?p2 ?p1)
			(not (on-top ?p1))
			(on-top ?p2)
		)
	)
	(:action podnies-z-podlogi
		:parameters (?p)
		:precondition
		(and
			(floor ?p)
			(on-top ?p)
			(not (air-poluted))
		)
		:effect
		(and
			(not (floor ?p))
			(not (on-top ?p))
			(air-poluted)
			(air ?p)
		)
	)
)