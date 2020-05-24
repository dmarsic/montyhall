# Introduction

This program simulates Monty Hall problem: https://en.wikipedia.org/wiki/Monty_Hall_problem.

The candidate has a choice of three doors, one with a car and two with goats. The candidate chooses a door, at which time the host opens one of the other two doors and asks the candidate if they want to switch their choice.

This is a probability problem that demonstrates that switching the door has a better outcome:

* If the candidate doesn't switch the door, their success rate is 1/3.
* If the candidate switches, their success rate is 1/2.

# Run

The simulation program is written in [Julia](https://julialang.org/) to allow me experiment with this language.

## Candidate doesn't switch the door

Runs 10,000 iterations without switching doors. The success rate is around 1/3 (33%).

```
$ julia montyhall.jl
Running Monty hall with doors: [1, 2, 3] for 10000 times.
Candidate switches doors: false. Success rate: 33.06
```

## Candidate switches the door

Runs 10,000 iterations with switching doors. The success rate is around 1/2 (50%).

```
julia montyhall.jl --switch
Running Monty hall with doors: [1, 2, 3] for 10000 times.
Candidate switches doors: true. Success rate: 49.73
```

## Command-line options

```
-d, --doors DOORS     How many doors for Monty Hall problem. (type:
                      Int64, default: 3)
-n, --iterations ITERATIONS
                      How many iterations to run (type: Int64,
                      default: 10000)
-s, --switch          The candidate switches doors when this option
                      is set.
```

# Licence

GNU v3. See LICENSE.

# Author

Domagoj Marsic, 2020
Contact: dmars+github@protonmail.com
