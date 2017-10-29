(define
	(problem p1)
	(:domain robot) 
	(:objects a b c d e f g - room paleta skrzynia - package)
	(:init 
		(robot-in a)
		(package-in paleta e)
		(package-in skrzynia g)
		(connected a b)
		(connected b c)
		(connected c d)
		(connected d f)
		(connected f g)
		(connected b e)
	)
	(:goal
		(and
			(robot-in g)
			(package-in paleta c)
			(package-in skrzynia b)
		)
	)
	
)