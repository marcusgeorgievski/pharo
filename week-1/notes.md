## W1S2 - Vision

- Methods are public virtual
- Attributes are protected
- Singel inheritance

## W1S4 - Object Model

**Objects**: numbers, files, fonts, collections, everything
**Messages**: request made to object

- All computations between objects are done via message passing
- The term **sending a message** is used because:
  - Methods are looked up dynamically
  - Only late bindings, only virutal calls
- Only one method lookup for all objects

### Object Models

- Instance variables: Protected - private to object, accessible to subclasses
- Methods are public and virtually bound
- Single inheritance
- No constructors, static methods, type declarations, interfaces, modifiers, etc.

## W1S5 - Syntax

Essence of Pharo:

- Objects
- Messages
- Blocks

### Syntax

```
comment         "hi"
character       $a
string          'hi'
symbol          #hi
literal array   #(1 2 3)
int             1, 2r101
real            1.5, 2e7
boolean         true, false
undefined       nil
point           10@200 x@y
;               cascade, multiline message
```

### Constructs

```
Temp var declaration    | var |
Variable assignment     var := value
separator               message . message
Return                  ^expression
Block                   [:x | x+2 ]
```

### Messaegs

- Unary
- Binary
- Keyword

#### Unary - `receiver selector`

```
9 squared
Date today
```

#### Binary - `receiver selector argument`

```
1+2
3@4
```

#### Keywords - `receiver key1: arg1 key2: arg2`

```
2 beween: 10 and: 20    "2 is the object that between:and: is acting on"
```

Precedence: (msg) > unary > binary > keywords

### Conditionals, Loops

```
condition: ifTrue [code]
```

```
1 to: 4 do: [:i | Transcript << i]
```

### Blocks

- Something inside square brackets
- Can be passed as method args, stored in vars, returned

```
fn := [:x | x + 3]
fn value: 2
```

### Class Definition

```
Object subclass: #Point
    instanceVariableNames: 'x y'
    classVariableNames: ''
    package 'Kernel-BasicObjects'
```

### Methods

- Public, virtual (lookup ar runtime)
- Return `self` by default

## W1S6 - Class and Method Definitions

- No dedicated syntax, created with tools

### Class Definition

```
Object subclass: #Point
    instanceVariableNames: 'x y'
    classVariableNames: ''
    package 'Kernel-BasicObjects'
```

### Method

```py
Integer >> factorial
  "Answer the factorial of receiver"

  self = 0 ifTrue: [^1].
  self > 0 ifTrue: [^self * (self - 1) factorial].
  self error: 'Not valid for negative integers'.
```

### Class Method

```py
Integer class >> x: xInt y: yInt
  ^self basicNew setX: xInt setY: yInt
```

- Class defined by sending msg to superclass
- Classes are defined inside packages
- Methods are public
- Method returns receiver `self` by default
