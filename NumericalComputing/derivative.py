import matplotlib.pyplot as plt
import numpy as np


def fp(x, y):
    return 2*x*y - 2 * (x**2) + 1


def function(xf, x0, y0, h, fp):
    x = x0
    y = y0
    while(x < xf):
        y += h*(fp(x, y))
        x += h
    return y


#print(function(2, 0.0, 1.0, 0.1, fp))

n = 300

x = np.linspace(0, 3, n)
plt.plot(x, np.exp(x**2)+x, label='exact')

y_approx = []

for i in range(n):
    y_approx.append(function(x[i], 0.0, 1.0, 0.01, fp))
    i += 1


plt.plot(x, y_approx, label='approx')

plt.xlabel('X axis')
plt.ylabel('Y axis')
plt.legend()

plt.show()
