Class {
	#name : #BrFuturePolledSignal,
	#superclass : #ContextStackSignal,
	#instVars : [
		'queue',
		'worker',
		'pendingQueue'
	],
	#category : #'Brick-Core-Futures'
}

{ #category : #testing }
BrFuturePolledSignal class >> gtNormalOperationSignal [

	^ true
]

{ #category : #accessing }
BrFuturePolledSignal >> pendingQueue: aQueue [
	pendingQueue := aQueue
]

{ #category : #accessing }
BrFuturePolledSignal >> queue: aQueue [
	queue := aQueue
]

{ #category : #accessing }
BrFuturePolledSignal >> worker: aName [
	worker := aName
]