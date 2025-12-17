# Toy Robot Movement Simulation

## Overview
This project implements the **Toy Robot Coding Challenge**, a command-line simulation of a toy robot moving on a **5×5 tabletop**.

The application processes a sequence of commands and ensures the robot never falls off the table.  
The solution is implemented in **Ruby** and designed with a clear separation of concerns to make the logic easy to understand, test, and extend.

---

## Problem Description (Original Directions)

The application is a simulation of a toy robot moving on a square tabletop, of dimensions **5 units × 5 units**.

- There are no obstructions on the table surface.
- The robot is free to roam around the surface of the table but must be prevented from falling.
- Any movement that would result in the robot falling from the table must be ignored.
- Valid movement commands after an invalid move should still be processed.

---

## Supported Commands
| Command | Description |
|-------|-------------|
| PLACE X,Y,F | Place the robot at position (X,Y) facing F |
| MOVE | Move one unit forward |
| LEFT | Rotate 90° left |
| RIGHT | Rotate 90° right |
| REPORT | Output current position |


### Command Rules

- **PLACE** puts the robot on the table at position `(X,Y)` facing `NORTH`, `SOUTH`, `EAST`, or `WEST`
- `(0,0)` is considered the **south-west corner** of the table
- The first valid command must be `PLACE`
- All other commands are ignored until a valid `PLACE` is executed
- **MOVE** moves the robot one unit forward in the direction it is facing
- **LEFT** and **RIGHT** rotate the robot 90 degrees without changing position
- **REPORT** outputs the robot’s current `X,Y,F`
- A robot not placed on the table ignores all commands except `PLACE`

---

## Input

- Commands may be provided via **standard input** or **file input**
- The developer may choose the input method

---

## Constraints

- The robot must never fall off the table
- Invalid moves (including invalid placement) are ignored

---
