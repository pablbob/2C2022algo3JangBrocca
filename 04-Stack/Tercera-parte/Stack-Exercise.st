!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 20:46:02'!
test01CannotSearchWithEmptyPrefix
	| stack sentenceFinder |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	self
		should: [
			stack push: 'This is a string'.
			sentenceFinder
				find: ''
				in: stack ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: SentenceFinderByPrefix invalidPrefixErrorDescription 
				equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 20:47:23'!
test02CannotSearchWithPrefixContainingSpaces
	| stack sentenceFinder |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	self
		should: [
			stack push: 'This is a string'.
			sentenceFinder
				find: 'This is'
				in: stack ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: SentenceFinderByPrefix invalidPrefixErrorDescription
				equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 20:48:40'!
test03CannotSearchAnEmptyStack
	| stack sentenceFinder |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	self
		should: [
			sentenceFinder
				find: 'hello'
				in: stack ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: SentenceFinderByPrefix emptyStackErrorDescription 
				equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 20:53:15'!
test04SearchWithNoMatchesRaisesError
	| stack sentenceFinder |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	self
		should: [
			stack push: 'Hello'.
			sentenceFinder
				find: 'World'
				in: stack ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: SentenceFinderByPrefix noMatchesFoundErrorDescription 
				equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 20:51:16'!
test05MatchingIsCaseSensitive
	| stack sentenceFinder |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	self
		should: [
			stack push: 'Hello'.
			sentenceFinder
				find: 'hello'
				in: stack ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: SentenceFinderByPrefix noMatchesFoundErrorDescription
				equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 21:17:04'!
test06SuccessfulSearchShouldReturnCollectionWithMatchingStringsOnly
	| stack sentenceFinder matches |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	stack push: 'Hello world!!'.
	stack push: 'Hello, my name is Alan'.
	stack push: 'Goodbye'.
	matches _ sentenceFinder
		find: 'Hello'
		in: stack.
	self
		assert: matches
		equals: (OrderedCollection
		with: 'Hello, my name is Alan'
		with: 'Hello world!!').! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

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

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'PMB 10/12/2022 21:20:50'!
find: aPrefix in: aStack
	| matches auxStack actualElement |
	aPrefix = '' ifTrue: [ self error: self class invalidPrefixErrorDescription ].
	(aPrefix
		findString: ' '
		startingAt: 1) > 0 ifTrue: [ self error: self class invalidPrefixErrorDescription ].
	aStack isEmpty ifTrue: [ self error: self class emptyStackErrorDescription ].
	matches _ OrderedCollection new.
	auxStack _ OOStack new.
	[ aStack isEmpty ] whileFalse: [
		actualElement _ aStack pop.
		(actualElement
			is: aPrefix
			substringAt: 1) ifTrue: [ matches add: actualElement ].
		auxStack push: actualElement ].
	[ auxStack isEmpty ] whileFalse: [
		actualElement _ auxStack pop.
		aStack push: actualElement ].
	matches isEmpty ifTrue: [ self error: self class noMatchesFoundErrorDescription ]. ^ matches.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 20:43:05'!
emptyStackErrorDescription
	^ 'Stack is empty'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 20:42:35'!
invalidPrefixErrorDescription
	^ 'Prefix should not be empty nor contain spaces'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'PMB 10/12/2022 20:41:10'!
noMatchesFoundErrorDescription
	^ 'No matches found'! !


!classDefinition: #Top category: 'Stack-Exercise'!
Object subclass: #Top
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

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


!classDefinition: #Base category: 'Stack-Exercise'!
Top subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'testing' stamp: 'PMB 10/11/2022 21:44:53'!
isEmpty
	^ true.! !


!Base methodsFor: 'getters' stamp: 'PMB 10/12/2022 19:13:55'!
value
	self error: self class stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Base class' category: 'Stack-Exercise'!
Base class
	instanceVariableNames: ''!

!Base class methodsFor: 'error descriptions' stamp: 'lj 10/12/2022 13:10:30'!
stackEmptyErrorDescription
	^ 'Stack is empty'.! !


!classDefinition: #Element category: 'Stack-Exercise'!
Top subclass: #Element
	instanceVariableNames: 'next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

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

!classDefinition: 'Element class' category: 'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'initialization' stamp: 'lj 10/12/2022 13:17:24'!
with: aValue
	^Element new initializeWith: aValue.! !
