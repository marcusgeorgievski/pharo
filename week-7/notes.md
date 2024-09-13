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

1. Every object is an instance of a class
2. Every class eventually inherits from `Object`
3. Every class is an instance of a metaclass
4. The metaclass hierarchy parallels the class hierarchy
5. Every metaclass inherits from `Class` up to `Behaviour`
6. Every metaclass is an instance of `Metaclass`
7. The metaclass of `Metaclass` is an instance of `Metaclass`

### Metaclass Hierarchy

```
   -------->    Behaviour      -->  Behaviour class         --|
   |               ^                                          v
   |        ClassDescriptions  -->  ClassDescription class -> Metaclass --> Metaclass class
   |               ^                                          ^
   |             Class      --->    Class class             --|
   |               ^
Object  ---> Object Class
```

`Object`

- Represents common behaviour of all objects
- error handling, halting, announcements

`Behaviour`

- Minimum state for objects that have instanes
- State:
  - superclass link, method dict, desc of instances
- Methods:
  - method dict, compiling method
  - instance creation
  - class hierarcyhy

`ClassDescription`

- Adds facilities to `Behaviour`
  - Named instance vars
  - Category instance variable
  - more, eh

`Class`

- Represents common behaviour of all classes
  - name, compilation, method storing, instance vars

`

## W7S4 - Reflective Operations for Live Programming

## W7S5 - `doesNotUnderstand`

- When no method is found
- `doesNotUnderstand:` is a message
- Every class can customize this hook
- Important hook for automatic delegation, distributed programming and many other usages
-

## W7S6 - Stack as an Object

## W7S7 - Avoid Null Checks

## W7S8 - Conclusion
