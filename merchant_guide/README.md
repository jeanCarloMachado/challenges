# Considerations


From the given problems I picked this one for the following motives. The
first one I had some problems to interpret it's requirements and
it would take more time to finish since I would have to clarify them with you.
The second one was no-deterministic probably NP-complete, so a proper
solution would involve some sort of meta-heuristics that seemed too much
to tackle on a challenge (and its harder to test).

I don't have much experience with ruby, but since I discovered
it it's been my first option for generic Web development and fits
well with kind of no-performance dependent problems.

I used an imperative OO style to develop the solution.
All the requirements we're developed using TDD.

Some of the things I didn't spend much effort:
- Performance
- Build tools
- Autoloader
- Security

Some of the concerns I kept in mind while developing:
- readability
- semantic implementation of the requirements
- inversion of dependencies
- simple public interfaces
- encapsulation
- expressive variable names
- KISS

Some of the things I would improve:
- build more expressive error messages, some don't express with
  sufficient details where the problem is happening and why
- There's some duplicated rules mainly in regex's that could be
  centralized
- break some functions like instruct and question in even smaller
  parts
- maybe use more of a declarative programming style, this is the
  kind of problem that would be solved nicely in a more
  functional, combinatorial way
- a tokenizer would be a nice thing to use in this problem, even
  more if harder phrases were required


In resume, there's a lot room for improvement here. But clean code
is much more about honesty than perfection. I don't use
the refactoring part of the TDD cycle all the time but when you
take the other parts seriously the result tends to be good enough.

To understand more about my concerns while developing one can see my
talk about Clean Code
[here](https://github.com/jeanCarloMachado/talks/blob/master/clean-codev2/presentation.pdf).

## Usage

```
ruby main.rb input.txt
```

Where the input.txt file follows the given pattern:

```
glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck
wood ?
```

And the output will be:

```
pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about
```

## Tests

To run the whole suite:

```
ruby ts_all_the_tests.rb

```
