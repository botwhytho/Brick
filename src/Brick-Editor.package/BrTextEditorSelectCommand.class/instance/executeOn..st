executing
executeOn: aTextEditor

	aTextEditor selection select: self fromIndex to: self toIndex.
	aTextEditor update: self fromIndex to: self toIndex