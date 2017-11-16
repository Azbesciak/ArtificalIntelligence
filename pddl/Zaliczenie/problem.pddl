(define (problem p1)
	(:domain zaliczenie)
	(:objects A B C D E F G H - miejsca
		wood iron wedge hybrid - rodzaj
		dw fw li mi si pw gw sw lw h1 h2 h3 h4 h5 h6 h7 h8 h9 - kij
	)
	(:init 
		(droga G D)
		(droga D G)
		
		(droga D A)
		(droga A D)
		
		(droga A B)
		(droga B A) 
		
		(droga D E)
		(droga E D)
		
		(droga B E)
		(droga E B)
		
		(droga C B)
		(droga B C)
		
		(droga E F)
		(droga F E)
		
		(droga C F)
		(droga F C)
		
		(droga C H)
		(droga H C)
		
		(auto-puste)
		(auto B)
		
		(magazyn B)
		
		(kij-rodzaj dw wood)
		(kij-rodzaj fw wood)
		(kij-rodzaj li iron)
		(kij-rodzaj mi iron)
		(kij-rodzaj si iron)
		(kij-rodzaj pw wedge)
		(kij-rodzaj gw wedge)
		(kij-rodzaj sw wedge)
		(kij-rodzaj lw wedge)
		(kij-rodzaj h1 hybrid)
		(kij-rodzaj h2 hybrid)
		(kij-rodzaj h3 hybrid)
		(kij-rodzaj h4 hybrid)
		(kij-rodzaj h5 hybrid)
		(kij-rodzaj h6 hybrid)
		(kij-rodzaj h7 hybrid)
		(kij-rodzaj h8 hybrid)
		(kij-rodzaj h9 hybrid)
		
		(zamowienie A li)
		(zamowienie A si)
		(zamowienie A h1)
		
		(zamowienie G h1)
		(zamowienie G sw)
		(zamowienie G gw)
	
		(zamowienie H dw)
		(zamowienie H mi)
		(zamowienie H h3)

		(zamowienie F dw)
		(zamowienie F fw)
		(zamowienie F li)
	)
	(:goal (and 
			(dostarczenie A li)
			(dostarczenie A si)
			(dostarczenie A h1)
			
			(dostarczenie G h1)
			(dostarczenie G sw)
			(dostarczenie G gw)
		
			(dostarczenie H dw)
			(dostarczenie H mi)
			(dostarczenie H h3)
		
			(dostarczenie F dw)
			(dostarczenie F fw)
			(dostarczenie F li)
		)
	)
)