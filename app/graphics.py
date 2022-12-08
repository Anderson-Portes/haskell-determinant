# In this file, the matrices will be shown on the screen because in the haskell system,
# the execution time takes into account the print on the screen

from app import run_app
import matplotlib.pyplot as plt

python_times = run_app(True)
haskell_times = [
    0.9919,
    0.9926,
    0.9996,
    0.9939,
    1.9942,
    5.7351,
    21.8006,
    159.9965
]
matrix_names = ['2x2', '3x3',  '4x4', '5x5', '6x6', '7x7', '8x8', '9x9']

fig, ax = plt.subplots(1, 2)
ax[0].plot(matrix_names, python_times)
ax[0].set_title("Determinantes em Python")
ax[1].plot(matrix_names, haskell_times)
ax[1].set_title("Determinantes em Haskell")
plt.show()
