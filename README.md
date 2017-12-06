# Primes

Allows you to input a number, `n`, and prints out a multiplication table with
`n` prime numbers.

## How to run

Ensure you have [Elixir installed](http://elixir-lang.github.io/install.html).

Run the following commands, where `n` is a positive integer.

```
git clone https://github.com/katbow/primes-test.git
cd primes-test
mix escript.build
./table n [--table table_type] [--operation operation_type]
```

The option for `--table` can be `primes` or `increment`. If no option is given or
a different value is given for this, it defaults to `primes`.

The option for `--operation` can be `multiply`, `sum`, `subtract`, `divide`. If
no option is given or a value different from those listed is given, the default
is `multiply`.

## Testing

Tests can be run with `mix test` when in the `primes-test` directory.

## What I'm pleased with

I was pleased with the process I took while completing the problem. If I was
unsure of where to go next, I would take time to either branch off & "hack"
then delete the branch, or I would re-examine the Sieve I was attempting to
use for better understanding.

## What I would do if I had more time

* Improve on the speed of the algorithm.
  * I was going about the `remove_multiples/4` function the wrong way because
  it is iterating over numbers that are already crossed off by previous prime
  numbers, and because I (attempt to) delete an item from the list on each step,
  which is an expensive operation.
