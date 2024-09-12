## W5S1 - Seaside: Composing Components

## W5S2 - Understanding Class Methods

- Loopup algorithm works for both instance and class methods
- The class methods exist in the metaclass, such as `Counter class`. This is why we can invoke something like `Counter withValue:`
- A metaclass is jsut a class whose instances are classes
- Metaclasses are automatically created

## W5S3 - Common Errors

- missing `.`
- Don't heitate to use parentheses when using multiple keyword messages
- `true`, not `True`
- Check carets `^`
- Check `yourself`
- Use debugger!

## W5S4 - Powerful Exceptions

Installing a handler

```
[ doSomething ] on: ExceptionClass do: [:ex | ... ]
```

Raising and exceptions

```
anException signal
```

Example

```
[x / y]
    on: ZeroDivide
    do: [:ex | Transcript show: ex description; cr. 0]
```

Testing

```
self
    shouldnt: [Date nameOfMonth: 2]
    raise: SubscriptOutOfBounds.

self
    should: [Date nameOfMonth: 13]
    raise: SubscriptOutOfBounds.
```

Kinds

- `Error` - all errors
- `Halt` - to stop execution and ger a debugger
- `Notification` - non fatal
- `UnhandledError` - untrapped error

Helpers

- `ensure` - ensures expression is always executed, even if program fails
- `onProblem` - ensure expression executes if something fails

Handling

- Return - `return:`
- Retry - `retryUsing:`
- Resume - `resume:`
- Pass - `pass`
- Resignal - `resignameAs:`

## W5S5 - Debugging

## W5S6 - SUnit: Unit Tests

## W5S7 - Files

## W5 LiveA - Advanced Spotter Actions

## W5 LiveB - Debugger Options

## W5 LiveC - Find a Bug with the Debugger
