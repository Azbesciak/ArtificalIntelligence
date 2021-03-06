(define (problem p1)
	(:domain world-of-blocks)
	(:objects a b c d e)
	(:init
		(clear c)
		(on-top c b)
		(on-top b a)
		(on-floor a)
		(on-top d e)
	)
	(:goal
		(and
			(on-top e d)
			(clear a)
			(on-top a b)
			(on-top b c)
			(on-floor c)
		)
	)
)