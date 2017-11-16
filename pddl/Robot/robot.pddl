(define
	(domain robot)
	(:types room package)
	(:predicates
		(loaded)
		(load ?p - package)
		(robot-in ?r - room)	
		(connected ?r1 ?r2 - room)
		(package-in ?p - package ?r - room)
	)
	(:action move
		:parameters (?r1 ?r2 - room)
		:precondition
		(and
			(robot-in ?r1)
			(or
				(connected ?r1 ?r2)
				(connected ?r2 ?r1)
			)
		)
		:effect
		(and
			(robot-in ?r2)
			(not (robot-in ?r1))
		)
	)
	(:action load-in
		:parameters (?p - package ?r - room)
		:precondition
		(and
			(not (loaded))
			(robot-in ?r)
			(package-in ?p ?r)
		)
		:effect
		(and
			(loaded)
			(load ?p)
			(not (package-in ?p ?r))
		)
	)
	(:action unload
		:parameters (?p - package ?r - room)
		:precondition
		(and
			(loaded)
			(load ?p)
			(robot-in ?r)
		)
		:effect
		(and
			(package-in ?p ?r)
			(not (loaded))
			(not (load ?p))
		)
	)
)