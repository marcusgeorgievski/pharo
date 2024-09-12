## W6S1 - Understanding Super

```
Object  --->    Object class
  ^
  |
Dice    --->    Dice class
```

## W6S2 - Understanding ifTrue:ifFalse:

- Heavily optimized by compiler
- Remember, let the receiver decide

```
True>>ifTrue: aTrueValue ifFalse: ifFalseValue
    ^ aTrueValue.

False>>ifTrue: aTrueValue ifFalse: ifFalseValue
    ^ aFalseValue.
```

## W6S3 - Dice new vs self class new

```
DiceHandle + DiceHandle

DiceHandle>>+ aDiceHandle
    | handle |
    handle := DiceHandle new.
    self dice do: [:each | handle addDice: each].
    aDiceHandle dice do: [:each | handle addDice: each].
    ^ handle
```

```
DiceHandle>>+ aDiceHandle
    | handle |
    handle := DiceHandle new.

vs

DiceHandle>>+ aDiceHandle
    | handle |
    handle := self class new.
```

- `self class new` ensures you return an instance of receiver: an instance of the potential subclass

## W6S4 - Message Sends are Plans for Reuse

- Message send keads to a choice
- Class hierarchy defines the choices
- self always represents the receiver
- method lookup starts in class of receiver

## W6S5 - Hooks and Templates

- Sending a message in a class defines a hook: the chance to change behaviour

## W6S6 - Runtime Architecture

## W6S7 - Characters, Strings, and Symbols

**Characterss**

- Characters start with `$`
- Unprintable: `space` `tab` `cr`

**Strings**

- Collection of characters
- Single quite delimited `'`
- Methods such as `size`, split on char, `asString`
- Concatente with `,`

```
String streamContents: [:s |
    s
        nextPutAll: 'Hello';
        nextPutAll: ' ';
        nextPutAll: 'World'
    ]
```

**Symboles**

- Start with `#`
- unique in system, same instance `#hi ==#hi` is true

## W6S8 - Dynamic vs Literal Arrays

Dynamic array

```
|array|
array := (Array new: 2).
array
    at 1: put 10 @ 10;
    at 2: put (Point x: 2 y: 5)
array
```

can be simplified with `{}` separated by `.`

```
{(10 @ 10).(Point x: 2 y: 5)}
```

- `()` creates nested arrays inside of literal arrays
