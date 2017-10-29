(define
	(domain hanoi-tower)
	(:requirements :adl)
	(:predicates
		(on ?o ?t)
		(smaller ?a ?b)
		(tower ?t)
		(disk ?d)
	)
	(:action przesun-na-pusty
		:parameters (?t1 ?t2 ?o)
		:precondition
		(and
			(disk ?o)
			(tower ?t1)
			(tower ?t2)
			(on ?o ?t1)
			(forall (?x) (or (not (on ?x ?t2))(tower ?x)))
			(forall (?x) 
				(or 
					(= ?x ?o)
					(tower ?x)
					(and (on ?x ?t1)(smaller ?o ?x))
					(not (on ?x ?t1))
				)
			)
		)
		:effect
		(and
			(not (on ?o ?t1))
			(on ?o ?t2)
		)
	)
	(:action przesun
		:parameters (?t1 ?t2 ?o1 ?o2)
		:precondition
		(and
			(disk ?o1)
			(disk ?o2)
			(tower ?t1)
			(tower ?t2)
			(on ?o1 ?t1)
			(on ?o2 ?t2)
			(forall (?x) 
				(or 
					(= ?x ?o1)
					(tower ?x)
					(and (on ?x ?t2)(smaller ?o1 ?x))
					(not (on ?x ?t2))
				)
			)
			(forall (?x) 
				(or 
					(= ?x ?o1)
					(tower ?x)
					(and (on ?x ?t1)(smaller ?o1 ?x))
					(not (on ?x ?t1))
				)
			)
		)
		:effect
		(and
			(not (on ?o1 ?t1))
			(on ?o1 ?t2)
		)
	)
)