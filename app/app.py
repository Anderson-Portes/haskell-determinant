import numpy as np
from time import time


def generateMatriz(size):
    return [[(size*k)+r for r in range(1, size+1)] for k in range(size)]


def run_app(is_testing):
    times = []
    iterator = range(2, 10) if is_testing else range(1)
    for i in iterator:
        sizeMatrix = i if is_testing else int(input('Tamanho da matriz: '))
        initial_time = time() * 1000
        matrix = generateMatriz(sizeMatrix)
        print('Matriz: \n', matrix)
        print('Determinante: ', round(np.linalg.det(matrix)))
        execution_time = time() * 1000 - initial_time
        print('Tempo de execução: ', execution_time, 'ms')
        times.append(execution_time)
    return times


if __name__ == "__main__":
    run_app(False)
