!classDefinition: #MarsRoverTest category: 'Algo3MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PMB 11/2/2022 21:25:47'!
assertThatMarsRoverMovedTo: aPosition afterReceiving: aCommandCollection
	| marsRover |
	marsRover _ MarsRover
		inPosition: 0 @ 0
		facing: $N.
	marsRover performCommands: aCommandCollection.
	self
		assert: aPosition
		equals: marsRover currentPosition.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PMB 11/2/2022 21:26:39'!
test01
	self assertThatMarsRoverMovedTo: 0@0 afterReceiving: ''.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PMB 11/2/2022 21:26:58'!
test02NorthFacingMarsRoverShouldMoveNorthOneSpaceAfterReceivingF
	self
		assertThatMarsRoverMovedTo: 0 @ 1
		afterReceiving: 'f'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PMB 11/2/2022 21:27:07'!
test03NorthFacingMarsRoverShouldMoveSouthOneSpaceAfterReceivingB
	self
		assertThatMarsRoverMovedTo: 0 @ -1
		afterReceiving: 'b'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PMB 11/2/2022 21:27:19'!
test04NorthFacingMarsRoverShouldMoveWestOneSpaceAfterReceivingLF
	self
		assertThatMarsRoverMovedTo: -1 @ 0
		afterReceiving: 'lf'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PMB 11/2/2022 21:29:31'!
test05NorthFacingMarsRoverShouldMoveEastOneSpaceAfterReceivingLB
	self
		assertThatMarsRoverMovedTo: 1 @ 0
		afterReceiving: 'lb'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PMB 11/2/2022 21:31:37'!
test06MarsRoverShouldMoveEastOneSpaceAfterReceivingRF
	self
		assertThatMarsRoverMovedTo: 1 @ 0
		afterReceiving: 'rf'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'PMB 11/2/2022 21:31:47'!
test06MarsRoverShouldMoveWestOneSpaceAfterReceivingRB
	self
		assertThatMarsRoverMovedTo: -1 @ 0
		afterReceiving: 'rb'.! !


!classDefinition: #MarsRover category: 'Algo3MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition position cardinalPoint direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRover methodsFor: 'moving' stamp: 'PMB 11/2/2022 21:20:17'!
moveBackward
	direction = $N ifTrue: [ currentPosition _ currentPosition x @ (currentPosition y - 1) ].
	direction = $E ifTrue: [ currentPosition _ (currentPosition x - 1) @ currentPosition y ].
	direction = $W ifTrue: [ currentPosition _ (currentPosition x + 1) @ currentPosition y ].! !

!MarsRover methodsFor: 'moving' stamp: 'PMB 11/2/2022 21:19:14'!
moveForward
	direction = $N ifTrue: [currentPosition _ currentPosition x @ (currentPosition y + 1)].
	direction = $E ifTrue: [ currentPosition _ (currentPosition x + 1) @ currentPosition y ].
	direction = $W ifTrue: [currentPosition _ (currentPosition x - 1) @ currentPosition y].
! !

!MarsRover methodsFor: 'moving' stamp: 'PMB 11/2/2022 21:05:54'!
performCommands: aCommandCollection
	
	"(aCommandCollection includes: $f) ifTrue: [currentPosition := 0@1] ifFalse: [currentPosition := 0@-1]."
	| firstCommand |
	
	aCommandCollection ifEmpty: [^self.].
	firstCommand  := aCommandCollection first.
	
	firstCommand = $f ifTrue: [self moveForward].
	firstCommand = $b ifTrue: [self moveBackward].
	firstCommand = $l ifTrue: [self rotateLeft].
	firstCommand = $r ifTrue: [self rotateRight].
	
	self performCommands: (aCommandCollection copyAfter: firstCommand)! !

!MarsRover methodsFor: 'moving' stamp: 'PMB 11/2/2022 21:10:34'!
rotateLeft
	direction := $W.! !

!MarsRover methodsFor: 'moving' stamp: 'PMB 11/2/2022 21:18:24'!
rotateRight
	direction := $E.! !


!MarsRover methodsFor: 'accessing' stamp: 'PMB 11/2/2022 20:34:06'!
currentPosition
	^ currentPosition.! !


!MarsRover methodsFor: 'initialization' stamp: 'PMB 11/2/2022 20:39:31'!
initializeWithPosition: aPosition facing: aCardinalPoint
	currentPosition _ aPosition.
	direction _ aCardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Algo3MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'PMB 11/2/2022 20:37:02'!
inPosition: aPosition facing: aCardinalPoint
	^ self new initializeWithPosition: aPosition facing: aCardinalPoint .! !
