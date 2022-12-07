import numpy as np
from time import time, process_time


def generateMatriz(size):
    return [[(size*k)+r for r in range(1, size+1)] for k in range(size)]


sizeMatrix = int(input('Digite o tamanho da matriz: '))
initial_time = time() * 1000
matrix = generateMatriz(sizeMatrix)
print('Matriz: \n', matrix)
print('Determinante: ', round(np.linalg.det(matrix)))
execution_time = time() * 1000 - initial_time
print('Tempo de execução: ', execution_time, 'ms')
