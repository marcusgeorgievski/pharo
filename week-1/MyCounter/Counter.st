Object subclass: #Counter
    instanceVariableNames: 'count'
    classVariableNames: ''
    package: 'MyCounter'

Counter>>initialize
    count := 0

Counter>>Set: anInteger
    count := anInteger

Counter>>increment
    count := count + 1

Counter>>decrement
    count := (count > 1)
        ifTrue: [count - 1]
        ifFalse: [0]

Counter>>reset
    count := 0

Counter>>count
    ^count

Counter class>>startingAt: anInteger
    ^self new count: anInteger

Counter>>printOn: aStream
    super printOn: aStream. "a Counter"
	aStream nextPutAll: ' withValue: ', count printString.
	aStream cr