(define 
	(domain river)
	(:requirements :adl)
	(:types place object)
	(:constants LEFT RIGHT BOAT - place farmer goat wolf cole null - object)
	(:predicates 
		(on ?o - object ?s - place)
		(excludes ?o1 ?o2 - object)
	)
	(:action move
		:parameters (?o - object ?s ?t - place)
		:precondition
		(and
			(on farmer ?s)
			(not (= farmer ?o))
			(or 
				(on ?o ?s)
				(= ?o null)
			)
			(or
				(and 
					(or (= ?s LEFT)(= ?s RIGHT))
					(= ?t BOAT)
				)
				(and 
					(= ?s BOAT)
					(or (= ?t LEFT)(= ?t RIGHT))
				)
			)
			(forall (?x - object) ;wolf goat cole o - goat, x - wolf / x - cole
				(or 
					(= ?x ?o)
					(= ?x farmer)
					(= ?x null)
					(not (on ?x ?s))
					(on ?o BOAT)
					(and 
						(= ?o null)
						(forall (?y - object)
							(or 
								(and 
									(not (excludes ?y ?x))
									(not (excludes ?x ?y))
								)
								(or 
									(and (on ?x LEFT)(not (on ?y LEFT)))
									(and (on ?x RIGHT)(not (on ?y RIGHT)))
									(on ?x BOAT)
									(on ?y BOAT)
								)
							)
						)
					)
					(excludes ?x ?o)
					(excludes ?o ?x)
				)
			)
		)
		:effect
		(and
			(not (on farmer ?s))
			(not (on ?o ?s))
			(on farmer ?t)
			(on ?o ?t)
		)
	)
)