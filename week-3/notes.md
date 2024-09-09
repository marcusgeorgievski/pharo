## W3S1 - Dispatch: Boolean Example

```
Boolean>>not
    ^self subclassResponsibility

Boolean>>| aBoolean
    ^self subclassResponsibility

True>>not
    ^false

False>>not
    ^true

True>>| aBoolean
    ^true

False>>| aBoolean
    ^aBoolean
```

No conditionals used! Do not ask, tell.

## W3S2 - Dispatch

- Let receiver decide
- Message acts as case statement
- Case statement is dynamic, depends on objects to which message is sent

- Classes play the role of branches or choices. A class represents a case.
- Express as hierachy instead of large classes
- Focus on one class, not so many conditionals
- Put together = good quality OOP
- No conditions, give orders

## W3S3 - Variables

- Local variables start with lowercase - temps, instance, variables, args
- shared variables start with uppercase - class, class vars

Special variables

- `true`
- `false`
- `nil` - unique instance of `UndefinedObject`
- `self` - current receiver
- `super` - refers to receiver, but method lookup starts in superclass
- `thisContext` - refers to current execution stack

## W3S4 - Simple HTTP App

- Teapot
- Zinc

## W3S6 - Class Methods

```
Date today
```

- Implemented on the class side, not instance side

```
Coutner class>>withValue: anInteger
    self new
        value: anInteger;
        yourself
```

- Most class side methods create new instances
- To create, press `class` button

## W3S7 - Essential Collections

- First index at 1
- Can contain any object

### Collections

- `OrderedCollection` - dynamically growing
- `Array` - fixed size, direct access
- `Set` - no duplicates
- `Dictionary` - kv pairs, map
- `#(1 'a' 4)` is just a literal array instance

### Common API

- Creation
- Accessing
- Testing
- Adding
- Removing
- Enumerating
- Converting

```
Array new: 2
> #(nil nil)

OrderedCollection withAll: #(1 2 3)
> #(1 2 3)

Array new: 2 withAll: 'a'
> #('a', 'a')

| dict |
dict := Dictionary new.
dict
    at: #key put: value
```

## W3S9 - Iterators

- Supports polymorphic code
- All collections support them
- Enforce encapsulation of collections and containers

```
strings := persons collect: [:person | person name]

#(1 -3 -5) collect: [:each | each abs]
> #(1 3 5)
```

`collect:`

- evaluates block for each element (using `value:`)
- Returns new collection with all results

Basic Iterators

`do`
`collect`
`select`
`reject`
`detect`
`includes`

No block needed with unary messages, the following returns the same result:

```
#(1 2) select: [:i | i odd]
#(1 2) select: #odd
```

Powerful Iterators

`anySatisfy:` -
`allSatisfy:` -
`reverseDo:` -
`doWithIndex:` -
`pairsDo:` -
`PermutationsDo:` -
`flatCollect:` -

Iterate two structures

```
#(1 2 3)
    with: #(2 2 2)
    do: [:x :y | x * y]
```

Grouping Elements

```
#(1 2 3 4) groupedBy: #even
> a PluggableDictionary(false->#(1 3) true->#(2 4))
```

## W3S10 - Stream Overview

- An object that enables itartion of a collection
- Keep current position in memory
- Can read and write to colletions, files, and networks
- Can help create new collections

Creating

```
anObject readStram
anObject writeStream
Collection streamContents: [:stream | ... ]
(Read/Write)Stream on: aCollection
```

Reading elements

```
next
upTo: anObject
upToEnd
```

Writing elements

```
nextPut: anElement
nextPutAll: aCollection
```

Example

Reading

```
|stream|
stream := #(1 2 3 4 5 6) readStream.

stream next.
> 1

stream upTo: 4  "4 is consumed by the stream"
> #(2 3)

stream position
> 4

stream upToEnd
> #(5 6)
```

Writing

```
stream := (Array new: 6) writeStream.

stream nextPut: 1.
> #(1)

stream nextPutAll: #(2 3 4).
stream contents.
> #(1 2 3 4)
```

Writing to a file

```
stream := 'hello.txt' asFileReference writeStream.  "ref to file"
stream nextPutAll: 'Hello Pharo'.                   "file created to written"
stream close.
```

Reading to a file

```
stream := 'hello.txt' asFileReference readStream.
stream next.
? $H

stream upToEnd.
>'ello Pharo'
```

Creating collection from stream

```
stream := OrderedCollection new writeStream.
stream nextPut: 1.
stream contents
> #(1)

equivalent to

OrderedCollection
    streamContents: [:stream | stream nextPut: 1]
```

## W3S11 - Return

- Methods
  - Returns self by default
  - `^`
- Block
  - Returns result of its last expression
  - `^` will also terminate the method defining the block

## W3 - LiveA - Implementors / Senders

- Implementors: all the different classes that implement a certain method name
- Senders: all the classes/method that call a certain method
- Right click on a method and select one of the options

## W3 - LiveB - Class References

- Right click on calls, fo to refs
- Find all references to a class name in other methods

## W3 - LiveC - Find info using Spotter

- tools/spotter
- Find classes

## Die Assignment

- W3 - Redo 1 - Implementing Die Mechanics
- W3 - Redo 2
- W3 - Redo 3
