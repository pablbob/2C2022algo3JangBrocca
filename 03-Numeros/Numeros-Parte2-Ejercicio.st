!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:10'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:43'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:11'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:28'!
test10AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'lj 9/30/2022 12:49:37'!
test11EnteroAddsFraccionCorrectly
	self
		assert: (Entero with: 6) / (Entero with: 5)
		equals: one + oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:42'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (twoFifth) * (fiveHalfs) ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:04:04'!
test14NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:05:06'!
test15NegationOfFraccionIsCorrect

	self assert: (Numero with: negativeOne over: two) equals: oneHalf negated! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'initialization' stamp: 'PMB 9/27/2022 21:49:49'!
initializeWith: aValue
	value _ aValue.! !

!Numero methodsFor: 'initialization' stamp: 'PMB 9/27/2022 21:49:59'!
initializeWith: aNumerator over: aDenominator
	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	numerator _ aNumerator.
	denominator _ aDenominator.! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'printing' stamp: 'PMB 9/27/2022 21:41:11'!
printOn: aStream
	self subclassResponsibility ! !


!Numero methodsFor: 'comparing' stamp: 'PMB 9/27/2022 21:04:36'!
= anObject

	^(anObject isKindOf: self class) and: [ type = anObject type and: 
		[ type = #Entero ifTrue: [ value = anObject integerValue] 
		ifFalse: [ type = #Fraccion ifTrue:
			[ (numerator * anObject denominator) = (denominator * anObject numerator) ]]]]! !

!Numero methodsFor: 'comparing' stamp: 'PMB 9/27/2022 21:04:36'!
hash
	type = #Entero ifTrue:
		[ ^value hash ].
	type = #Fraccion ifTrue:
		[ ^(numerator hash / denominator hash) hash ].! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'PMB 9/27/2022 21:38:11'!
// aDivisor
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'PMB 9/27/2022 21:39:41'!
greatestCommonDivisorWith: anEntero
	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 17:52:02'!
beAddedToEntero: anEntero
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:48:40'!
beAddedToFraccion: aFraccion
	self subclassResponsibility ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:49:05'!
beMultipliedByEntero: anEntero
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:48:53'!
beMultipliedByFraccion: aFraccion
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:56:37'!
beSubstractedFromEntero: anEntero
	self subclassResponsibility ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:56:47'!
beSubstractedFromFraccion: aFraccion
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!Numero class methodsFor: 'instance creation' stamp: 'PMB 9/27/2022 21:49:12'!
with: aValue
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	^ Entero new initializeWith: aValue.! !

!Numero class methodsFor: 'instance creation' stamp: 'PMB 9/27/2022 21:49:21'!
with: aDividend over: aDivisor
	| greatestCommonDivisor numerator denominator |
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^ aDividend ].
	aDivisor isNegative ifTrue: [ ^ self
			with: aDividend negated
			over: aDivisor negated ].
	greatestCommonDivisor _ aDividend greatestCommonDivisorWith: aDivisor.
	numerator _ aDividend // greatestCommonDivisor.
	denominator _ aDivisor // greatestCommonDivisor.
	denominator isOne ifTrue: [ ^ numerator ].
	^ Fraccion new
		initializeWith: numerator
		over: denominator.! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 17:59:21'!
beAddedToEntero: anEntero
	^ self class with: anEntero integerValue + value.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:41:48'!
beAddedToFraccion: aFraccion
	^ self * aFraccion denominator +  aFraccion numerator / aFraccion denominator.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:43:21'!
beMultipliedByEntero: anEntero
	^ self class with: value * anEntero integerValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:45:29'!
beMultipliedByFraccion: aFraccion
	^ aFraccion * (self class with: value)! !

!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:50:26'!
beSubstractedFromEntero: anEntero
	^ self class with: anEntero integerValue - value.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:54:43'!
beSubstractedFromFraccion: aFraccion
	^ aFraccion numerator - self * aFraccion denominator / aFraccion denominator.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/27/2022 21:36:25'!
negated
	^ self * (self class with: -1) ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 19:03:09'!
xxxEntero: anEntero
	^ Fraccion with: anEntero 
				over: self! !

!Entero methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 19:05:03'!
xxxFraccion: aFraccion
	^ Fraccion
		with: aFraccion numerator
		over: aFraccion denominator * self.! !


!Entero methodsFor: 'arithmetic operations' stamp: 'PMB 9/30/2022 18:47:15'!
* aMultiplier
	^ aMultiplier beMultipliedByEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PMB 9/30/2022 17:51:24'!
+ anAdder
	^ anAdder beAddedToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PMB 9/30/2022 18:55:15'!
- aSubtrahend
	aSubtrahend beSubstractedFromEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PMB 9/30/2022 18:59:46'!
/ aDivisor
	(aDivisor isKindOf: Entero)
		ifTrue: [ ^ Fraccion
				with: (self class with: value)
				over: aDivisor ]
		ifFalse: [ ^ Fraccion
				with: (self class with: value) * aDivisor denominator
				over: aDivisor numerator ].! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'JS 5/5/2022 03:55:37'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/27/2022 21:37:59'!
// aDivisor
	self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 17:56:39'!
beAddedToEntero: anEntero
	^ anEntero * denominator + numerator / denominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:39:56'!
beAddedToFraccion: aFraccion
	^ numerator * aFraccion denominator + (denominator * aFraccion numerator) / denominator * aFraccion denominator! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:44:29'!
beMultipliedByEntero: anEntero
	^ numerator * anEntero / denominator! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:46:40'!
beMultipliedByFraccion: aFraccion
	^ numerator * aFraccion numerator / (denominator * aFraccion denominator)! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:52:53'!
beSubstractedFromEntero: anEntero
	^  (denominator * anEntero) - numerator / denominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 18:53:31'!
beSubstractedFromFraccion: aFraccion
	^ aFraccion numerator - numerator / denominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/27/2022 21:39:08'!
greatestCommonDivisorWith: anEntero
	self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/27/2022 21:36:47'!
negated
	^ self class
		with: numerator * (self class with: -1)
		over: denominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'PMB 9/30/2022 19:06:15'!
xxxEntero: anEntero
	^ Fraccion with: anEntero * denominator over: numerator.! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'PMB 9/30/2022 18:47:37'!
* aMultiplier
	^ aMultiplier beMultipliedByFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PMB 9/30/2022 18:14:54'!
+ anAdder
	^ anAdder beAddedToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PMB 9/30/2022 18:55:34'!
- aSubtrahend
	aSubtrahend beSubstractedFromFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'lj 9/30/2022 15:37:43'!
/ aDivisor
	(aDivisor isKindOf: Entero)
		ifTrue: [ ^ numerator / (denominator * aDivisor) ]
		ifFalse: [ ^ numerator * aDivisor denominator / (denominator * aDivisor numerator) ].! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
