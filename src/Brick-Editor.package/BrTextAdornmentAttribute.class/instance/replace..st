accessing
replace: aBrText
	"Return a collection of objects (may be empty) that should replace a provided text piece"
	<return: #SequenceableCollection of: #BlElement>

	^ self subclassResponsibility