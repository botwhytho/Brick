Class {
	#name : #BrMenuTextLabelElement,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'labelModel',
		'labelElement',
		'shortcutElement',
		'shortcutLabel'
	],
	#category : #'Brick-Menu - UI'
}

{ #category : #initialization }
BrMenuTextLabelElement >> initialize [
	super initialize.
	self
		hMatchParent;
		vFitContent;
		constraintsDo: [ :c | 
			c linear vertical alignCenter ].
	self initializeLabelElement.
	self initializeShortcutElement.
	self addChild: labelElement as: #'menu--label'.
	self addChild: shortcutElement as: #'menu--shortcut'
]

{ #category : #initialization }
BrMenuTextLabelElement >> initializeLabelElement [
	labelElement := BrLabel new
			hMatchParent;
			vFitContent;
			constraintsDo: [ :c | 
				c linear vertical alignCenter ];
			text: '';
			aptitude: BrGlamorousLabelAptitude new
]

{ #category : #initialization }
BrMenuTextLabelElement >> initializeShortcutElement [
	shortcutLabel := BrLabel new
			fitContent;
			text: '';
			beSmallSize;
			aptitude: (BrGlamorousLabelAptitude new
					foreground: BrGlamorousColors disabledButtonTextColor;
					glamorousCodeMiniSize).

	shortcutElement := BrFrame new
			fitContent;
			constraintsDo: [ :c | c linear vertical alignCenter ];
			geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
			border: (BlBorder paint: BrGlamorousColors disabledButtonTextColor width: 1);
			addChild: shortcutLabel;
			visibility: BlVisibility gone;
			margin: (BlInsets left: 10)
]

{ #category : #accessing }
BrMenuTextLabelElement >> labelModel [
	^ labelModel
]

{ #category : #accessing }
BrMenuTextLabelElement >> labelModel: aBrMenuTextLabelModel [
	labelModel == aBrMenuTextLabelModel ifTrue: [ ^ self ].

	labelModel := aBrMenuTextLabelModel.
	self onLabelModelChanged.
]

{ #category : #'private - updating' }
BrMenuTextLabelElement >> labelText [
	| aFormatedText |
	aFormatedText := nil.
	self labelModel textDo: [ :aText | 
		aFormatedText := aText asRopedText glamorousRegularFont.
		self labelModel previewDo: [ :aPreview | 
		aFormatedText append: ((' ' , aPreview asString) asRopedText
			glamorousCodeFont;
			foreground: Color gray;
			glamorousCodeTinySize) ] ].
	^ aFormatedText ifNil: [ '' ]
]

{ #category : #'event handling' }
BrMenuTextLabelElement >> onLabelModelChanged [
	self updateElement
]

{ #category : #'private - updating' }
BrMenuTextLabelElement >> updateElement [
	self updateLabelElement.
	self updateShortcutElement.
]

{ #category : #'private - updating' }
BrMenuTextLabelElement >> updateLabelElement [
	labelElement text: self labelText.
]

{ #category : #'private - updating' }
BrMenuTextLabelElement >> updateShortcutElement [
	self labelModel shortcutDo: [ :aText | 
		shortcutElement visibility: BlVisibility visible.
		shortcutLabel text: aText.
		^ self ].
	shortcutElement visibility: BlVisibility gone.
	shortcutLabel text: ''.
]