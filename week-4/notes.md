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

## NOTE

The seaside lecture notes are not included here. I may come back to them later and create them in a separate dir.

The following two Live lectures are refactoring and quality checkers. I'll come back to this near the end as I focus on the language first, then tooling.

## W4 - LiveD

## W4 - LiveE
