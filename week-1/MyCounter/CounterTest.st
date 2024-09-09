TestCase subclass: #CounterTest
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'MyCounter'

CounterTest>>testSetCount
    | counter |
    counter := Counter new.
    counter count: 5.
    self assert: counter count equals: 5.

CounterTest>>testIncrement
    | counter |
    counter := Counter new.
    self assert: counter count equals: 0.
    counter increment.
    self assert: counter count equals: 1.
    counter increment.
    self assert: counter count equals: 2.

CounterTest>>testDecrement
    | counter |
    counter := Counter new.
    self assert: counter count equals: 0.
    counter increment.
    self assert: counter count equals: 1.
    counter decrement decrement decrement.
    self assert: counter count equals: 0.

CounterTest>>testStartAt5
    | counter |
    counter := Counter startingAt: 5.
    self assert: counter count equals: 5.

CounterTest>>testStartingAt5Increment
    | counter |
    counter := Counter startingAt: 5.
    counter increment.
    self assert: counter count equals: 6.