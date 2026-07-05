# Genetic Algorithm Path Planning for Mobile Robots

## Overview

This project demonstrates mobile robot path planning using a Genetic Algorithm (GA) in MATLAB. The objective is to find an optimal collision-free path from a start position to a target position while avoiding obstacles in a 2D grid environment.

The algorithm evaluates candidate paths based on their total travel distance and applies a penalty to paths that intersect obstacles. The best path found is then visualized on the map.

---

## Features

- Genetic Algorithm (GA) based path optimization
- 2D grid environment
- Static rectangular obstacles
- Collision detection using a penalty-based fitness function
- Euclidean distance path optimization
- Automatic visualization of the optimized path
- Configurable GA parameters

---

## Technologies Used

- MATLAB
- Global Optimization Toolbox
- Genetic Algorithm (`ga`)

---

## Project Structure

```
Genetic-Algorithm-Path-Planning/
│
├── path_planning_ga.m
├── README.md
└── images/
    ├── environment.png
    └── result.png
```

---

## Environment

- Grid Size: **20 × 20**
- Start Position: **(2,2)**
- Target Position: **(18,18)**
- Four rectangular obstacles
- Five intermediate waypoints

---

## Genetic Algorithm Parameters

| Parameter | Value |
|-----------|------:|
| Population Size | 50 |
| Maximum Generations | 100 |
| Mutation Rate | 0.15 |
| Number of Waypoints | 5 |

---

## Working Principle

1. Generate an initial population of random paths.
2. Evaluate each path using the fitness function.
3. Calculate the total path length.
4. Apply obstacle collision penalties.
5. Perform selection, crossover, and mutation.
6. Repeat for multiple generations.
7. Display the best collision-free path.

---

## Fitness Function

The fitness function minimizes:

- Total Euclidean path length
- Obstacle collision penalties

Lower fitness values indicate better paths.

---

## Requirements

- MATLAB R2021a or later (recommended)
- Global Optimization Toolbox

**Note:** This project uses MATLAB's built-in `ga()` function from the Global Optimization Toolbox. The code will not run without this toolbox.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/your-username/genetic-algorithm-path-planning.git
```

Open `path_planning_ga.m` in MATLAB and run:

```matlab
path_planning_ga
```

---

## Output

The program displays:

- Genetic Algorithm optimization progress
- Best fitness value
- Optimized collision-free path
- 2D visualization including:
  - Start point
  - Target point
  - Obstacles
  - Optimized path

---

## Applications

- Autonomous Mobile Robots
- Robot Navigation
- Warehouse Automation
- Industrial Robotics
- Autonomous Vehicles
- Path Planning Research
- Intelligent Transportation Systems

---

## Future Improvements

- Dynamic obstacle avoidance
- 3D path planning
- Real-time robot navigation
- Multi-objective optimization
- Hybrid GA + A* algorithm
- ROS integration
- MATLAB App Designer GUI
- Real robot implementation

---

## Limitations

- Supports only static obstacles.
- Uses fixed intermediate waypoints.
- Requires MATLAB Global Optimization Toolbox.
- Performance depends on Genetic Algorithm parameter tuning.

---

## License

This project is licensed under the MIT License.

---

## Acknowledgments

- MathWorks for MATLAB and the Global Optimization Toolbox.
- Robotics and autonomous navigation research community.

---

## Author

**Batool Shahid**

If you found this project useful, consider giving it a ⭐ on GitHub.
