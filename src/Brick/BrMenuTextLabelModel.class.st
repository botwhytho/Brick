Class {
	#name : #BrMenuTextLabelModel,
	#superclass : #Object,
	#instVars : [
		'text',
		'shortcut',
		'preview'
	],
	#category : #'Brick-Menu - Model'
}

{ #category : #'api - converting' }
BrMenuTextLabelModel >> asElement [
	^ BrMenuTextLabelElement new labelModel: self
]

{ #category : #'gt - extensions' }
BrMenuTextLabelModel >> gtItemLabel [
	| aText |
	aText := self text asString asRopedText.
	
	self preview ifNotNil: [ :aString | 
		aText appendString: ' '.
		aText append: (aString asRopedText foreground: BrGlamorousColors disabledButtonTextColor)
	].
	
	self shortcut ifNotNil: [ :aString | 
		aText append: ((' [', aString, ']') asRopedText foreground: BrGlamorousColors defaultButtonTextColor)
	].
	
	^ aText
]

{ #category : #accessing }
BrMenuTextLabelModel >> preview [
	<return: #String>
	^ preview
]

{ #category : #accessing }
BrMenuTextLabelModel >> preview: aString [
	preview := aString
]

{ #category : #accessing }
BrMenuTextLabelModel >> previewDo: aBlock [
	self preview ifNotNil: aBlock
]

{ #category : #printing }
BrMenuTextLabelModel >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self text asString.
	self preview
		ifNotNil: [ :aString | 
			aStream
				space;
				nextPutAll: self preview asString ].
	self shortcut
		ifNotNil: [ :aString | 
			aStream
				nextPutAll: ' [';
				nextPutAll: self shortcut asString;
				nextPut: $] ].

	aStream nextPut: $)
]

{ #category : #accessing }
BrMenuTextLabelModel >> shortcut [
	<return: #String>
	^ shortcut
]

{ #category : #accessing }
BrMenuTextLabelModel >> shortcut: aString [
	shortcut := aString
]

{ #category : #accessing }
BrMenuTextLabelModel >> shortcutDo: aBlock [
	self shortcut ifNotNil: aBlock
]

{ #category : #accessing }
BrMenuTextLabelModel >> text [
	<return: #String>
	^ text
]

{ #category : #accessing }
BrMenuTextLabelModel >> text: aString [
	text := aString
]

{ #category : #accessing }
BrMenuTextLabelModel >> textAndPreviewDo: aBlock [
	self text ifNotNil: [ :aText | 
		| aFormatedText |
		aFormatedText := aText asRopedText glamorousRegularFont.
		self previewDo: [ :aPreview | 
			aFormatedText append: ((' ' , aPreview asString) asRopedText
				glamorousCodeFont;
				foreground: Color gray;
				glamorousCodeTinySize) ].
		aBlock cull: aFormatedText ]
]

{ #category : #accessing }
BrMenuTextLabelModel >> textDo: aBlock [
	self text ifNotNil: aBlock
]