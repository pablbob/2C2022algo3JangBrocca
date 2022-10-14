!classDefinition: #OOStackTest category: 'StackSegundaParte'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackSegundaParte'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #OOStack category: 'StackSegundaParte'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackSegundaParte'!

!OOStack methodsFor: 'operations' stamp: 'PMB 10/12/2022 19:06:35'!
pop
	| poppedValue |
	poppedValue _ self top.
	top _ top next.
	size _ size - 1.
	^ poppedValue.! !

!OOStack methodsFor: 'operations' stamp: 'lj 10/12/2022 13:23:18'!
push: anElement
	top _ top push: anElement.
	size := size + 1! !


!OOStack methodsFor: 'initialization' stamp: 'lj 10/12/2022 13:23:07'!
initialize
	top _ Base new.
	size := 0! !


!OOStack methodsFor: 'testing' stamp: 'PMB 10/11/2022 21:44:18'!
isEmpty
	^ top isEmpty.! !


!OOStack methodsFor: 'getters' stamp: 'lj 10/12/2022 13:23:59'!
size
	^ size! !

!OOStack methodsFor: 'getters' stamp: 'lj 10/12/2022 13:38:32'!
top
	^ top value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'StackSegundaParte'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #Top category: 'StackSegundaParte'!
Object subclass: #Top
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackSegundaParte'!

!Top methodsFor: 'operations' stamp: 'lj 10/12/2022 13:27:17'!
push: anElement
	| newTop |
	newTop _ Element with: anElement.
	newTop next: self.
	^ newTop.! !


!Top methodsFor: 'testing' stamp: 'PMB 10/11/2022 21:44:28'!
isEmpty
	self subclassResponsibility ! !


!Top methodsFor: 'getters' stamp: 'PMB 10/12/2022 20:02:03'!
value
	self subclassResponsibility ! !


!classDefinition: #Base category: 'StackSegundaParte'!
Top subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackSegundaParte'!

!Base methodsFor: 'testing' stamp: 'PMB 10/11/2022 21:44:53'!
isEmpty
	^ true.! !


!Base methodsFor: 'getters' stamp: 'PMB 10/12/2022 19:13:55'!
value
	self error: self class stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Base class' category: 'StackSegundaParte'!
Base class
	instanceVariableNames: ''!

!Base class methodsFor: 'error descriptions' stamp: 'lj 10/12/2022 13:10:30'!
stackEmptyErrorDescription
	^ 'Stack is empty'.! !


!classDefinition: #Element category: 'StackSegundaParte'!
Top subclass: #Element
	instanceVariableNames: 'next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackSegundaParte'!

!Element methodsFor: 'initialization' stamp: 'PMB 10/11/2022 21:54:54'!
initializeWith: aValue
	value := aValue! !


!Element methodsFor: 'getters' stamp: 'PMB 10/11/2022 21:38:32'!
next
	^next.! !

!Element methodsFor: 'getters' stamp: 'lj 10/12/2022 13:39:22'!
value
	^ value.! !


!Element methodsFor: 'setters' stamp: 'lj 10/12/2022 13:44:02'!
next: aValue
	next := aValue ! !


!Element methodsFor: 'testing' stamp: 'PMB 10/11/2022 21:45:03'!
isEmpty
	^ false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: 'StackSegundaParte'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'initialization' stamp: 'lj 10/12/2022 13:17:24'!
with: aValue
	^Element new initializeWith: aValue.! !
