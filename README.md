# Car-Parking-Managment

The code you provided implements a car parking management system using Verilog HDL. This system manages the entry and exit of vehicles in a parking lot, handles authentication via a password, and tracks the number of available and utilized parking spaces. Here's a detailed explanation of the problem statement and how the code addresses it:

#**Problem Statement**
#**Parking Space Management:**

The parking lot has a limited number of spaces, initially set to 8.
The system should track the number of available and utilized spaces.
It should update the space availability when a car enters or exits.

#**Vehicle Entry/Exit Management:**
The system detects when a vehicle is at the entry or exit of the parking lot using sensors (sense_entry and sense_exit).
It should allow a vehicle to enter if there's available space and after the vehicle has provided a correct password.

**Password Verification:**
Before a vehicle can enter, the driver must input a password using two 2-bit inputs (password_1 and password_2).
If the password is correct, the vehicle is allowed to enter.
If the password is incorrect, the vehicle is denied entry.

#**Control of Signals:**
The system should control signals like green and red lights to guide the vehicle based on the current status (waiting, allowed to enter, denied entry, etc.).
Display messages on 7-segment displays (hex_1 and hex_2) to show status codes or actions like "ENTER," "GO," "ERROR," or "STOP."
State Machine Design:

The system is designed as a finite state machine (FSM) with various states to handle different phases of the vehicle entry/exit process, including idle, waiting, password checking, and stopping.
