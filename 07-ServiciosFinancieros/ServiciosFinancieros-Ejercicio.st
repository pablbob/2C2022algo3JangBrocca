!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'PMB 11/8/2022 21:27:07'!
test01PortfolioHasBalanceOfZeroWhenCreated
	| portfolio |
	portfolio _ Portfolio new.
	self
		assert: 0 * peso
		equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'PMB 11/8/2022 21:27:36'!
test02SingleAccountPortfolioHasSameBalanceAsItsAccount
	| portfolio account |
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: account.
	portfolio add: account.
	self
		assert: 100 * peso
		equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'PMB 11/8/2022 21:34:17'!
test03PortfolioBalanceIsEqualToAccumulatedBalanceOfAllAccounts
	| portfolio account1 account2 |
	portfolio _ Portfolio new.
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.

	Deposit
		register: 100 * peso
		on: account1.
	Deposit
		register: 200 * peso
		on: account2.
		
	portfolio add: account1.
	portfolio add: account2.

	self
		assert: 300 * peso
		equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'PMB 11/9/2022 21:41:42'!
test04PortfolioKnowsIndividualTransactionsOfItsAccounts
	| portfolio account deposit withdraw |
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	deposit _ Deposit
		register: 200 * peso
		on: account.
	withdraw _ Withdraw
		register: 100 * peso
		on: account.
	portfolio add: account.
	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'tests' stamp: 'PMB 11/9/2022 20:12:36'!
test05PortfolioDoesNotKnowUnregisteredTransactions
	| portfolio account deposit withdraw |
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	deposit _ Deposit
		register: 200 * peso
		on: account.
	withdraw _ Withdraw for: 100 * peso.
	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw).! !

!PortfolioTest methodsFor: 'tests' stamp: 'PMB 11/9/2022 21:47:01'!
test06PortfolioKnowsAllTransactionsOfIndividualAccount
	| portfolio account deposit withdraw |
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	deposit _ Deposit
		register: 200 * peso
		on: account.
	withdraw _ Withdraw
		register: 100 * peso
		on: account.
	portfolio add: account.
	self
		assert: 2
		equals: (portfolio transactionsOf: account) size.
	self
		assert: (portfolio transactionsOf: account)
		includes: deposit.
		self
		assert: (portfolio transactionsOf: account)
		includes: withdraw.! !

!PortfolioTest methodsFor: 'tests' stamp: 'PMB 11/9/2022 21:28:41'!
test07PortfolioCannotCheckTransactionsOfNotYetAddedAccount
	| portfolio account |
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	self
		should: [ portfolio transactionsOf: account ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: Portfolio accountNotInPortfolioErrorDescription
				equals: anError messageText ].! !

!PortfolioTest methodsFor: 'tests' stamp: 'PMB 11/9/2022 21:49:10'!
test08PortfolioKnowsTransactionsOfChildPortfolio
	| portfolio1 portfolio2 account deposit |
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	account _ ReceptiveAccount new.
	deposit _ Deposit
		register: 100 * peso
		on: account.
	portfolio1 add: account.
	portfolio2 add: portfolio1.
	self assert: (portfolio2 hasRegistered: deposit).
	self
		assert: 1
		equals: (portfolio2 transactionsOf: account) size.
	self
		assert: (portfolio2 transactionsOf: account)
		includes: deposit.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'PMB 11/7/2022 19:29:13'!
test08TransferIncreasesBalanceOnReceptiveAccountAndDecreasesSameAmountOnEmittingAccount
	| receivingAccount emittingAccount |
	receivingAccount _ ReceptiveAccount new.
	emittingAccount _ ReceptiveAccount new.
	Deposit
		register: 200 * peso
		on: emittingAccount.
	Transfer
		register: 100 * peso
		from: emittingAccount
		to: receivingAccount.
	self
		assert: 100 * peso
		equals: emittingAccount balance.
	self
		assert: 100 * peso
		equals: receivingAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'PMB 11/8/2022 20:34:25'!
test09TransferValueCannotBeZero
	| receivingAccount emittingAccount |
	receivingAccount _ ReceptiveAccount new.
	emittingAccount _ ReceptiveAccount new.
	self
		should: [
			Transfer
				register: 0 * peso
				from: emittingAccount
				to: receivingAccount ]
		raise: Error withExceptionDo: [ :anError |
			self
				assert: Transfer nonPositiveTransferValueErrorDescription
				equals: anError messageText ].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'PMB 11/8/2022 20:38:26'!
test10TransferValueCannotBeNegative
	| receivingAccount emittingAccount |
	receivingAccount _ ReceptiveAccount new.
	emittingAccount _ ReceptiveAccount new.
	self
		should: [
			Transfer
				register: -100 * peso
				from: emittingAccount
				to: receivingAccount ]
		raise: Error
		withExceptionDo: [ :anError |
			self
				assert: Transfer nonPositiveTransferValueErrorDescription
				equals: anError messageText ].! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'PMB 11/8/2022 21:13:16'!
test11BothParticipatingAccountsKnowRespectiveSidesOfTransfer
	| receivingAccount emittingAccount transfer |
	receivingAccount _ ReceptiveAccount new.
	emittingAccount _ ReceptiveAccount new.
	transfer _ Transfer
		register: 100 * peso
		from: emittingAccount
		to: receivingAccount.
	self assert: (receivingAccount hasRegistered: transfer incomingSide).
	self assert: (emittingAccount hasRegistered: transfer outgoingSide).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'PMB 11/8/2022 21:16:57'!
test12BothSidesOfTransferKnowTheirCounterpart
	| receivingAccount emittingAccount transfer |
	receivingAccount _ ReceptiveAccount new.
	emittingAccount _ ReceptiveAccount new.
	transfer _ Transfer
		register: 100 * peso
		from: emittingAccount
		to: receivingAccount.
	self
		assert: transfer outgoingSide
		equals: transfer incomingSide counterpart.
	self
		assert: transfer incomingSide
		equals: transfer outgoingSide counterpart.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'PMB 11/4/2022 19:30:55'!
affect: aBalance
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'PMB 11/4/2022 19:30:13'!
affect: aBalance
	^ aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'PMB 11/4/2022 19:30:43'!
affect: aBalance
	^ aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'PMB 11/8/2022 21:36:18'!
balance
	^ accounts
		sum: [ :anAccount |
			anAccount balance ]
		ifEmpty: [ ^ 0 * peso ].! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:34:53'!
add: anAccount
	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'PMB 11/9/2022 20:14:24'!
hasRegistered: aTransaction
	^ accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:37:35'!
initialize
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'PMB 11/9/2022 21:31:33'!
transactionsOf: anAccount
	(accounts includes: anAccount) ifTrue: [^ anAccount transactions].
	self class error: self class accountNotInPortfolioErrorDescription .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'PMB 11/9/2022 21:30:00'!
accountNotInPortfolioErrorDescription
	^ 'This account is not included in the portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'PMB 11/8/2022 20:47:02'!
balance
	| aBalance |
	aBalance _ 0 * peso.
	transactions do: [ :aTransaction |
		aBalance _ aTransaction affect: aBalance ].
	^ aBalance.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value incomingSide outgoingSide'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:04:35'!
incomingSide
	^ incomingSide! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'PMB 11/7/2022 19:52:23'!
initializeFor: aValue withDeposit: aDeposit andWithdraw: aWithdraw
	value _ aValue .
	deposit _ aDeposit .
	withdraw _ aWithdraw .! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:24:03'!
initializeFor: aValue withIncomingSide: anIncomingTransferSide andOutgoingSide: anOutgoingTransferSide
	value _ aValue.
	incomingSide _ anIncomingTransferSide.
	outgoingSide _ anOutgoingTransferSide.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:04:57'!
outgoingSide
	^ outgoingSide.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'PMB 11/7/2022 20:50:59'!
value
 ^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'PMB 11/7/2022 19:54:05'!
for: aValue withDeposit: transferDeposit andWithdraw: transferWithdraw
	^ self new
		initializeFor: aValue
		withDeposit: transferDeposit
		andWithdraw: transferWithdraw.! !

!Transfer class methodsFor: 'instance creation' stamp: 'PMB 11/8/2022 21:06:32'!
for: aValue withIncomingSide: anIncomingTransferSide andOutgoingSide: anOutgoingTransferSide
	^ self new
		initializeFor: aValue
		withIncomingSide: anIncomingTransferSide
		andOutgoingSide: anOutgoingTransferSide.! !

!Transfer class methodsFor: 'instance creation' stamp: 'PMB 11/8/2022 20:34:49'!
nonPositiveTransferValueErrorDescription
^ 'Transfer value must be positive'.! !

!Transfer class methodsFor: 'instance creation' stamp: 'PMB 11/8/2022 21:25:37'!
register: aValue from: anEmittingAccount to: aReceivingAccount
	| incomingTransferSide outgoingTransferSide transfer |
	aValue <= 0 ifTrue: [ self error: self nonPositiveTransferValueErrorDescription ].
	incomingTransferSide _ IncomingSide for: aValue.
	outgoingTransferSide _ OutgoingSide for: aValue.
	transfer _ self
		for: aValue
		withIncomingSide: incomingTransferSide
		andOutgoingSide: outgoingTransferSide.
	anEmittingAccount register: outgoingTransferSide.
	aReceivingAccount register: incomingTransferSide.
	^ transfer.! !


!classDefinition: #TransferSide category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferSide
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferSide methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:03:22'!
affect: aBalance
	self subclassResponsibility ! !

!TransferSide methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:17:39'!
counterpart
	self subclassResponsibility .! !

!TransferSide methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:01:59'!
initializeFor: aValue
	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferSide class' category: 'ServiciosFinancieros-Ejercicio'!
TransferSide class
	instanceVariableNames: ''!

!TransferSide class methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:01:42'!
for: aValue
	^ self new initializeFor: aValue.! !


!classDefinition: #IncomingSide category: 'ServiciosFinancieros-Ejercicio'!
TransferSide subclass: #IncomingSide
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!IncomingSide methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:02:49'!
affect: aBalance
	^ aBalance + value.
	! !

!IncomingSide methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:18:52'!
counterpart
	 ^ OutgoingSide for: value.! !


!classDefinition: #OutgoingSide category: 'ServiciosFinancieros-Ejercicio'!
TransferSide subclass: #OutgoingSide
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!OutgoingSide methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:02:57'!
affect: aBalance
	^ aBalance - value.
	! !

!OutgoingSide methodsFor: 'as yet unclassified' stamp: 'PMB 11/8/2022 21:19:23'!
counterpart
	^ IncomingSide for: value.! !
