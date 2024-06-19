# install tools
# !pip install pandas

# imports
import os
import pandas as pd
import numpy as np

# intial configs

os.system('cls')
os.system('color 6')
print(pd.__version__)
print(np.__version__)

# code
abre = ('\n----------------------------------------------------\n')
fecha = ('\n====================================================\n')


print(abre)
serie_dados = pd.Series([10, 20, 30, 40, 50])
print(serie_dados)
print(type(serie_dados))

array_inteiros = [10, 20, 30, 40, 50]
indices = ['A', 'B', 'C', 'D', 'E']
serie_dados = pd.Series(array_inteiros, index=indices)
print(serie_dados)
print(type(serie_dados))

np_array_inteiros = np.array([10, 20, 30, 40, 50])
print(np_array_inteiros)
print(type(np_array_inteiros))

serie_dados = pd.Series(array_inteiros)
print(serie_dados)
print(serie_dados.shape)
print(serie_dados.ndim)
print(serie_dados.size)

print('\n')

serie_dados.index = ['W', 'X', 'V', 'A', 'B']
print(serie_dados)

print('\n')

valores = np.random.random(10)
indexes = np.arange(0, 10)
print(valores)
print(indexes)
print(type(valores), type(indexes))

print('\n')

serie_dados = pd.Series(valores, indexes)
print(serie_dados)
print(serie_dados.index)

print('\n')

dicionario = {'João': 10, 'Alice': 5, 'Gustavo': 6, 'Pedro': 9}
print(type(dicionario))

print('\n')

print(dicionario)

dict_serie_dados = pd.Series(dicionario)
print(dict_serie_dados)

print(fecha)
