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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/13/2022 19:48:15'!
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
				assert: 'Prefix should not be empty nor contain spaces'
				equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/13/2022 19:48:20'!
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
				assert: 'Prefix should not be empty nor contain spaces'
				equals: anError messageText ].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/12/2022 20:48:40'!
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/12/2022 20:53:15'!
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/12/2022 20:51:16'!
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/13/2022 18:31:12'!
test06SuccessfulSearchReturnsCollectionWithMatchingStringsOnly
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/13/2022 18:38:20'!
test07StringsThatContainPrefixButNotAtTheStartDoNotMatch
	| stack sentenceFinder matches |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	stack push: 'knowledge is power'.
	stack push: 'I know that I know nothing'.
	stack push: 'know yourself'.
	stack push: 'what do you know?'.
	matches _ sentenceFinder
		find: 'know'
		in: stack.
	self
		assert: matches
		equals:
			(OrderedCollection
				with: 'know yourself'
				with: 'knowledge is power').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/13/2022 18:42:31'!
test08ObjectsInTheStackOtherThanStringsAreIgnored
	| stack sentenceFinder matches |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	stack push: '1940'.
	stack push: 1945.
	stack push: #('1969' ).
	matches _ sentenceFinder
		find: '19'
		in: stack.
	self
		assert: matches
		equals: (OrderedCollection with: '1940').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'PMB 10/13/2022 18:57:45'!
test09ObjectsInTheStackKeepOriginalOrderAfterSearch
	| stack sentenceFinder |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	stack push: 'This is the first element'.
	stack push: 'This is the second element'.
	stack push: 'This is the third element'.
	sentenceFinder
		find: 'This'
		in: stack.
	self
		assert: stack pop
		equals: 'This is the third element'.
		self
		assert: stack pop
		equals: 'This is the second element'.
		self
		assert: stack pop
		equals: 'This is the first element'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'lj 10/13/2022 21:23:46'!
test10SearchWithMatchingIdenticalStringsReturnsCollectionWithAllOfThem
	| stack sentenceFinder matches |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	stack push: 'Hello world!!'.
	stack push: 'Goodbye'.
	stack push: 'Hello world!!'.
	stack push: 'See you tomorrow!!'.
	stack push: 'Hello world!!'.
	matches _ sentenceFinder
		find: 'Hello'
		in: stack.
	self
		assert: matches
		equals:
			(OrderedCollection
				with: 'Hello world!!'
				with: 'Hello world!!'
				with: 'Hello world!!').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'lj 10/13/2022 21:35:35'!
test11SearchWithOneMatchReturnsCollectionWithOneString
	| stack sentenceFinder matches |
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	stack push: 'Hello world!!'.
	stack push: 'Goodbye'.
	stack push: 'See you tomorrow!!'.
	stack push: 'hello everyone!!'.
	matches _ sentenceFinder
		find: 'Hello'
		in: stack.
	self
		assert: matches
		equals:
			(OrderedCollection
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


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'initialization' stamp: 'PMB 10/13/2022 19:29:33'!
initializeWith: aString
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'initialization' stamp: 'PMB 10/13/2022 19:24:50'!
with: aString
^ (self subclasses detect: [ :aSubclass |
		aSubclass isValid: aString ]) new initializeWith: aString .! !


!Prefix class methodsFor: 'validation' stamp: 'PMB 10/13/2022 19:26:15'!
isValid: aString
	^ self subclassResponsibility ! !


!classDefinition: #NullPrefix category: 'Stack-Exercise'!
Prefix subclass: #NullPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullPrefix methodsFor: 'initialization' stamp: 'PMB 10/13/2022 19:30:34'!
initializeWith: aString
	self error: self class invalidPrefixErrorDescription .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullPrefix class' category: 'Stack-Exercise'!
NullPrefix class
	instanceVariableNames: ''!

!NullPrefix class methodsFor: 'error descriptions' stamp: 'PMB 10/13/2022 19:28:45'!
invalidPrefixErrorDescription
	^ 'Prefix should not be empty nor contain spaces'.! !


!NullPrefix class methodsFor: 'validation' stamp: 'PMB 10/13/2022 19:59:25'!
isValid: aString
	^ aString = '' |
		((aString
			findString: ' '
			startingAt: 1) > 0).! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
Prefix subclass: #ValidPrefix
	instanceVariableNames: 'stringValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValidPrefix methodsFor: 'operations' stamp: 'PMB 10/13/2022 19:37:31'!
checkForMatch: aString andStoreIn: aCollection
	(aString
		is: stringValue
		substringAt: 1) ifTrue: [ aCollection add: aString ].
	^ aCollection! !


!ValidPrefix methodsFor: 'initialization' stamp: 'PMB 10/13/2022 19:29:59'!
initializeWith: aString
	stringValue := aString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'validation' stamp: 'lj 10/13/2022 20:48:57'!
isValid: aString
	^ aString ~= '' &
		((aString
			findString: ' '
			startingAt: 1) = 0).! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'lj 10/13/2022 20:45:01'!
find: aPrefixString in: aStack
	| matches |
	aStack isEmpty ifTrue: [ self error: self class emptyStackErrorDescription ].
	matches _ self
		searchStack: aStack
		forStringsStartingWith: (Prefix with: aPrefixString).
	matches isEmpty ifTrue: [ self error: self class noMatchesFoundErrorDescription ].
	^ matches.! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'PMB 10/13/2022 19:19:09'!
moveElementsFrom: aStack to: anotherStack checkingFor: aPrefix
	| matches currentElement |
	matches _ OrderedCollection new.
	[ aStack isEmpty ] whileFalse: [
		currentElement _ aStack pop.
		(currentElement isKindOf: String) ifTrue: [
			matches := aPrefix checkForMatch: currentElement andStoreIn: matches.
			anotherStack push: currentElement ]].
	^ matches.! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'PMB 10/13/2022 20:00:36'!
searchStack: aStack forStringsStartingWith: aPrefix
	| matches auxStack |
	auxStack _ OOStack new.
	matches _ self
		moveElementsFrom: aStack
		to: auxStack
		checkingFor: aPrefix.
	self
		moveElementsFrom: auxStack
		to: aStack
		checkingFor: aPrefix.
	^ matches.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'PMB 10/12/2022 20:43:05'!
emptyStackErrorDescription
	^ 'Stack is empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'PMB 10/12/2022 20:41:10'!
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
