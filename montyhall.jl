#------------------------------------------------------------------------------
# montyhall - Simulation of Monty Hall problem
# Copyright (C) 2020  Domagoj Marsic
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Contact:
# https://github.com/dmarsic
# <dmars+github@protonmail.com>
#------------------------------------------------------------------------------

using Printf
using Logging
using ArgParse

logger = Logging.SimpleLogger(stdout, Logging.Warn)
global_logger(logger)

function parseCommandLineArgs()
    s = ArgParseSettings()
    @add_arg_table! s begin
        "--doors", "-d"
            help = "How many doors for Monty Hall problem."
            arg_type = Int
            default = 3
        "--iterations", "-n"
            help = "How many iterations to run"
            arg_type = Int
            default = 10000
        "--switch", "-s"
            help = "The candidate switches doors when this option is set."
            action = :store_true
    end
    return parse_args(s)
end

function montyHall(doors, choice, switch)
    car = rand(doors)
    @info "Car is behind door $car"
    goats = filter(x -> x != car, doors)
    opens = rand(filter(x -> x != choice, goats))
    @info "Candidate chose door $choice, Monty Hall opens door $opens"
    switchDoor = rand(filter(x -> x != opens && x != choice, doors))
    if switch
        choice = switchDoor
        @info "Candidate switches! New choice is door $choice."
    else
        @info "Candidate sticks with door $choice."
    end
    return choice == car
end

function loopMonty(doors, attempts, candidateSwitches)
    println("Running Monty hall with doors: $doors for $attempts times.")
    hits = 0
    for i in 1:attempts
        hit = montyHall(doors, rand(doors), candidateSwitches)
        @info "Hit: $hit"
        hits += hit
    end
    successRate = hits / attempts * 100
    @printf("Candidate switches doors: %s. Success rate: %.2f\n",
        candidateSwitches, successRate)
end

args = parseCommandLineArgs()
doors = collect(1:args["doors"])
loopMonty(doors, args["iterations"], args["switch"])
