examples - deletion
deleteWhenCursorIsInside
	<gtExample>
	| anEditor aCursor |

	anEditor := self editorOnHelloWorld.
	aCursor := self singleCursor.

	aCursor position: 3.
	aCursor delete: 2 to: 4 in: anEditor.

	self assert: anEditor text asString equals: 'Heo world'.
	self assert: aCursor position equals: 2.

	^ anEditor