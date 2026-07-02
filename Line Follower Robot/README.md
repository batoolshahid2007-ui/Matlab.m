#  Autonomous Line Follower Robot (Logic Simulation)

This project simulates the core motor control logic for an autonomous Line Follower Robot using Python. It mimics how an Arduino micro-controller processes sensor data to drive dual DC motors using digital and analog (PWM) signals.


##  How It Works (Easy Explanation)

The robot decides its movement based on speed values. The script dynamically converts speed numbers into directional signals (`HIGH`/`LOW`) and speed intensities (`0-255`) for the motor driver:

1. **Direction Control (`digitalWrite`):** * If speed is positive (`> 0`), Pin 1 goes **HIGH** and Pin 2 goes **LOW** (Motor moves Forward).
   * If speed is negative (`< 0`), Pin 1 goes **LOW** and Pin 2 goes **HIGH** (Motor moves Backward).
2. **Speed Control (`analogWrite`):** * Uses Pulse Width Modulation (PWM) via `abs()` to send the absolute speed value to the enable pins, controlling how fast the wheels spin.

---

##  Pin Mapping (According to Code)

###  Left Motor Configuration
* **Enable Pin (Speed):** Pin 9
* **Direction Pin 1:** Pin 2
* **Direction Pin 2:** Pin 3

###  Right Motor Configuration
* **Enable Pin (Speed):** Pin 10
* **Direction Pin 1:** Pin 4
* **Direction Pin 2:** Pin 5

###  Sensors
* **Left IR Sensor:** Pin 11

---

##  Current Simulation Output

With both motor speeds set to **`150`** (Forward Gear), running the script gives the following real-time outputs:

* `Pin 4 set to HIGH` (Right Motor Forward)
* `Pin 5 set to LOW`
* `Pin 2 set to HIGH` (Left Motor Forward)
* `Pin 3 set to LOW`
* `Pin 10 speed set to 150` (Right Motor PWM Active)
