#!/usr/bin/env python3
from math import sin, tan, sqrt, asin, radians
from matplotlib import pyplot as plt
import numpy as np

BEAM_OFFSET = 15.7 # mm
LATTICE_PLANE = 6.2708
N = 1 # ?

def compute_energy(angle):
    return (12.4*N) / (LATTICE_PLANE * sin(angle)) # keV

def compute_angle(energy):
    return asin( (12.4*N) / (energy * LATTICE_PLANE) )

def compute_gap(angle):
    return sin(angle) * sqrt( ((BEAM_OFFSET)/tan(2*angle))**2 + (BEAM_OFFSET)**2 )

def main():
    # Si
    th_values_Si = np.linspace(3.5, 50, 100)
    gaps_Si = np.array([compute_gap(radians(th)) for th in th_values_Si])
    data_Si = np.column_stack((th_values_Si, gaps_Si))

    # SiC
    th_values_SiC = np.linspace(45, 65, 100)
    gaps_SiC = np.array([compute_gap(radians(th)) for th in th_values_SiC])
    data_SiC = np.column_stack((th_values_SiC, gaps_SiC))

    plt.style.use("ggplot")
    fig, ax = plt.subplots(figsize=(10,6))
    ax.set(xlabel="Bragg angle (deg)", ylabel="Crystal gap (mm)")
    ax.plot(data_Si[:, 0], data_Si[:, 1], "-r.", label="Si")
    ax.plot(data_SiC[:, 0], data_SiC[:, 1], "-b.", label="SiC")
    ax.set_yticks(np.arange(5,20,1))
    ax.set_xticks(np.arange(0,70,2))
    ax.legend()

    plt.show()


if __name__ == "__main__":
    main()
