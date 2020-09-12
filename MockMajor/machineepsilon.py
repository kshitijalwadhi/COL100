def machineEpsilon(eps):
    while(1+eps != 1):
        prev_eps = eps
        eps = eps/2

    return prev_eps


print(machineEpsilon(0.5))
