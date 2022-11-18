!classDefinition: #ReportTest category: 'ServiciosFinancieros2-Reportes'!
TestCase subclass: #ReportTest
	instanceVariableNames: 'nl'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!ReportTest methodsFor: 'setUp/tearDown' stamp: 'PMB 11/17/2022 21:15:41'!
setUp
	nl _ String newLineString ! !


!classDefinition: #PortfolioReportTest category: 'ServiciosFinancieros2-Reportes'!
ReportTest subclass: #PortfolioReportTest
	instanceVariableNames: 'tab'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!PortfolioReportTest methodsFor: 'setUp/tearDown' stamp: 'PMB 11/17/2022 21:16:14'!
setUp
	super setUp. 
	tab _ String tab! !


!PortfolioReportTest methodsFor: 'PortfolioTreePrinter-tests' stamp: 'PMB 11/18/2022 09:40:27'!
test01PortfolioTreePrinterOfEmptyPortfolioPrintsPortfoliosName
	| portfolioTreePrinter portfolio |
	portfolio _ Portfolio named: 'Portfolio'.
	portfolioTreePrinter _ PortfolioTreePrinter of: portfolio.
	self
		assert: 'Portfolio'
		equals: portfolioTreePrinter reportData .! !

!PortfolioReportTest methodsFor: 'PortfolioTreePrinter-tests' stamp: 'PMB 11/18/2022 09:40:35'!
test02PortfolioTreePrinterOfPortfolioWithSingleAccountPrintsCorrectly
	| portfolioTreePrinter portfolio nicksAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	portfolio add: nicksAccount.
	portfolioTreePrinter _ PortfolioTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick'
		equals: portfolioTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioTreePrinter-tests' stamp: 'PMB 11/18/2022 09:40:39'!
test03PortfolioTreePrinterOfPortfolioWithMultipleAccountsPrintsCorrectly
	| portfolioTreePrinter portfolio nicksAccount juliesAccount joeysAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	joeysAccount _ ReceptiveAccount named: 'Cuenta de Joey'.
	portfolio add: nicksAccount.
	portfolio add: juliesAccount.
	portfolio add: joeysAccount.
	portfolioTreePrinter _ PortfolioTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick' , nl , tab , 'Cuenta de Julie' , nl , tab , 'Cuenta de Joey'
		equals: portfolioTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioTreePrinter-tests' stamp: 'PMB 11/18/2022 09:40:43'!
test04PortfolioTreePrinterOfPortfolioWithChildPortfolioPrintsCorrectly
	| portfolioTreePrinter portfolio childPortfolio |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	portfolio add: childPortfolio.
	portfolioTreePrinter _ PortfolioTreePrinter of: portfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Portfolio B'
		equals: portfolioTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioTreePrinter-tests' stamp: 'PMB 11/18/2022 09:40:47'!
test05PortfolioTreePrinterOfPortfolioWithAccountAndChildPortfolioPrintsCorrectly
	| portfolioTreePrinter portfolio childPortfolio nicksAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	portfolio add: nicksAccount.
	portfolio add: childPortfolio.
	portfolioTreePrinter _ PortfolioTreePrinter of: portfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Cuenta de Nick' , nl , tab , 'Portfolio B'
		equals: portfolioTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioTreePrinter-tests' stamp: 'PMB 11/18/2022 09:40:50'!
test06PortfolioTreePrinterOfPortfolioWithChildPortfolioWithAccountPrintsCorrectly
	| portfolioTreePrinter portfolio childPortfolio nicksAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	childPortfolio add: nicksAccount.
	portfolio add: childPortfolio.
	portfolioTreePrinter _ PortfolioTreePrinter of: portfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Nick'
		equals: portfolioTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioTreePrinter-tests' stamp: 'PMB 11/18/2022 09:40:54'!
test07PortfolioTreePrinterOfPortfolioWithAccountAndChildPortfolioWithAccountPrintsCorrectly
	| portfolioTreePrinter portfolio childPortfolio nicksAccount juliesAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	portfolio add: nicksAccount.
	childPortfolio add: juliesAccount.
	portfolio add: childPortfolio.
	portfolioTreePrinter _ PortfolioTreePrinter of: portfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Cuenta de Nick' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Julie'
		equals: portfolioTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioTreePrinter-tests' stamp: 'PMB 11/18/2022 09:40:58'!
test08PortfolioTreePrinterOfPortfolioWithMultipleAccountsAndChildPortfolioWithMultipleAccountsPrintsCorrectly
	| portfolioTreePrinter portfolio childPortfolio nicksAccount juliesAccount joeysAccount charliesAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	joeysAccount _ ReceptiveAccount named: 'Cuenta de Joey'.
	charliesAccount _ ReceptiveAccount named: 'Cuenta de Charlie'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	portfolio add: nicksAccount.
	portfolio add: juliesAccount.
	childPortfolio add: joeysAccount.
	childPortfolio add: charliesAccount.
	portfolio add: childPortfolio.
	portfolioTreePrinter _ PortfolioTreePrinter of: portfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Cuenta de Nick' , nl , tab , 'Cuenta de Julie' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Joey' , nl , tab , tab , 'Cuenta de Charlie'
		equals: portfolioTreePrinter reportData.! !


!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'PMB 11/18/2022 09:28:23'!
test09PortfolioDetailedTreePrinterOfEmptyPortfolioPrintsPortfoliosNameAndItsBalance
	| portfolioDetailedTreePrinter portfolio |
	portfolio _ Portfolio named: 'Portfolio'.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Balance = 0 pesos'
		equals: portfolioDetailedTreePrinter reportData .! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'PMB 11/18/2022 12:30:51'!
test10PortfolioDetailedTreePrinterOfPortfolioWithSingleAccountWithNoTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio nicksAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	portfolio add: nicksAccount.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Balance = 0 pesos' , nl , tab , 'Balance = 0 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'PMB 11/18/2022 12:50:42'!
test11PortfolioDetailedTreePrinterOfPortfolioWithSingleAccountWithDepositPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio nicksAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	Deposit
		register: 100
		on: nicksAccount.
	portfolio add: nicksAccount.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Depósito por 100 pesos' , nl , tab , tab , 'Balance = 100 pesos' , nl , tab , 'Balance = 100 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'PMB 11/18/2022 12:51:01'!
test12PortfolioDetailedTreePrinterOfPortfolioWithSingleAccountWithWithdrawPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio nicksAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	Withdraw
		register: 50
		on: nicksAccount.
	portfolio add: nicksAccount.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick' , nl , tab , tab  , 'Extracción por 50 pesos' , nl , tab , tab , 'Balance = -50 pesos' , nl , tab , 'Balance = -50 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'PMB 11/18/2022 12:55:44'!
test13PortfolioDetailedTreePrinterOfPortfolioWithSingleAccountWithTransferDepositPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio nicksAccount juliesAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	Transfer
		amount: 100
		from: juliesAccount
		to: nicksAccount.
	portfolio add: nicksAccount.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Entrada por transferencia de 100 pesos' , nl , tab , tab , 'Balance = 100 pesos' , nl , tab , 'Balance = 100 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'PMB 11/18/2022 12:56:20'!
test14PortfolioDetailedTreePrinterOfPortfolioWithSingleAccountWithTransferWithdrawPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio nicksAccount juliesAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	Transfer
		amount: 100
		from: nicksAccount
		to: juliesAccount.
	portfolio add: nicksAccount.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Salida por transferencia de 100 pesos' , nl , tab , tab , 'Balance = -100 pesos' , nl , tab , 'Balance = -100 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'PMB 11/18/2022 12:58:46'!
test15PortfolioDetailedTreePrinterOfPortfolioWithMultipleAccountsWithNoTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio nicksAccount juliesAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	portfolio add: nicksAccount.
	portfolio add: juliesAccount.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Balance = 0 pesos' , nl , tab ,'Cuenta de Julie' , nl , tab , tab , 'Balance = 0 pesos' , nl , tab, 'Balance = 0 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'PMB 11/18/2022 13:05:40'!
test16PortfolioDetailedTreePrinterOfPortfolioWithMultipleAccountsWithMultipleTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio nicksAccount juliesAccount |
	portfolio _ Portfolio named: 'Portfolio'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	Deposit
		register: 200 * peso
		on: nicksAccount.
	Transfer
		amount: 100 * peso
		from: nicksAccount
		to: juliesAccount.
	Withdraw
		register: 50 * peso
		on: juliesAccount.
	portfolio add: nicksAccount.
	portfolio add: juliesAccount.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	self
		assert: 'Portfolio' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Depósito por 200 pesos' , nl , tab , tab , 'Salida por transferencia de 100 pesos' , nl , tab , tab , 'Balance = 100 pesos' , nl , tab , 'Cuenta de Julie' , nl , tab , tab , 'Entrada por transferencia de 100 pesos' , nl , tab , tab , 'Extracción por 50 pesos' , nl , tab , tab , 'Balance = 50 pesos' , nl , tab , 'Balance = 150 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'l 11/18/2022 14:10:45'!
test17PortfolioDetailedTreePrinterOfPortfolioWithEmptyChildPortfolioPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio childPortfolio |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	portfolio add: childPortfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Balance = 0 pesos' , nl , tab , 'Balance = 0 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'l 11/18/2022 14:17:51'!
test18PortfolioDetailedTreePrinterOfPortfolioWithChildPortfolioWithSingleAccountWithNoTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio childPortfolio nicksAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	childPortfolio add: nicksAccount .
	portfolio add: childPortfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Nick', nl, tab, tab, tab , 'Balance = 0 pesos' , nl, tab, tab ,'Balance = 0 pesos', nl , tab , 'Balance = 0 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'l 11/18/2022 14:26:55'!
test19PortfolioDetailedTreePrinterOfPortfolioWithChildPortfolioWithSingleAccountWithMultipleTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio childPortfolio nicksAccount juliesAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	Deposit
		register: 200 * peso
		on: nicksAccount.
	Withdraw
		register: 50 * peso
		on: nicksAccount.
	Transfer
		amount: 100 * peso
		from: nicksAccount
		to: juliesAccount.
	Transfer
		amount: 50 * peso
		from: juliesAccount
		to: nicksAccount.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	childPortfolio add: nicksAccount.
	portfolio add: childPortfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Nick' , nl , tab , tab , tab , 'Depósito por 200 pesos' , nl , tab , tab , tab , 'Extracción por 50 pesos' , nl , tab , tab , tab , 'Salida por transferencia de 100 pesos' , nl , tab , tab , tab , 'Entrada por transferencia de 50 pesos' , nl , tab , tab , tab , 'Balance = 100 pesos' , nl , tab , tab , 'Balance = 100 pesos' , nl , tab , 'Balance = 100 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'l 11/18/2022 14:48:14'!
test20PortfolioDetailedTreePrinterOfPortfolioWithChildPortfolioWithMultipleAccountsWithNoTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio childPortfolio nicksAccount juliesAccount charliesAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	charliesAccount _ ReceptiveAccount named: 'Cuenta de Charlie'.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	childPortfolio add: nicksAccount.
	childPortfolio add: juliesAccount.
	childPortfolio add: charliesAccount.
	portfolio add: childPortfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Nick'  , nl , tab , tab , tab , 'Balance = 0 pesos' , nl , tab , tab , 'Cuenta de Julie'  , nl , tab , tab , tab , 'Balance = 0 pesos' , nl , tab , tab , 'Cuenta de Charlie'  , nl , tab , tab , tab , 'Balance = 0 pesos' , nl , tab , tab , 'Balance = 0 pesos' , nl , tab , 'Balance = 0 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'l 11/18/2022 14:55:08'!
test21PortfolioDetailedTreePrinterOfPortfolioWithChildPortfolioWithMultipleAccountsWithMultipleTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio childPortfolio nicksAccount juliesAccount charliesAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	charliesAccount _ ReceptiveAccount named: 'Cuenta de Charlie'.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	Deposit
		register: 200 * peso
		on: nicksAccount.
	Withdraw
		register: 50 * peso
		on: juliesAccount.
	Transfer
		amount: 100 * peso
		from: nicksAccount
		to: charliesAccount.
	Transfer
		amount: 50 * peso
		from: charliesAccount
		to: juliesAccount.
	childPortfolio add: nicksAccount.
	childPortfolio add: juliesAccount.
	childPortfolio add: charliesAccount.
	portfolio add: childPortfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Nick' , nl , tab , tab , tab , 'Depósito por 200 pesos' , nl , tab , tab , tab , 'Salida por transferencia de 100 pesos' , nl , tab , tab , tab , 'Balance = 100 pesos' , nl , tab , tab , 'Cuenta de Julie' , nl , tab , tab , tab , 'Extracción por 50 pesos' , nl , tab , tab , tab , 'Entrada por transferencia de 50 pesos' , nl , tab , tab , tab , 'Balance = 0 pesos' , nl , tab , tab , 'Cuenta de Charlie' , nl , tab , tab , tab , 'Entrada por transferencia de 100 pesos' , nl , tab , tab , tab , 'Salida por transferencia de 50 pesos' , nl , tab , tab , tab , 'Balance = 50 pesos' , nl , tab , tab , 'Balance = 150 pesos' , nl , tab , 'Balance = 150 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'l 11/18/2022 15:24:17'!
test22PortfolioDetailedTreePrinterOfPortfolioWithSingleAccountWithMultipleTransactionAndEmptyChildPortfolioPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio childPortfolio nicksAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	Deposit
		register: 200 * peso
		on: nicksAccount.
	Withdraw
		register: 50 * peso
		on: nicksAccount.
	portfolio add: nicksAccount.
	portfolio add: childPortfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Depósito por 200 pesos' , nl , tab , tab , 'Extracción por 50 pesos' , nl , tab , tab , 'Balance = 150 pesos' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Balance = 0 pesos' , nl , tab , 'Balance = 150 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'l 11/18/2022 15:28:58'!
test23PortfolioDetailedTreePrinterOfPortfolioWithSingleAccountWithMultipleTransactionAndChildPortfolioWithSingleAccountWithMultipleTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio childPortfolio nicksAccount juliesAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	Deposit
		register: 200 * peso
		on: nicksAccount.
	Withdraw
		register: 100 * peso
		on: juliesAccount.
	Transfer
		amount: 50 * peso
		from: nicksAccount
		to: juliesAccount.
	portfolio add: nicksAccount.
	childPortfolio add: juliesAccount.
	portfolio add: childPortfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Depósito por 200 pesos' , nl , tab , tab , 'Salida por transferencia de 50 pesos' , nl , tab , tab , 'Balance = 150 pesos' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Julie' , nl , tab , tab , tab , 'Extracción por 100 pesos' , nl , tab , tab , tab , 'Entrada por transferencia de 50 pesos' , nl , tab , tab , tab , 'Balance = -50 pesos' , nl , tab , tab , 'Balance = -50 pesos' , nl , tab , 'Balance = 100 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !

!PortfolioReportTest methodsFor: 'PortfolioDetailedTreePrinter-tests' stamp: 'l 11/18/2022 15:24:42'!
test24PortfolioDetailedTreePrinterOfPortfolioWithMultipleAccountsWithMultipleTransactionAndChildPortfolioWithMultipleAccountsWithMultipleTransactionsPrintsCorrectly
	| portfolioDetailedTreePrinter portfolio childPortfolio nicksAccount juliesAccount charliesAccount joeysAccount |
	portfolio _ Portfolio named: 'Portfolio A'.
	childPortfolio _ Portfolio named: 'Portfolio B'.
	nicksAccount _ ReceptiveAccount named: 'Cuenta de Nick'.
	juliesAccount _ ReceptiveAccount named: 'Cuenta de Julie'.
	charliesAccount _ ReceptiveAccount named: 'Cuenta de Charlie'.
	joeysAccount _ ReceptiveAccount named: 'Cuenta de Joey'.
	portfolioDetailedTreePrinter _ PortfolioDetailedTreePrinter of: portfolio.
	Deposit
		register: 200 * peso
		on: nicksAccount.
	Deposit
		register: 200 * peso
		on: joeysAccount.
	Withdraw
		register: 50 * peso
		on: juliesAccount.
	Withdraw
		register: 50 * peso
		on: charliesAccount.
	Transfer
		amount: 100 * peso
		from: nicksAccount
		to: charliesAccount.
	Transfer
		amount: 50 * peso
		from: joeysAccount
		to: juliesAccount.
	portfolio add: nicksAccount.
	portfolio add: juliesAccount.
	childPortfolio add: charliesAccount.
	childPortfolio add: joeysAccount.
	portfolio add: childPortfolio.
	self
		assert: 'Portfolio A' , nl , tab , 'Cuenta de Nick' , nl , tab , tab , 'Depósito por 200 pesos' , nl , tab , tab , 'Salida por transferencia de 100 pesos' , nl , tab , tab , 'Balance = 100 pesos' , nl , tab , 'Cuenta de Julie' , nl , tab , tab , 'Extracción por 50 pesos' , nl , tab , tab , 'Entrada por transferencia de 50 pesos' , nl , tab , tab , 'Balance = 0 pesos' , nl , tab , 'Portfolio B' , nl , tab , tab , 'Cuenta de Charlie' , nl , tab , tab , tab , 'Extracción por 50 pesos' , nl , tab , tab , tab , 'Entrada por transferencia de 100 pesos' , nl , tab , tab , tab , 'Balance = 50 pesos' , nl , tab , tab , 'Cuenta de Joey' , nl , tab , tab , tab , 'Depósito por 200 pesos' , nl , tab , tab , tab , 'Salida por transferencia de 50 pesos' , nl , tab , tab , tab , 'Balance = 150 pesos' , nl , tab , tab , 'Balance = 200 pesos' , nl , tab , 'Balance = 300 pesos'
		equals: portfolioDetailedTreePrinter reportData.! !


!classDefinition: #TransactionReportTest category: 'ServiciosFinancieros2-Reportes'!
ReportTest subclass: #TransactionReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!TransactionReportTest methodsFor: 'AccountSummary-tests' stamp: 'PMB 11/18/2022 12:39:11'!
test01AccountSummaryOfAccountWithNoTransactionsDisplaysCorrespondingMessage
	| account summary |
	account _ ReceptiveAccount new.
	summary _ AccountSummary of: account transactions.
	self
		assert: 'No hay transacciones para mostrar'
		equals: (summary reportData).! !

!TransactionReportTest methodsFor: 'AccountSummary-tests' stamp: 'PMB 11/18/2022 12:39:30'!
test02AccountSummaryWithSingleDepositIsDisplayedCorrectly
	| account summary |
	account _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: account.
	summary _ AccountSummary of: account transactions.
	self
		assert: 'Depósito por 100 pesos' , nl , 'Balance = 100 pesos'
		equals: summary reportData.! !

!TransactionReportTest methodsFor: 'AccountSummary-tests' stamp: 'PMB 11/18/2022 12:40:05'!
test03AccountSummaryWithWithdrawAfterDepositIsDisplayedCorrectly
	| account summary |
	account _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: account.
	Withdraw
		register: 50 * peso
		on: account.
	summary _ AccountSummary of: account transactions.
	self
		assert: 'Depósito por 100 pesos' ,nl , 'Extracción por 50 pesos' , nl , 'Balance = 50 pesos'
		equals: summary reportData.! !

!TransactionReportTest methodsFor: 'AccountSummary-tests' stamp: 'PMB 11/18/2022 12:40:28'!
test04AccountSummaryWithTransferDepositIsDisplayedCorrectly
	| destinationAccount originAccount summary |
	destinationAccount _ ReceptiveAccount new.
	originAccount _ ReceptiveAccount new.
	Transfer
		amount: 100
		from: originAccount
		to: destinationAccount.
	summary _ AccountSummary of: destinationAccount transactions.
	self
		assert: 'Entrada por transferencia de 100 pesos' , nl , 'Balance = 100 pesos'
		equals: summary reportData.! !

!TransactionReportTest methodsFor: 'AccountSummary-tests' stamp: 'PMB 11/18/2022 12:40:39'!
test05AccountSummaryWithTransferWithdrawIsDisplayedCorrectly
	| destinationAccount originAccount summary |
	destinationAccount _ ReceptiveAccount new.
	originAccount _ ReceptiveAccount new.
	Transfer
		amount: 100
		from: originAccount
		to: destinationAccount.
	summary _ AccountSummary of: originAccount transactions.
	self
		assert: 'Salida por transferencia de 100 pesos' , nl , 'Balance = -100 pesos'
		equals: summary reportData.! !


!TransactionReportTest methodsFor: 'TransferNet-tests' stamp: 'PMB 11/17/2022 21:23:59'!
test06TransferNetOfAccountWithoutTransfersReturnsCorrespondingMessage
	| account transferNet |
	account _ ReceptiveAccount new.
	transferNet _ TransferNet of: account transactions.
	self
		assert: 'No hay transferencias registradas'
		equals: transferNet
		reportData! !

!TransactionReportTest methodsFor: 'TransferNet-tests' stamp: 'PMB 11/17/2022 21:24:05'!
test07TransferNetReturnsValueOfIncomingTransfer
	| originAccount destinationAccount transferNet |
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer
		amount: 100 * peso
		from: originAccount
		to: destinationAccount.
	transferNet _ TransferNet of: destinationAccount transactions.
	self
		assert: 'El neto de transferencias es de 100 pesos'
		equals: transferNet
		reportData! !

!TransactionReportTest methodsFor: 'TransferNet-tests' stamp: 'PMB 11/17/2022 21:24:10'!
test08TransferNetReturnsValueOfOutgoingTransfer
	| originAccount destinationAccount transferNet |
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer
		amount: 100 * peso
		from: originAccount
		to: destinationAccount.
	transferNet _ TransferNet of: originAccount transactions.
	self
		assert: 'El neto de transferencias es de -100 pesos'
		equals: transferNet
		reportData! !

!TransactionReportTest methodsFor: 'TransferNet-tests' stamp: 'PMB 11/17/2022 21:24:17'!
test09TransferNetReturnsBalanceOfAllTransfers
	| originAccount destinationAccount originTransferNet destinationTransferNet |
	originAccount _ ReceptiveAccount new.
	destinationAccount _ ReceptiveAccount new.
	Transfer
		amount: 100 * peso
		from: originAccount
		to: destinationAccount.
	Transfer
		amount: 50 * peso
		from: destinationAccount
		to: originAccount.
	Transfer
		amount: 200 * peso
		from: originAccount
		to: destinationAccount.
	Transfer
		amount: 100 * peso
		from: destinationAccount
		to: originAccount.
	originTransferNet _ TransferNet of: originAccount transactions.
	destinationTransferNet _ TransferNet of: destinationAccount transactions.
	self
		assert: 'El neto de transferencias es de -150 pesos'
		equals: originTransferNet
		reportData.
	self
		assert: 'El neto de transferencias es de 150 pesos'
		equals: destinationTransferNet
		reportData! !

!TransactionReportTest methodsFor: 'TransferNet-tests' stamp: 'PMB 11/17/2022 21:24:25'!
test10TransferNetDoesNotDetectDeposits
	| account transferNet |
	account _ ReceptiveAccount new.
	Deposit
		register: 100 * peso
		on: account.
	transferNet _ TransferNet of: account transactions.
	self
		assert: 'No hay transferencias registradas'
		equals: transferNet
		reportData! !

!TransactionReportTest methodsFor: 'TransferNet-tests' stamp: 'PMB 11/17/2022 21:24:41'!
test11TransferNetDoesNotDetectWithdraws
	| account transferNet |
	account _ ReceptiveAccount new.
	Withdraw
		register: 100 * peso
		on: account.
	transferNet _ TransferNet of: account transactions.
	self
		assert: 'No hay transferencias registradas'
		equals: transferNet
		reportData! !


!classDefinition: #Report category: 'ServiciosFinancieros2-Reportes'!
Object subclass: #Report
	instanceVariableNames: 'dataToDisplay'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!Report methodsFor: 'printing' stamp: 'PMB 11/18/2022 11:13:19'!
printToString: aCollectionOfLines
	| displayLine |
	displayLine _ ''.
	aCollectionOfLines do: [ :aLine |
		displayLine
			ifEmpty: [ displayLine _ aLine ]
			ifNotEmpty: [ displayLine _ displayLine , (String newLineString) , aLine ]].
	^ displayLine.! !


!Report methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:22:03'!
reportData
	self subclassResponsibility ! !


!Report methodsFor: 'accessing' stamp: 'l 11/18/2022 14:09:26'!
dataToDisplay
	^ dataToDisplay ! !


!classDefinition: #PortfolioReport category: 'ServiciosFinancieros2-Reportes'!
Report subclass: #PortfolioReport
	instanceVariableNames: 'portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!PortfolioReport methodsFor: 'initialization' stamp: 'PMB 11/18/2022 09:58:55'!
initializeOf: aPortfolio
	portfolio _ aPortfolio.
	dataToDisplay _ OrderedCollection new.! !


!PortfolioReport methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:36:31'!
reportData
	self subclassResponsibility ! !


!PortfolioReport methodsFor: 'private' stamp: 'PMB 11/18/2022 10:07:35'!
addAccountsToDisplayDataTabbing: aNumberOfTabs
	dataToDisplay add: (self tabs: aNumberOfTabs) , portfolio name.
	portfolio accounts do: [ :anAccount |
		anAccount
			beAddedToDisplayDataOf: self
			tabbing: aNumberOfTabs ].
	! !

!PortfolioReport methodsFor: 'private' stamp: 'PMB 11/18/2022 09:32:31'!
addPortfolioToDisplayData: anAccount tabbing: aNumberOfTabs
	self subclassResponsibility.! !

!PortfolioReport methodsFor: 'private' stamp: 'PMB 11/18/2022 09:32:49'!
addReceptiveAccountToDisplayData: anAccount tabbing: aNumberOfTabs
	self subclassResponsibility.! !

!PortfolioReport methodsFor: 'private' stamp: 'PMB 11/18/2022 10:09:45'!
prepareDataTabbing: aNumberOfTabs
	self subclassResponsibility ! !

!PortfolioReport methodsFor: 'private' stamp: 'PMB 11/17/2022 21:26:30'!
tabs: aNumberOfTabs
	| tabs |
	tabs _ ''.
	aNumberOfTabs timesRepeat: [ tabs _ tabs , String tab ].
	^ tabs.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioReport class' category: 'ServiciosFinancieros2-Reportes'!
PortfolioReport class
	instanceVariableNames: ''!

!PortfolioReport class methodsFor: 'as yet unclassified' stamp: 'PMB 11/17/2022 21:46:27'!
of: aPortfolio
	^self new initializeOf: aPortfolio ! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros2-Reportes'!
PortfolioReport subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!PortfolioDetailedTreePrinter methodsFor: 'reporting' stamp: 'PMB 11/18/2022 10:09:45'!
reportData
	self prepareDataTabbing: 0.
	^ self printToString: dataToDisplay.! !


!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'l 11/18/2022 14:14:19'!
addPortfolioToDisplayData: aPortfolio tabbing: aNumberOfTabs
	dataToDisplay addAllLast: ((PortfolioDetailedTreePrinter of: aPortfolio) prepareDataTabbing: aNumberOfTabs + 1).! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'PMB 11/18/2022 12:05:20'!
addReceptiveAccountToDisplayData: anAccount tabbing: aNumberOfTabs
	| summary |
	summary _ (AccountSummary of: anAccount transactions) reportData .
	summary = 'No hay transacciones para mostrar' ifTrue: [ summary _ 'Balance = 0 pesos' ].
	dataToDisplay add: ((self tabs: aNumberOfTabs +1) , anAccount name).
	dataToDisplay addAllLast:
		(self
			addTabs: aNumberOfTabs + 2
			toLinesOf: summary).! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'PMB 11/18/2022 12:10:14'!
addTabs: aNumberOfTabs toLinesOf: aString
	| lines |
	lines _ self splitByNewLine: aString.
	^ lines collect: [ :aLine | ((self tabs: aNumberOfTabs), aLine)].! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'PMB 11/18/2022 10:09:45'!
prepareDataTabbing: aNumberOfTabs
	self addAccountsToDisplayDataTabbing: aNumberOfTabs.
	dataToDisplay add: (self tabs: aNumberOfTabs + 1), 'Balance = ' , portfolio balance amount asString , ' pesos'.
	^ dataToDisplay.! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'PMB 11/18/2022 11:53:47'!
splitByNewLine: aString
	| numberOfLines currentSubString lines |
	currentSubString _ aString.
	lines _ OrderedCollection new.
	numberOfLines _ (aString select: [ :character |
		character = Character newLineCharacter ]) size + 1.
	numberOfLines timesRepeat: [
		lines add:
			(currentSubString
				copyFrom: 1
				to:
					(currentSubString
						indexOf: Character newLineCharacter
						ifAbsent: [ currentSubString size + 1 ]) - 1).
		currentSubString _ currentSubString
			copyFrom: (currentSubString indexOf: Character newLineCharacter) + 1
			to: currentSubString size ].
	^ lines.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros2-Reportes'!
PortfolioReport subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!PortfolioTreePrinter methodsFor: 'reporting' stamp: 'PMB 11/18/2022 10:09:45'!
reportData
	self prepareDataTabbing: 0.
	^ self printToString: dataToDisplay.! !


!PortfolioTreePrinter methodsFor: 'private' stamp: 'PMB 11/18/2022 10:12:13'!
addPortfolioToDisplayData: anAccount tabbing: aNumberOfTabs
	dataToDisplay addAllLast: ((PortfolioTreePrinter of: anAccount) prepareDataTabbing: aNumberOfTabs + 1).! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'PMB 11/18/2022 10:10:37'!
addReceptiveAccountToDisplayData: anAccount tabbing: aNumberOfTabs
	dataToDisplay add: (self tabs: aNumberOfTabs + 1) , anAccount name.! !

!PortfolioTreePrinter methodsFor: 'private' stamp: 'PMB 11/18/2022 10:09:45'!
prepareDataTabbing: aNumberOfTabs
	self addAccountsToDisplayDataTabbing: aNumberOfTabs.
	^ dataToDisplay.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros2-Reportes'!
PortfolioTreePrinter class
	instanceVariableNames: 'portfolio'!


!classDefinition: #TransactionReport category: 'ServiciosFinancieros2-Reportes'!
Report subclass: #TransactionReport
	instanceVariableNames: 'transactions netBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!


!TransactionReport methodsFor: 'initialization' stamp: 'PMB 11/18/2022 09:37:51'!
initializeWith: aCollectionOfTransactions
	transactions _ aCollectionOfTransactions.
	dataToDisplay _ OrderedCollection new.
	netBalance _ 0 * peso.! !


!TransactionReport methodsFor: 'operations' stamp: 'PMB 11/16/2022 22:30:49'!
addToBalance: aValue
	netBalance := netBalance + aValue! !

!TransactionReport methodsFor: 'operations' stamp: 'PMB 11/16/2022 22:31:04'!
substractFromBalance: aValue
	netBalance _ netBalance - aValue.! !


!TransactionReport methodsFor: 'reporting' stamp: 'PMB 11/17/2022 21:22:31'!
reportData
	self subclassResponsibility ! !


!TransactionReport methodsFor: 'private' stamp: 'PMB 11/18/2022 09:12:55'!
addDepositToDisplayData: aDeposit
	self subclassResponsibility ! !

!TransactionReport methodsFor: 'private' stamp: 'PMB 11/18/2022 09:13:47'!
addTransferDepositToDisplayData: aTransferDeposit
	self subclassResponsibility.! !

!TransactionReport methodsFor: 'private' stamp: 'PMB 11/18/2022 09:13:40'!
addTransferWithdrawToDisplayData: aTransferWithdraw
	self subclassResponsibility.! !

!TransactionReport methodsFor: 'private' stamp: 'PMB 11/18/2022 09:13:56'!
addWithdrawToDisplayData: aWithdraw
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionReport class' category: 'ServiciosFinancieros2-Reportes'!
TransactionReport class
	instanceVariableNames: ''!

!TransactionReport class methodsFor: 'instance creation' stamp: 'PMB 11/16/2022 23:16:31'!
of: aListOfTransactions
	^ self new initializeWith: aListOfTransactions.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros2-Reportes'!
TransactionReport subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!AccountSummary methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:07:29'!
reportData
	transactions ifEmpty: [ ^ 'No hay transacciones para mostrar' ].
	transactions do: [ :aTransaction |
		aTransaction beAddedToDisplayDataOf: self ].
	dataToDisplay add: 'Balance = ' , netBalance amount asString , ' pesos'.
	^ self printToString: dataToDisplay.! !


!AccountSummary methodsFor: 'private' stamp: 'PMB 11/18/2022 09:09:10'!
addDepositToDisplayData: aDeposit
	self addToBalance: aDeposit value.
	dataToDisplay add:  'Depósito por ' , aDeposit value amount asString , ' pesos'.! !

!AccountSummary methodsFor: 'private' stamp: 'PMB 11/18/2022 09:09:50'!
addTransferDepositToDisplayData: aTransferDeposit
	self addToBalance: aTransferDeposit value.
	dataToDisplay add:  'Entrada por transferencia de ' , aTransferDeposit value amount asString , ' pesos'.! !

!AccountSummary methodsFor: 'private' stamp: 'PMB 11/18/2022 09:10:20'!
addTransferWithdrawToDisplayData: aTransferWithdraw
	self substractFromBalance: aTransferWithdraw value.
	dataToDisplay add:  'Salida por transferencia de ' , aTransferWithdraw value amount asString , ' pesos'.! !

!AccountSummary methodsFor: 'private' stamp: 'PMB 11/18/2022 09:11:29'!
addWithdrawToDisplayData: aWithdraw
	self substractFromBalance: aWithdraw value.
	dataToDisplay add:  'Extracción por ' , aWithdraw value amount asString , ' pesos'.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros2-Reportes'!
TransactionReport subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Reportes'!

!TransferNet methodsFor: 'reporting' stamp: 'PMB 11/18/2022 11:48:48'!
reportData
	(transactions noneSatisfy: [ :aTransaction |
		aTransaction isKindOf: TransferLeg ]) ifTrue: [ ^ 'No hay transferencias registradas' ].
	transactions do: [ :aTransaction |
		aTransaction beAddedToDisplayDataOf: self ].
	dataToDisplay add: 'El neto de transferencias es de ' , netBalance amount asString , ' pesos'.
	^ self printToString: dataToDisplay.! !


!TransferNet methodsFor: 'private' stamp: 'PMB 11/18/2022 09:39:32'!
addDepositToDisplayData: aDeposit
	self addToBalance: 0 * peso.! !

!TransferNet methodsFor: 'private' stamp: 'PMB 11/18/2022 09:14:39'!
addTransferDepositToDisplayData: aTransferDeposit
	self addToBalance: aTransferDeposit value.! !

!TransferNet methodsFor: 'private' stamp: 'PMB 11/18/2022 09:14:58'!
addTransferWithdrawToDisplayData: aTransferWithdraw
	self substractFromBalance: aTransferWithdraw value.! !

!TransferNet methodsFor: 'private' stamp: 'PMB 11/18/2022 09:39:50'!
addWithdrawToDisplayData: aWithdraw
	^ self substractFromBalance: 0 * peso.! !
!classDefinition: #PortfolioTest category: 'ServiciosFinancieros2-Cuentas'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros2-Cuentas'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

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


!classDefinition: #TransferTest category: 'ServiciosFinancieros2-Cuentas'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros2-Cuentas'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'nil' stamp: 'l 11/17/2022 17:19:01'!
named: aName
	name := aName ! !


!Account methodsFor: 'reporting' stamp: 'PMB 11/17/2022 23:46:27'!
beAddedToDisplayDataOf: aReport tabbing: aNumberOfTabs 
	self subclassResponsibility.! !


!Account methodsFor: 'accessing' stamp: 'l 11/17/2022 17:22:15'!
name
	^name! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros2-Cuentas'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'nil' stamp: 'l 11/17/2022 17:09:17'!
named: aName
	^ self new named: aName.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros2-Cuentas'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'l 11/17/2022 17:26:43'!
accounts
	^ accounts .! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'l 11/17/2022 15:14:29'!
add: accountToAdd
	self assertCanAdd: accountToAdd.
	accounts add: accountToAdd.
	accountToAdd addedTo: self.! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:47:52'!
beAddedToDisplayDataOf: aReport tabbing: aNumberOfTabs
	aReport
		addPortfolioToDisplayData: self
		tabbing: aNumberOfTabs.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros2-Cuentas'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros2-Cuentas'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:45:28'!
beAddedToDisplayDataOf: aReport tabbing: aNumberOfTabs
	aReport addReceptiveAccountToDisplayData: self tabbing: aNumberOfTabs .! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros2-Cuentas'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:07:29'!
beAddedToDisplayDataOf: aTransactionReport
	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros2-Cuentas'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:09:10'!
beAddedToDisplayDataOf: aTransactionReport
	^ aTransactionReport addDepositToDisplayData: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros2-Cuentas'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros2-Cuentas'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:07:29'!
beAddedToDisplayDataOf: aTransactionReport
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros2-Cuentas'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros2-Cuentas'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:09:50'!
beAddedToDisplayDataOf: aTransactionReport
	^ aTransactionReport addTransferDepositToDisplayData: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros2-Cuentas'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:10:20'!
beAddedToDisplayDataOf: aTransactionReport
	^ aTransactionReport addTransferWithdrawToDisplayData: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros2-Cuentas'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'reporting' stamp: 'PMB 11/18/2022 09:11:29'!
beAddedToDisplayDataOf: aTransactionReport
	^ aTransactionReport addWithdrawToDisplayData: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros2-Cuentas'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros2-Cuentas'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Cuentas'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros2-Cuentas'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
