text - modifications
insertString: aString at: aTextIndex
	| aCommand |
	
	aCommand := self newInsertStringCommand
		string: aString;
		index: aTextIndex.
	self enqueueCommand: aCommand.
	
	self styler styleInBackgroundProcess: self text copy