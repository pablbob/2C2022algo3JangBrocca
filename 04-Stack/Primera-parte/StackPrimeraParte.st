!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'tests' stamp: 'lj 10/5/2022 18:46:46'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'lj 10/5/2022 19:17:59'!
test02StackPushShouldAddAnElement

	| stack |
	
	stack := Stack new.
	
	stack push: 1.
	
	self assert: stack size = 1.! !

!StackTest methodsFor: 'tests' stamp: 'lj 10/5/2022 19:18:41'!
test03StackPopShouldRemoveAnElement

	| stack |
	
	stack := Stack new.
	
	stack push: 1.
	stack pop.
	
	self assert: stack size = 0.! !

!StackTest methodsFor: 'tests' stamp: 'lj 10/5/2022 19:18:23'!
test04StackPopShouldReturnTheLastElement

	| stack |
	
	stack := Stack new.
	
	stack push: 1.
	
	self assert: stack pop = 1.! !

!StackTest methodsFor: 'tests' stamp: 'lj 10/5/2022 19:19:58'!
test05StackIsLIFO

	| stack |
	
	stack := Stack new.
	
	stack push: 1.
	stack push: 2.
	stack push: 3.
	
	self assert: stack pop = 3.
	self assert: stack pop = 2.! !

!StackTest methodsFor: 'tests' stamp: 'lj 10/5/2022 19:25:33'!
test06StackTopReturnsTheLastElementWithoutRemovingIt

	| stack |
	
	stack := Stack new.
	
	stack push: 1.
	
	self assert: stack top = 1.
	self assert: stack size = 1.! !


!classDefinition: #Node category: 'StackPrimeraParte'!
Object subclass: #Node
	instanceVariableNames: 'next value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Node methodsFor: 'initialization' stamp: 'lj 10/5/2022 18:55:43'!
initializeWith: anElement
	next _ nil.
	value _ anElement.! !


!Node methodsFor: 'getters' stamp: 'lj 10/5/2022 19:09:02'!
next
	^next.! !

!Node methodsFor: 'getters' stamp: 'lj 10/5/2022 19:13:57'!
value
	^ value.! !


!Node methodsFor: 'setters' stamp: 'lj 10/5/2022 18:58:41'!
next: aNode
	next := aNode.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: 'StackPrimeraParte'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'initialization' stamp: 'lj 10/5/2022 18:56:33'!
with: anElement
	^ self new initializeWith: anElement.! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'size top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'operations' stamp: 'lj 10/5/2022 19:14:03'!
pop
	| auxNode |
	top isNil ifTrue: [^self].
	auxNode := top.
	top := top next.
	size := size - 1.
	^ auxNode value.! !

!Stack methodsFor: 'operations' stamp: 'lj 10/5/2022 19:31:24'!
push: anElement
	| newNode |
	newNode := Node with: anElement.
	top isNil ifFalse: [ newNode next: top ].
	top := newNode.
	size := size + 1.
	
	! !

!Stack methodsFor: 'operations' stamp: 'lj 10/5/2022 19:25:46'!
top
	^ top value.! !


!Stack methodsFor: 'initialization' stamp: 'lj 10/5/2022 18:52:48'!
initialize
	size _ 0.
	top _ nil.! !


!Stack methodsFor: 'state' stamp: 'lj 10/5/2022 18:48:50'!
isEmpty
	^ size = 0.! !

!Stack methodsFor: 'state' stamp: 'lj 10/5/2022 19:26:37'!
size
	^ size.! !
