(define 
	(domain zaliczenie)
	(:requirements :adl)
	(:types miejsca rodzaj kij)
	(:predicates
		(droga ?z ?do - miejsca)
		(magazyn ?gdzie - miejsca)
		(auto ?gdzie - miejsca)
		(kij-rodzaj ?k - kij ?r - rodzaj)
		(rodzaj-auto ?r - rodzaj)
		(dostarczenie ?m - miejsca ?k - kij)
		(zamowienie ?m - miejsca ?k - kij)
		(kij-w-auto ?k - kij)
		(auto-puste)
	)
	(:action jedz
		:parameters (?z ?do - miejsca)
		:precondition(and 
			(auto ?z)
			(droga ?z ?do)
		)
		:effect(and 
			(not(auto ?z))
			(auto ?do)
		)
	)
	(:action zaladuj
		:parameters (?r - rodzaj ?k - kij ?m - miejsca)
		:precondition (and
			(auto ?m)
			(magazyn ?m)
			(or (rodzaj-auto ?r)(auto-puste))
			(not (kij-w-auto ?k))
			(kij-rodzaj ?k ?r)
		)
		:effect(and 
			(rodzaj-auto ?r)
			(kij-w-auto ?k)
			(not (auto-puste))
		)
	)
	(:action dostarcz
		:parameters (?k - kij ?m - miejsca)
		:precondition (and
			(kij-w-auto ?k)
			(auto ?m)
			(zamowienie ?m ?k)
		)
		:effect (and
			(not (zamowienie ?m ?k))
			(dostarczenie ?m ?k)
			(not (kij-w-auto ?k))
		)
	)
	(:action resetuj-typ
		:parameters ()
		:precondition
		(and
			(forall (?k - kij) (not (kij-w-auto ?k)))
		)
		:effect
		(and
			(auto-puste)
			(forall (?r - rodzaj) (not(rodzaj-auto ?r))) 
		)
	)
)