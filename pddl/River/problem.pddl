(define (problem p1)
	(:domain river)
	(:init
		(excludes goat cole)
		(excludes wolf goat)
		(on farmer LEFT)
		(on goat LEFT)
		(on wolf LEFT)
		(on cole LEFT)
	)
	(:goal
		(and
			(on farmer RIGHT)
			(on goat RIGHT)
			(on wolf RIGHT)
			(on cole LEFT)
		)
	)
)