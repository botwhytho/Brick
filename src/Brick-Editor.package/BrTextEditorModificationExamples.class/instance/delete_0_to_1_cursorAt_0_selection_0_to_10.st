examples - deletion
delete_0_to_1_cursorAt_0_selection_0_to_10
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor moveCursorTo: 0.
	anEditor select: 0 to: 10.
	
	anEditor deleter
		from: 0 to: 1;
		delete.

	self assert: anEditor text asString equals: (self multilineText from: 2 to: self multilineText size) asString.
	self assert: anEditor cursor position equals: 0.
	self assert: anEditor selection equals: (BlCompositeSelection new select: 0 to: 9).

	^ anEditor