# Traffic Light Controller — FSM (Verilog)

This repository contains a Verilog implementation of a **finite state machine (FSM)**–based traffic light controller.  
The design controls two traffic directions (A and B) using state bits `s1` and `s0`.  
Inputs `Ta` and `Tb` represent timing/trigger signals for switching between traffic phases.

---

## Overview

The controller uses a **2-bit FSM** to determine the light outputs for both directions:

- **Direction A lights:** `La1`, `La0`  
- **Direction B lights:** `Lb1`, `Lb0`

The FSM transitions to the next state based on the external timing inputs **Ta** and **Tb**, which typically represent "time expired" or "sensor triggered".

The system updates on each rising edge of the clock.

---

## Module Interface

```verilog
module traffic_light_FSM(
    input  Ta, Tb, clk, reset,
    output La1, La0, Lb1, Lb0
);
