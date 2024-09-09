## W2S1 - Messages

- We only manipulate objects, we only send them messages, and we use closures

## W2S2 - Java to Messagse

### Collections

```java
// Java
ArrayList<String> strings = new ArrayList<>();
```

```py
"Pharo"
strings : OrderedCollection new.
```

### Thread

```java
// Java
new Thread(() -> this.doSomething()).start();
```

```py
"Pharo"
[self doSomething] fork
```

### Messages

```java
// Java
postman.send(mail, recipient)
```

```py
"Pharo"
postman send: mail to: recipient
```

### Loops

```py
"Pharo"
0 to: 100 by: 2 do: [:i | ... ]
aCollection do: [:each | ... ]
```

## W2S3 - Messages: Composition and Precedence

- Left to right
- `() > unary > binary > keywords`
- Mathematical precedence does not exist in Pharo

## W2S4 - Messages: Sequence and Cascade

- `.` is a separator. not a terminator
- No need to put one after the lst line
- `;` is a cascasde

```
Transcript cr.
Transcript show: 1.
```

is equivalent to:

```
Transcript
    cr;
    show: 1.
```

Good example:

```
| c |
c := OrderedCollection new
    add: 1;
    add: 2;
```

## W2S6 - Blocks

- Defined by `[]`
- Block arguments:
  - `[:x | ... ]`
  - `[:x | x + 2 ] value: 5` -> `7`
  - `[:x :y | x + y ] value: 2 value: 4` -> `6`
  - self = 0 ifTrue: [^1]
- Use 2 or 3 args max - better to use a class for more
- A block excapsulates only 1 computation

## W2S7 - Loops

- Expressed as messages

```
4 timesRepeat: [ ... ]
```

```
1 to: 100 do:
    [:i | ... ]
```

Basic iterators:

- `do` - iterate
- `collect` - iterate and collect results
- `select` - select matching elements
- `reject` - reject matching elements
- `detect` - get first element matching
- `includes` - test inclusion
- and more

```
#(1 2 3) do: [:each | Transcript show: i; cr]
```

```
[reciever condition] whileTrue: [ ... ]
[condition] whileTrue "will execute receiver until false"
```

## W2S8 - Booleans

- `true` and `false`, unique instance of `True` and `False`
- `&` `|` `not`
- `or:` `and:` `(lazy)`
- `xor`
- `ifTrue:ifFalse:`

### Eager and Lazy Logic Operators

```
false & (1 error: 'crazy')
> an error
```

- Argument `(1 error: 'crazy')` is executed because this is a non lazy operator

```
false and: [1 error: 'crazy']
> false
```

- Argument `[1 error: 'crazy']` is not executes because it is not necessary

Essentially, eager operators cause both sides of the operand to evaluate immediately which may result in an error.

## W2S9 - Parentheses vs Brackets

- `()` changes priority of execution
- `[]` defines blick, program is NOT executed
- Use `[Expressions]` when may not execute at all, or multiple times

## W2S10 - Yourself

```
Set new add: 2
> 2
```

- Why 2? Because `Set>>add: newObject` returns `newObject`

Can get around this with a variable:

```
| s |
s := Set new.
s add: 2.
s
```

or use the `yourself` method defined here:

```
Object>>yourself
    ^self
```

like this:

```
Set new
    add: 2;
    yourself.
```

Well wouldn't this still return `2` since that what the previous message appears to be? No, because the `;` operator is used, meaning the messages are applied to the main receiver, `Set new`.

## W2-LiveA - Finder

**Finder**: Selectors, classes, examples, pragmas, source

- For examples, pipe results with `.`: `#(2 4 6) . 3 . 2` which means, passing 3 to that array should result in 2 - wrap behaviour

## Review these Live sessions again later

## W2-LiveB - Inspector

`Raw`

- Actual implementation

## W2-LiveC - System Browser

System Browser: `package/class/protocol/method`

## W2-LiveD - Scoped Operations

The dropdown menu on each package are the tags. Classes can be organized by tags. For example:

Package: `AST-Core`
Tag: `Matching`

Class:

```
Object subclass: #Foo
    instanceVariablesNames: ''
    classVariablesNames: ''
    package: 'AST-Core-Matching'
```

## W2-REDO1 - Xtreme TDD

> DEBUGGING HERE
