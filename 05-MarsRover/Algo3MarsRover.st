!classDefinition: #MarsRoverTest category: 'Algo3MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRoverTest methodsFor: 'asserts' stamp: 'l 11/3/2022 14:20:35'!
assertThatMarsRoverIsFacing: aCardinalPoint afterReceiving: aCommandCollection
	| marsRover |
	marsRover _ MarsRover
		inPosition: 0 @ 0
		facing: $N.
	marsRover performCommands: aCommandCollection.
	self
		assert: aCardinalPoint 
		equals: marsRover direction.! !

!MarsRoverTest methodsFor: 'asserts' stamp: 'PMB 11/2/2022 21:25:47'!
assertThatMarsRoverMovedTo: aPosition afterReceiving: aCommandCollection
	| marsRover |
	marsRover _ MarsRover
		inPosition: 0 @ 0
		facing: $N.
	marsRover performCommands: aCommandCollection.
	self
		assert: aPosition
		equals: marsRover currentPosition.! !


!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:31:02'!
test01MarsRoverShouldNotMoveAfterReceivingAnEmptyCommand
	self
		assertThatMarsRoverIsFacing: $W afterReceiving: 'l'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:13:15'!
test02MarsRoverShouldMoveForwardOneSpaceAfterReceivingF
	self
		assertThatMarsRoverMovedTo: 0 @ 1
		afterReceiving: 'f'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:13:33'!
test03MarsRoverShouldMoveBackwardOneSpaceAfterReceivingB
	self
		assertThatMarsRoverMovedTo: 0 @ -1
		afterReceiving: 'b'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:31:12'!
test04MarsRoverShouldRotateToTheLeftAfterReceivingL
	self
		assertThatMarsRoverIsFacing: $W
		afterReceiving: 'l'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:31:34'!
test05MarsRoverShouldRotateToTheRightAfterReceivingR
	self
		assertThatMarsRoverIsFacing: $E
		afterReceiving: 'r'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:25:01'!
test06MarsRoverShouldMoveToTheLeftOneSpaceAfterReceivingLF
	self
		assertThatMarsRoverMovedTo: -1 @ 0
		afterReceiving: 'lf'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:25:09'!
test07MarsRoverShouldMoveToTheRightOneSpaceAfterReceivingLB
	self
		assertThatMarsRoverMovedTo: 1 @ 0
		afterReceiving: 'lb'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:25:23'!
test08MarsRoverShouldMoveToTheRightOneSpaceAfterReceivingRF
	self
		assertThatMarsRoverMovedTo: 1 @ 0
		afterReceiving: 'rf'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:25:36'!
test09MarsRoverShouldMoveToTheLeftOneSpaceAfterReceivingRB
	self
		assertThatMarsRoverMovedTo: -1 @ 0
		afterReceiving: 'rb'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:53:05'!
test10MarsRoverShouldNotPerformAfterReceivingAWrongCommandAtTheStart
	self
		assertThatMarsRoverMovedTo: 0 @ 0
		afterReceiving: '*ff'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 15:06:21'!
test11MarsRoverShouldStopPerformingAfterReceivingAWrongCommandAtTheMiddle
	self
		assertThatMarsRoverMovedTo: 0 @ 1
		afterReceiving: 'f*f'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 14:54:17'!
test12MarsRoverShouldPerformAllCommandsAfterReceivingAWrongCommandAtTheEnd
	self
		assertThatMarsRoverMovedTo: 0 @ 2
		afterReceiving: 'ff*'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'l 11/3/2022 18:38:35'!
test13MarsRoverCommandsAreNotCaseSensitive
	self
		assertThatMarsRoverMovedTo: -1 @ -1
		afterReceiving: 'LFRB'.! !


!classDefinition: #MarsRover category: 'Algo3MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition position cardinalPoint direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRover methodsFor: 'performing' stamp: 'l 11/3/2022 18:44:47'!
performCommands: aCommandCollection
	| firstCommand lowercaseCommands |
	aCommandCollection ifEmpty: [ ^ self ].
	lowercaseCommands _ aCommandCollection asLowercase.
	firstCommand _ lowercaseCommands first.
	'fblr'
		indexOf: firstCommand
		startingAt: 1
		ifAbsent: [ ^ self ].
	firstCommand = $f ifTrue: [ self moveForward ].
	firstCommand = $b ifTrue: [ self moveBackward ].
	firstCommand = $l ifTrue: [ self rotateLeft ].
	firstCommand = $r ifTrue: [ self rotateRight ].
	self performCommands: (lowercaseCommands copyAfter: firstCommand).! !


!MarsRover methodsFor: 'moving' stamp: 'l 11/3/2022 14:08:16'!
moveBackward
	direction moveBackward: self.! !

!MarsRover methodsFor: 'moving' stamp: 'l 11/3/2022 14:01:42'!
moveForward
	direction moveForward: self.! !


!MarsRover methodsFor: 'accessing' stamp: 'PMB 11/2/2022 20:34:06'!
currentPosition
	^ currentPosition.! !

!MarsRover methodsFor: 'accessing' stamp: 'l 11/3/2022 14:18:44'!
direction
	^ direction character.! !


!MarsRover methodsFor: 'initialization' stamp: 'l 11/3/2022 18:53:52'!
initializeWithPosition: aPosition facing: aCardinalPoint
	currentPosition _ aPosition.
	direction _ MarsRoverDirection facing: aCardinalPoint.! !


!MarsRover methodsFor: 'double dispatch' stamp: 'l 11/3/2022 18:49:28'!
moveOneSpaceEast
	currentPosition _ currentPosition x + 1 @ currentPosition y! !

!MarsRover methodsFor: 'double dispatch' stamp: 'l 11/3/2022 18:49:48'!
moveOneSpaceNorth
	currentPosition _ currentPosition x @ (currentPosition y + 1)! !

!MarsRover methodsFor: 'double dispatch' stamp: 'l 11/3/2022 18:50:16'!
moveOneSpaceSouth
	currentPosition _ currentPosition x @ (currentPosition y - 1).! !

!MarsRover methodsFor: 'double dispatch' stamp: 'l 11/3/2022 18:50:01'!
moveOneSpaceWest
	currentPosition _ currentPosition x - 1 @ currentPosition y! !


!MarsRover methodsFor: 'rotating' stamp: 'l 11/3/2022 13:41:51'!
rotateLeft
	direction _ direction rotateLeft! !

!MarsRover methodsFor: 'rotating' stamp: 'l 11/3/2022 13:45:08'!
rotateRight
	direction _ direction rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Algo3MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'PMB 11/2/2022 20:37:02'!
inPosition: aPosition facing: aCardinalPoint
	^ self new initializeWithPosition: aPosition facing: aCardinalPoint .! !


!classDefinition: #MarsRoverDirection category: 'Algo3MarsRover'!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRoverDirection methodsFor: 'accessing' stamp: 'l 11/3/2022 14:18:36'!
character
	self subclassResponsibility ! !


!MarsRoverDirection methodsFor: 'rotating' stamp: 'l 11/3/2022 13:40:50'!
rotateLeft
	self subclassResponsibility ! !

!MarsRoverDirection methodsFor: 'rotating' stamp: 'l 11/3/2022 13:40:57'!
rotateRight
	self subclassResponsibility.! !


!MarsRoverDirection methodsFor: 'moving' stamp: 'l 11/3/2022 14:06:51'!
moveBackward: aMarsRover
	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'moving' stamp: 'l 11/3/2022 14:02:06'!
moveForward: aMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirection class' category: 'Algo3MarsRover'!
MarsRoverDirection class
	instanceVariableNames: ''!

!MarsRoverDirection class methodsFor: 'initialization' stamp: 'l 11/3/2022 13:53:23'!
facing: aCardinalPoint
	^ (self subclasses detect:
		[ :aCardinalPointSubclass |
		aCardinalPointSubclass isValid: aCardinalPoint ]) new.! !


!classDefinition: #MarsRoverDirectionEast category: 'Algo3MarsRover'!
MarsRoverDirection subclass: #MarsRoverDirectionEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRoverDirectionEast methodsFor: 'moving' stamp: 'l 11/3/2022 18:50:01'!
moveBackward: aMarsRover
	aMarsRover moveOneSpaceWest! !

!MarsRoverDirectionEast methodsFor: 'moving' stamp: 'l 11/3/2022 18:49:28'!
moveForward: aMarsRover
	aMarsRover moveOneSpaceEast.! !


!MarsRoverDirectionEast methodsFor: 'accessing' stamp: 'l 11/3/2022 14:17:51'!
character
	^ $E! !


!MarsRoverDirectionEast methodsFor: 'rotating' stamp: 'l 11/3/2022 18:52:00'!
rotateLeft
	^ MarsRoverDirectionNorth new! !

!MarsRoverDirectionEast methodsFor: 'rotating' stamp: 'l 11/3/2022 18:52:06'!
rotateRight
	^ MarsRoverDirectionSouth new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionEast class' category: 'Algo3MarsRover'!
MarsRoverDirectionEast class
	instanceVariableNames: ''!

!MarsRoverDirectionEast class methodsFor: 'validation' stamp: 'l 11/3/2022 13:48:12'!
isValid: aCardinalPoint
	^ aCardinalPoint = $E! !


!classDefinition: #MarsRoverDirectionNorth category: 'Algo3MarsRover'!
MarsRoverDirection subclass: #MarsRoverDirectionNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRoverDirectionNorth methodsFor: 'accessing' stamp: 'l 11/3/2022 14:18:15'!
character
	^ $N.! !


!MarsRoverDirectionNorth methodsFor: 'rotating' stamp: 'l 11/3/2022 18:52:11'!
rotateLeft
	^ MarsRoverDirectionWest new.! !

!MarsRoverDirectionNorth methodsFor: 'rotating' stamp: 'l 11/3/2022 18:51:52'!
rotateRight
	^ MarsRoverDirectionEast new.! !


!MarsRoverDirectionNorth methodsFor: 'moving' stamp: 'l 11/3/2022 18:50:16'!
moveBackward: aMarsRover
	aMarsRover moveOneSpaceSouth.! !

!MarsRoverDirectionNorth methodsFor: 'moving' stamp: 'l 11/3/2022 18:49:48'!
moveForward: aMarsRover
	aMarsRover moveOneSpaceNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionNorth class' category: 'Algo3MarsRover'!
MarsRoverDirectionNorth class
	instanceVariableNames: ''!

!MarsRoverDirectionNorth class methodsFor: 'validation' stamp: 'l 11/3/2022 13:48:21'!
isValid: aCardinalPoint
	^ aCardinalPoint = $N.! !


!classDefinition: #MarsRoverDirectionSouth category: 'Algo3MarsRover'!
MarsRoverDirection subclass: #MarsRoverDirectionSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRoverDirectionSouth methodsFor: 'accessing' stamp: 'l 11/3/2022 14:18:21'!
character
	^ $S.! !


!MarsRoverDirectionSouth methodsFor: 'rotating' stamp: 'l 11/3/2022 18:51:52'!
rotateLeft
	^ MarsRoverDirectionEast new.! !

!MarsRoverDirectionSouth methodsFor: 'rotating' stamp: 'l 11/3/2022 18:52:11'!
rotateRight
	^ MarsRoverDirectionWest new.! !


!MarsRoverDirectionSouth methodsFor: 'moving' stamp: 'l 11/3/2022 18:49:48'!
moveBackward: aMarsRover
	aMarsRover moveOneSpaceNorth.! !

!MarsRoverDirectionSouth methodsFor: 'moving' stamp: 'l 11/3/2022 18:50:16'!
moveForward: aMarsRover
	aMarsRover moveOneSpaceSouth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionSouth class' category: 'Algo3MarsRover'!
MarsRoverDirectionSouth class
	instanceVariableNames: ''!

!MarsRoverDirectionSouth class methodsFor: 'validation' stamp: 'l 11/3/2022 13:48:26'!
isValid: aCardinalPoint
	^ aCardinalPoint = $S.! !


!classDefinition: #MarsRoverDirectionWest category: 'Algo3MarsRover'!
MarsRoverDirection subclass: #MarsRoverDirectionWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algo3MarsRover'!

!MarsRoverDirectionWest methodsFor: 'accessing' stamp: 'l 11/3/2022 14:18:26'!
character
	^ $W.! !


!MarsRoverDirectionWest methodsFor: 'rotating' stamp: 'l 11/3/2022 18:52:06'!
rotateLeft
	^ MarsRoverDirectionSouth new.! !

!MarsRoverDirectionWest methodsFor: 'rotating' stamp: 'l 11/3/2022 18:52:00'!
rotateRight
	^ MarsRoverDirectionNorth new.! !


!MarsRoverDirectionWest methodsFor: 'moving' stamp: 'l 11/3/2022 18:49:28'!
moveBackward: aMarsRover
	aMarsRover moveOneSpaceEast.! !

!MarsRoverDirectionWest methodsFor: 'moving' stamp: 'l 11/3/2022 18:50:01'!
moveForward: aMarsRover
	aMarsRover moveOneSpaceWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirectionWest class' category: 'Algo3MarsRover'!
MarsRoverDirectionWest class
	instanceVariableNames: ''!

!MarsRoverDirectionWest class methodsFor: 'validation' stamp: 'l 11/3/2022 13:48:33'!
isValid: aCardinalPoint
	^ aCardinalPoint = $W.! !
