## W4S1 - Inheritance

- `Object` is the root of most classes
- `ProtoObject` (`Object`'s superclass) is for special purposes
- Extend state to superclass

Inheritance is:

- Static for state: when you create subclass, you know all instance vars
- Dynamic for behaviour: at runtime. When you send a message to a class, a method match is searched for in object hierarchy

## W4S2 - Inheritance and Lookup

Message sending is a two-step process:

1. Look up the method matching the message. Starts looking in class, then superclasses
2. Execute this method on receiver

- `self` represents receiver of message
- If a method in superclass executes a method, the lookup will start back at the receiver, not continue up

## W4S3 - Inheritance and Lookup: Super

- `super` starts the lookup in the class above it
- If a message is sent to `super`, lookup wil begin there
- `self` is dynamic, while `super` is static

## W4S4 - Inheritance and Lookup: doesNotUnderstand: aMessage

- If no method is found in hierachy, `doesNotUnderstand` is sent to receiver - DNU
- `doesNotUnderstand` in `Object` is executed. Method raises `MessageNotUnderstoodException`
- Each class can implement this method!

```
Node>>welcom
    [self sayHello]
    on: MessageNotUnderstood
    do: [ handle... ]
```

## W4S5 - Inheritance and Lookup: metaclasses

`aNode` -> `Node` -> [ `Object`, `Node class`]

^ timestamp `2:00`

- Message a class with `new` will lookup the method in its metaclass
-

## W4S6 - Class Methods at Work

- review this lecture later

```
Parser>>documentClasses
    ^ DocumentItem allSubclasses
        sorted: [:class1, :class2 | class 1 priority < class 2 priority]

Parser>>parse: line
    self documentClasses
        detect: [:subclass | (subclass canParse: aLine) ifTrue: [^ subclass newFromLine: line]]
```

## W4S7 - Pharo Web Stack

- Seaside, Teapot, Zinc, Garage, etc.

## W4S8 - Seaside Overview

- Define resusable and stateful components
- Components
  - Instance of subclass `WAComponent`
  - Rendered in HTML

## W4S9 - Rendering Components

## W4S10 - MetaData and REST

- Magritte
- Forms

## W4S11 - Voyage

### NoSQL

```
| repo |
repo := VOMongoRepository new.      -> prototyping -> VOMongoRepository new.
    host: 'localhost'
    database: 'demo'.
repository enableSingleton.
```

### Querying

```
Obj selectAll.
Obj selectOne: [:each | each name = 'foo'].
Obj selectMany: [:each | each name = 'foo'].

Obj selectOne: {#name -> 'foo'} asDictionary.

Obj
    selectMany: {#name -> 'foo'} asDictionary
    sortBy: {#name -> VOOrdering ascending}
    limit: 10
    offset 0.
```
