## W7S1 - Advanced Points on Classes

- `classVariableNames` use for 'static' state
- Shared amongst all classes and subclasses
- Start with capital letters

**Access**

- Instance variables are private to the class, and can only be acces through class methods
- Class variables are shared amongst all instances of the class and subclass

**Singleton**

Intent is to enforce a class has only one instance

With instance variable:

```
WebServer class
    instanceVariableNames: 'uniqueInstance'

WebServer class>>new
    self error: 'Cannot create new isntance'

WebServer class>>uniqueInstance
    ^ uniqueIntance
    ifNil: [ uniqueInstance := super new ]
```

With class variable:

```
WebServer class
    classVariableNames: 'UniqueInstance'

WebServer class>>new
    self error: 'Cannot create new isntance'

WebServer class>>uniqueInstance
    ^ UniqueIntance
    ifNil: [ UniqueInstance := super new ]
```

## W7S2 - Variable Size Object

```
ArrayedCollection variableSubclass: #Array
    ...
```

```
Array new:max
Array at:put:
```

- `variableSubclass`
- `variableByteSublass`
- `variableWordSublass`

## W7S3 - Understanding Metaclasses

## W7S4 - Reflective Operations for Live Programming

## W7S5 - `doesNotUnderstand`

## W7S6 - Stack as an Object

## W7S7 - Avoid Null Checks

## W7S8 - Conclusion
