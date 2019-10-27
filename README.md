# Warehouse

## Running

I created a very simple mix task to run the program. It has
a recurisve `solve/1` function so I can solve each pair of
inputs given independently and handle cases where no inputs
are given, or an odd number of inputs are given.

```bash
mix warehouse_id
```

## Discussion

This was a very interesting problem to work on. Having recently
graduated from school, I recognized the triangular sequence of
numbers that follows the base of the warehouse triangle. My
solution works based off of that by getting the x-th triangular
number, then figuring out what we need to do to go up y levels
to come up with the ID we needed.

Because I've worked with triangular numbers before, the recursive
and more efficient triangular formla solutions were easy to come
up with. You'll find them as `triangular_number/2` and
`fast_triangular_number/1` in the code. From there, I just needed
to figure out a recursive function, which I called `upward_sum/2`
that is very similar to a recursive triangular sum, but starts at a
particular base and starts the incrementer at its own base as well.
From there, it's easy to find the offset that I need, add it to the
triangular number, and out comes the solution to the problem. I'm
sure that a more efficient solution to `upward_sum/2` exists because
it's a very simple summation, but I couldn't come up with its
closed-form solution on my own. Also, the instructions say to
prefer recursion, so I didn't dig too far into finding a
non-recursive way of solving that part of it.

Once I solved the problem, I was able to identify that the bad test
case was `[100000,100000] = 20,000,000,001`. The correct answer should
have been `19_999_800_001`.

I solved the stretch goal by simply guessing numbers for x, checking
if they're correct, and continuing to guess. Of course, the naive
way of doing this (guessing that x is 1, then 2, then 3, and so on) is
incredibly slow. I took advantage of the fact that the maximum x
coordinate is 100,000 and implemented a binary search for the number.
So, first we'll guess 50,000. If our number is less than that, we'll
guess 25,000, then 12,5000 if we're still lower, and so on until we
reach the number. That way we only have to do ln(n) guesses, rather
than n guesses. The answer to the specific stretch goal question
came out to 13,457.
