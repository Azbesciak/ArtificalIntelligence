(define
	(domain sokoban)
	(:requirements :adl)
	(:predicates
		(poziomo ?f1 ?f2)
		(pionowo ?f1 ?f2)
		(paczka ?f)
		(cel ?f)
		(robot ?f)
	)
	(:action idz
		:parameters (?f1 ?f2)
		:precondition
		(and
			(not (= ?f1 ?f2))
			(robot ?f1)
			(or (poziomo ?f1 ?f2)(pionowo ?f1 ?f2))
			(not (paczka ?f2))
		)
		:effect
		(and
			(not (robot ?f1))
			(robot ?f2)
		)
	)
	(:action pchaj
		:parameters (?f1 ?f2 ?f3)
		:precondition
		(and
			(robot ?f1)
			(paczka ?f2)
			(not (= ?f1 ?f2))
			(not (= ?f2 ?f3))
			(not (= ?f1 ?f3))
			(or 
				(and (poziomo ?f1 ?f2)(poziomo ?f2 ?f3)(not (poziomo ?f1 ?f3)))
				(and (pionowo ?f1 ?f2)(pionowo ?f2 ?f3)(not (pionowo ?f1 ?f3)))
			)
			(not (paczka ?f3))
		)
		:effect 
		(and 
			(not (robot ?f1))
			(robot ?f2)
			(not (paczka ?f2))
			(paczka ?f3)
		)
	)
)