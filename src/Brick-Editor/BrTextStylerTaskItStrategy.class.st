"
I am a text styler strategy used by ${class:BrTextEditor}$.
I style a text in a TaskIt background process using ${class:BlTktWorkerProvider}$.

See ${class:BrTextStylerStrategy}$ for futher explanation.

Example: ${example:BrTextStylerExamples>>#editorWithTaskItStylerStrategy|codeExpanded=false|previewExpanded=true}$


"
Class {
	#name : #BrTextStylerTaskItStrategy,
	#superclass : #BrTextStylerCommonAsyncStrategy,
	#instVars : [
		'command'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #private }
BrTextStylerTaskItStrategy >> commandNameFromText: aBrText [
	^ aBrText isEmpty
		ifTrue: [ '<empty query>' ]
		ifFalse: [ (aBrText from: 1 to: (aBrText size min: 20)) asString
				replace: [ :eachCharacter | 
					eachCharacter isLineBreak
						ifTrue: [ Character space ]
						ifFalse: [ eachCharacter ] ] ]
]

{ #category : #styling }
BrTextStylerTaskItStrategy >> style: aBlText afterDo: aBlock [
	self view ifNil: [ 
		"A graphical widget is not available, we therefore do not need to style the text"
		^ self ].
	monitor critical: [ 
		| aName |
		self terminateBackgroundStylingProcess.
		aName := self commandNameFromText: aBlText.
		command := [ self doStyle: aBlText afterDo: aBlock ] asBlTktTerminableCommand.
		command name: 'Text Styler for ''' , aName , ''''.
		BlTktWorkerProvider highUICPUBoundPool schedule: command ]
]

{ #category : #private }
BrTextStylerTaskItStrategy >> terminateBackgroundStylingProcess [
	"Must be called within monitor critical code"
	command ifNotNil: [ :aCommand |
		aCommand terminate.
		command := nil ]
]