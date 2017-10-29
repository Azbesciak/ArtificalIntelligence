(define
	(domain bagend)
	(:requirements :adl)
	(:types color room ball block field)
	(:constants null - block)
	(:predicates
		(przejscie ?r1 ?r2 - room ?c - color)
		(merry-w ?r - room)
		(kula-w ?b - ball ?r - room)
		(merry-ma ?b - ball)
		(kolor-kuli ?b - ball ?c - color)
		(blokada-w ?r - room)
		(obok ?f1 ?f2 - field)
		(klocek-na ?k - block ?f - field)
	)
	(:action wez 
		:parameters (?c - color ?b - ball ?r - room)
		:precondition
		(and
			(kolor-kuli ?b ?c)
			(kula-w ?b ?r)
			(merry-w ?r)
		)
		:effect
		(and
			(merry-ma ?b)
			(not (kula-w ?b ?r))
		)
	)
	(:action idz
		:parameters (?rTo ?rFrom - room ?c - color ?b - ball)
		:precondition
		(and
			(merry-w ?rFrom)
			(przejscie ?rFrom ?rTo ?c)
			(merry-ma ?b)
			(kolor-kuli ?b ?c) 
		)
		:effect
		(and
			(not (merry-ma ?b))
			(not (merry-w ?rFrom))
			(merry-w ?rTo)
		)
	)
	(:action przesun
		:parameters (?k - block ?f1 ?f2 - field ?r - room)
		:precondition
		(and
			(not (= ?k null))
			(blokada-w ?r)
			(merry-w ?r)
			(or (obok ?f1 ?f2)(obok ?f2 ?f1))
			(klocek-na ?k ?f1)
			(klocek-na null ?f2)
		)
		:effect
		(and
			(klocek-na null ?f1)
			(klocek-na ?k ?f2)
			(not (klocek-na ?k ?f1))
			(not (klocek-na null ?f2))
		)
	)
	
)