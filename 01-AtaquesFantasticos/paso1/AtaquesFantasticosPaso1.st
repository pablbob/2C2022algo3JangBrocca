!classDefinition: #Aleatoria category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Aleatoria
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aleatoria class' category: 'AtaquesFantasticosPaso1'!
Aleatoria class
	instanceVariableNames: ''!

!Aleatoria class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 21:07:36'!
enemigoAAtacar: enemigos
	^ enemigos anyOne.! !


!Aleatoria class methodsFor: 'as yet unclassified' stamp: 'PMB 9/5/2022 22:21:02'!
- aSmallInteger 
	self shouldBeImplemented.! !


!classDefinition: #ArmaduraDeCuero category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #ArmaduraDeCuero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ArmaduraDeCuero class' category: 'AtaquesFantasticosPaso1'!
ArmaduraDeCuero class
	instanceVariableNames: ''!

!ArmaduraDeCuero class methodsFor: 'stats' stamp: 'PMB 9/5/2022 20:24:06'!
puntosDeDefensa
	^2.! !


!classDefinition: #ArmaduraDeMetal category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #ArmaduraDeMetal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ArmaduraDeMetal class' category: 'AtaquesFantasticosPaso1'!
ArmaduraDeMetal class
	instanceVariableNames: ''!

!ArmaduraDeMetal class methodsFor: 'stats' stamp: 'PMB 9/5/2022 20:32:38'!
puntosDeDefensa
	^6.! !


!classDefinition: #ArmaduraNula category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #ArmaduraNula
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ArmaduraNula class' category: 'AtaquesFantasticosPaso1'!
ArmaduraNula class
	instanceVariableNames: ''!

!ArmaduraNula class methodsFor: 'stats' stamp: 'PMB 9/5/2022 20:31:51'!
puntosDeDefensa
	^0.! !


!classDefinition: #Arthas category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Arthas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arthas class' category: 'AtaquesFantasticosPaso1'!
Arthas class
	instanceVariableNames: 'puntosDeVida enemigos arma estrategiaDeAtaque armadura'!

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 21:08:53'!
atacar
	enemigos isEmpty ifFalse: [ self atacarA: (estrategiaDeAtaque enemigoAAtacar: enemigos) ].! !

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 20:23:14'!
atacarA: unEnemigo
	
	unEnemigo recibirDanio: arma puntosDeDanio.! !

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 20:55:34'!
atacarAleatoriamente
	estrategiaDeAtaque := Aleatoria.! !

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 20:39:26'!
enemigos: unaColeccion 
	enemigos := unaColeccion.! !

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 20:53:03'!
focalizarEnElMasHerido
	estrategiaDeAtaque := MasHerido! !

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 20:53:21'!
focalizarEnElMasSano
	estrategiaDeAtaque := MasSano! !

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 20:17:15'!
usarEspada
	arma := Espada.! !

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 20:10:59'!
usarHacha
	arma := Hacha! !

!Arthas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:05:49'!
usarPunio
	arma := Punio! !


!Arthas class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:08'!
noUsarArmadura
	armadura := ArmaduraNula! !

!Arthas class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:03:19'!
usarArmaduraDeCuero
	armadura := ArmaduraDeCuero.! !

!Arthas class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:03:26'!
usarArmaduraDeMetal
	armadura := ArmaduraDeMetal.! !


!Arthas class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:02:15'!
establecerPuntosDeVida: unNumero
	puntosDeVida := unNumero! !

!Arthas class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:02:30'!
puntosDeVida
	^puntosDeVida.! !

!Arthas class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:23:22'!
recibirDanio: unNumero 
	puntosDeVida := puntosDeVida min: (puntosDeVida - unNumero + armadura puntosDeDefensa).! !


!Arthas class methodsFor: '--** private fileout/in **--' stamp: 'PMB 9/5/2022 22:33:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 10.
	enemigos := ((OrderedCollection new)).
	arma := Punio.
	estrategiaDeAtaque := Aleatoria.
	armadura := ArmaduraNula.! !


!classDefinition: #CombatientesTest category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AtaquesFantasticosPaso1'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:54:53'!
test08CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.
	Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 20.
	
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'SF 8/27/2022 06:07:34'!
test09CuandoUnCombatienteTieneEnemigosAtacaAUno
	| enemigo1Herido enemigo2Herido |
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	enemigo1Herido := self combatienteOrcoOlgra puntosDeVida < 20 and: [self combatienteOrcoMankrik puntosDeVida = 20].
	enemigo2Herido := self combatienteOrcoMankrik puntosDeVida < 20 and: [self combatienteOrcoOlgra puntosDeVida = 20].
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:55:22'!
test10UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	self combatienteHumanoArthas atacar.

	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.
	! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'JMB 8/27/2022 13:56:08'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	
	self comenzarUnNuevoCombate.
	
	self combatienteHumanoArthas usarEspada .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas focalizarEnElMasSano.
	self combatienteHumanoArthas atacar.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'PMB 9/5/2022 19:05:02'!
test12ElEnemigoFocalizadoMasSanoCambiaDinamicamente
self comenzarUnNuevoCombate.

self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.

self combatienteHumanoArthas usarEspada.
self combatienteHumanoArthas focalizarEnElMasSano.
self combatienteHumanoArthas atacar.
self combatienteHumanoArthas atacar.

Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.
Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 10. ! !

!CombatientesTest class methodsFor: 'atacar tests' stamp: 'PMB 9/5/2022 19:06:01'!
test13ElEnemigoFocalizadoMasHeridoCambiaDinamicamente
self comenzarUnNuevoCombate.

self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra. self combatienteOrcoMankrik.}.
self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.

self combatienteHumanoArthas usarEspada.
self combatienteHumanoArthas focalizarEnElMasHerido.
self combatienteHumanoArthas atacar.

self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.

self combatienteHumanoArthas atacar.

Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: -4.
Assert that: self combatienteOrcoMankrik puntosDeVida isEqualTo: 10.! !


!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 05:58:49'!
test01UnCombatientePuedeAtacarAOtro
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:50'!
test02MultiplesAtaquesVanBajandoMasVida

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 16.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:42'!
test03UnHachaHace10DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:06:55'!
test04UnEspadaHace8DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:03'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:10'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño

	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'combatientes tests' stamp: 'SF 8/27/2022 06:07:18'!
test07UnaArmaduraReduceElDañoInfligidoACero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert that: self combatienteOrcoOlgra puntosDeVida isEqualTo: 20.! !


!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:24:56'!
test14OrcoAtacaConPunioAHumano

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert that: self combatienteHumanoArthas puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:25:35'!
test15OrcoAtacaConHachaAHumano

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarHacha.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert that: self combatienteHumanoArthas puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:25:53'!
test16OrcoAtacaConEspadaAHumano

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarEspada.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert that: self combatienteHumanoArthas puntosDeVida isEqualTo: 12.! !

!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:29:55'!
test17OrcoAtacaAHumanoConArmaduraDeCuero

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarEspada.
	self combatienteHumanoArthas usarArmaduraDeCuero.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert that: self combatienteHumanoArthas puntosDeVida isEqualTo: 14.! !

!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:29:47'!
test18OrcoAtacaAHumanoConArmaduraDeMetal

	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra usarEspada.
	self combatienteHumanoArthas usarArmaduraDeMetal.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert that: self combatienteHumanoArthas puntosDeVida isEqualTo: 18.! !

!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:31:15'!
test19CuandoUnOrcoNoTieneEnemigosNoAtacaANadie

	self comenzarUnNuevoCombate.
	
	self combatienteOrcoOlgra atacar.
	
	Assert that: self combatienteHumanoArthas puntosDeVida isEqualTo: 20.
	Assert that: self combatienteHumanoTerenas puntosDeVida isEqualTo: 20.! !

!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:32:36'!
test20CuandoUnOrcoTieneEnemigosAtacaAUnoAleatorio
	
	| enemigo1Herido enemigo2Herido |
	
	self comenzarUnNuevoCombate.
	self combatienteOrcoOlgra enemigos: {self combatienteHumanoArthas . self combatienteHumanoTerenas .}.
	
	self combatienteOrcoOlgra atacar.
	
	enemigo1Herido := self combatienteHumanoArthas puntosDeVida < 20 and: [self combatienteHumanoTerenas puntosDeVida = 20].
	enemigo2Herido := self combatienteHumanoTerenas puntosDeVida < 20 and: [self combatienteHumanoArthas puntosDeVida = 20].
	
	Assert isTrue: (enemigo1Herido or: [enemigo2Herido]).! !

!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:32:58'!
test21OrcoPuedeTenerComoEstrategiaAtacarAlMasHerido

	self comenzarUnNuevoCombate.

	self combatienteOrcoOlgra enemigos: {self combatienteHumanoArthas. self combatienteHumanoTerenas.}.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoTerenas.

	self combatienteOrcoOlgra usarEspada.
	self combatienteOrcoOlgra focalizarEnElMasHerido.
	self combatienteOrcoOlgra atacar.

	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.

	self combatienteOrcoOlgra atacar.

	Assert that: self combatienteHumanoArthas puntosDeVida isEqualTo: -4.
	Assert that: self combatienteHumanoTerenas puntosDeVida isEqualTo: 10.! !

!CombatientesTest class methodsFor: 'opcional tests' stamp: 'PMB 9/5/2022 22:33:10'!
test22OrcoPuedeTenerComoEstrategiaAtacarAlMasSano

	self comenzarUnNuevoCombate.

	self combatienteOrcoOlgra enemigos: {self combatienteHumanoArthas. self combatienteHumanoTerenas}.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoTerenas.

	self combatienteOrcoOlgra usarEspada.
	self combatienteOrcoOlgra focalizarEnElMasSano.
	self combatienteOrcoOlgra atacar.
	self combatienteOrcoOlgra atacar.

	Assert that: self combatienteHumanoArthas puntosDeVida isEqualTo: 12.
	Assert that: self combatienteHumanoTerenas puntosDeVida isEqualTo: 10. ! !


!CombatientesTest class methodsFor: 'para completar' stamp: 'PMB 9/5/2022 22:11:31'!
combatienteHumanoArthas
	^ Arthas.! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'PMB 9/5/2022 22:11:37'!
combatienteHumanoTerenas
	^ Terenas.! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'PMB 9/5/2022 22:11:39'!
combatienteOrcoMankrik
	^ Mankrik.! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'PMB 9/5/2022 22:11:42'!
combatienteOrcoOlgra
	^ Olgra.! !

!CombatientesTest class methodsFor: 'para completar' stamp: 'PMB 9/5/2022 22:10:46'!
comenzarUnNuevoCombate
	
	Arthas usarPunio.
	Arthas enemigos: OrderedCollection new.
	Arthas atacarAleatoriamente.
	Arthas establecerPuntosDeVida: 20.
	Arthas noUsarArmadura.
	
	Terenas usarPunio.
	Terenas enemigos: OrderedCollection new.
	Terenas atacarAleatoriamente.
	Terenas establecerPuntosDeVida: 20.
	Terenas noUsarArmadura.
	
	Olgra usarPunio.
	Olgra enemigos: OrderedCollection new.
	Olgra atacarAleatoriamente.
	Olgra establecerPuntosDeVida: 20.
	Olgra noUsarArmadura.
	
	Mankrik usarPunio.
	Mankrik enemigos: OrderedCollection new.
	Mankrik atacarAleatoriamente.
	Mankrik establecerPuntosDeVida: 20.
	Mankrik noUsarArmadura.! !


!classDefinition: #Espada category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Espada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Espada class' category: 'AtaquesFantasticosPaso1'!
Espada class
	instanceVariableNames: ''!

!Espada class methodsFor: 'stats' stamp: 'PMB 9/5/2022 20:23:14'!
puntosDeDanio
	^8.! !


!classDefinition: #Hacha category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Hacha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hacha class' category: 'AtaquesFantasticosPaso1'!
Hacha class
	instanceVariableNames: ''!

!Hacha class methodsFor: 'stats' stamp: 'PMB 9/5/2022 20:23:14'!
puntosDeDanio
	^10.! !


!classDefinition: #Mankrik category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Mankrik
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Mankrik class' category: 'AtaquesFantasticosPaso1'!
Mankrik class
	instanceVariableNames: 'puntosDeVida enemigos arma estrategiaDeAtaque armadura'!

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
atacar
	enemigos isEmpty ifFalse: [ self atacarA: (estrategiaDeAtaque enemigoAAtacar: enemigos) ].! !

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
atacarA: unEnemigo
	
	unEnemigo recibirDanio: arma puntosDeDanio.! !

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
atacarAleatoriamente
	estrategiaDeAtaque := Aleatoria.! !

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
enemigos: unaColeccion 
	enemigos := unaColeccion.! !

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
focalizarEnElMasHerido
	estrategiaDeAtaque := MasHerido! !

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
focalizarEnElMasSano
	estrategiaDeAtaque := MasSano! !

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
usarEspada
	arma := Espada.! !

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
usarHacha
	arma := Hacha! !

!Mankrik class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:29'!
usarPunio
	arma := Punio! !


!Mankrik class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:29'!
noUsarArmadura
	armadura := ArmaduraNula! !

!Mankrik class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:29'!
usarArmaduraDeCuero
	armadura := ArmaduraDeCuero.! !

!Mankrik class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:29'!
usarArmaduraDeMetal
	armadura := ArmaduraDeMetal.! !


!Mankrik class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:29'!
establecerPuntosDeVida: unNumero
	puntosDeVida := unNumero! !

!Mankrik class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:29'!
puntosDeVida
	^puntosDeVida.! !

!Mankrik class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:29'!
recibirDanio: unNumero 
	puntosDeVida := puntosDeVida min: puntosDeVida - unNumero + armadura puntosDeDefensa.! !


!Mankrik class methodsFor: '--** private fileout/in **--' stamp: 'PMB 9/5/2022 22:33:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 20.
	enemigos := ((OrderedCollection new)).
	arma := Punio.
	estrategiaDeAtaque := Aleatoria.
	armadura := ArmaduraNula.! !


!classDefinition: #MasHerido category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #MasHerido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MasHerido class' category: 'AtaquesFantasticosPaso1'!
MasHerido class
	instanceVariableNames: ''!

!MasHerido class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 21:06:41'!
enemigoAAtacar: enemigos

	^ enemigos detectMin: [ :enemigo | enemigo puntosDeVida ].! !


!classDefinition: #MasSano category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #MasSano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MasSano class' category: 'AtaquesFantasticosPaso1'!
MasSano class
	instanceVariableNames: ''!

!MasSano class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 21:07:55'!
enemigoAAtacar: enemigos

	^ enemigos detectMax: [ :enemigo | enemigo puntosDeVida ].! !


!classDefinition: #Olgra category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Olgra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Olgra class' category: 'AtaquesFantasticosPaso1'!
Olgra class
	instanceVariableNames: 'puntosDeVida enemigos arma estrategiaDeAtaque armadura'!

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
atacar
	enemigos isEmpty ifFalse: [ self atacarA: (estrategiaDeAtaque enemigoAAtacar: enemigos) ].! !

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
atacarA: unEnemigo
	
	unEnemigo recibirDanio: arma puntosDeDanio.! !

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
atacarAleatoriamente
	estrategiaDeAtaque := Aleatoria.! !

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
enemigos: unaColeccion 
	enemigos := unaColeccion.! !

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
focalizarEnElMasHerido
	estrategiaDeAtaque := MasHerido! !

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
focalizarEnElMasSano
	estrategiaDeAtaque := MasSano! !

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
usarEspada
	arma := Espada.! !

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
usarHacha
	arma := Hacha! !

!Olgra class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:17'!
usarPunio
	arma := Punio! !


!Olgra class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:18'!
noUsarArmadura
	armadura := ArmaduraNula! !

!Olgra class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:18'!
usarArmaduraDeCuero
	armadura := ArmaduraDeCuero.! !

!Olgra class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:18'!
usarArmaduraDeMetal
	armadura := ArmaduraDeMetal.! !


!Olgra class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:18'!
establecerPuntosDeVida: unNumero
	puntosDeVida := unNumero! !

!Olgra class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:18'!
puntosDeVida
	^puntosDeVida.! !

!Olgra class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:18'!
recibirDanio: unNumero 
	puntosDeVida := puntosDeVida min: puntosDeVida - unNumero + armadura puntosDeDefensa.! !


!Olgra class methodsFor: '--** private fileout/in **--' stamp: 'PMB 9/5/2022 22:33:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 20.
	enemigos := ((OrderedCollection new)).
	arma := Hacha.
	estrategiaDeAtaque := Aleatoria.
	armadura := ArmaduraNula.! !


!classDefinition: #Punio category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Punio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Punio class' category: 'AtaquesFantasticosPaso1'!
Punio class
	instanceVariableNames: ''!

!Punio class methodsFor: 'stats' stamp: 'PMB 9/5/2022 20:23:14'!
puntosDeDanio
	^2.! !


!classDefinition: #Terenas category: 'AtaquesFantasticosPaso1'!
DenotativeObject subclass: #Terenas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Terenas class' category: 'AtaquesFantasticosPaso1'!
Terenas class
	instanceVariableNames: 'puntosDeVida enemigos arma estrategiaDeAtaque armadura'!

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:34'!
atacar
	enemigos isEmpty ifFalse: [ self atacarA: (estrategiaDeAtaque enemigoAAtacar: enemigos) ].! !

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:35'!
atacarA: unEnemigo
	
	unEnemigo recibirDanio: arma puntosDeDanio.! !

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:35'!
atacarAleatoriamente
	estrategiaDeAtaque := Aleatoria.! !

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:35'!
enemigos: unaColeccion 
	enemigos := unaColeccion.! !

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:35'!
focalizarEnElMasHerido
	estrategiaDeAtaque := MasHerido! !

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:35'!
focalizarEnElMasSano
	estrategiaDeAtaque := MasSano! !

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:35'!
usarEspada
	arma := Espada.! !

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:35'!
usarHacha
	arma := Hacha! !

!Terenas class methodsFor: 'ataque' stamp: 'PMB 9/5/2022 22:09:35'!
usarPunio
	arma := Punio! !


!Terenas class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:35'!
noUsarArmadura
	armadura := ArmaduraNula! !

!Terenas class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:35'!
usarArmaduraDeCuero
	armadura := ArmaduraDeCuero.! !

!Terenas class methodsFor: 'defensa' stamp: 'PMB 9/5/2022 22:09:35'!
usarArmaduraDeMetal
	armadura := ArmaduraDeMetal.! !


!Terenas class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:35'!
establecerPuntosDeVida: unNumero
	puntosDeVida := unNumero! !

!Terenas class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:35'!
puntosDeVida
	^puntosDeVida.! !

!Terenas class methodsFor: 'stats' stamp: 'PMB 9/5/2022 22:09:35'!
recibirDanio: unNumero 
	puntosDeVida := puntosDeVida min: puntosDeVida - unNumero + armadura puntosDeDefensa.! !


!Terenas class methodsFor: '--** private fileout/in **--' stamp: 'PMB 9/5/2022 22:33:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	puntosDeVida := 20.
	enemigos := ((OrderedCollection new)).
	arma := Punio.
	estrategiaDeAtaque := Aleatoria.
	armadura := ArmaduraNula.! !

Arthas initializeAfterFileIn!
Mankrik initializeAfterFileIn!
Olgra initializeAfterFileIn!
Terenas initializeAfterFileIn!