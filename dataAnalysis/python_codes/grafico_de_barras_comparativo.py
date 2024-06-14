# imports
import os
import matplotlib.pyplot as plt

# settings
os.system('cls')
os.system('color 6')

# variables

x_amostra_1 = [1, 3, 5, 7, 9]
y_amostra_1 = [2, 3, 7, 1, 0]
x_amostra_2 = [2, 4, 6, 8, 10]
y_amostra_2 = [5, 1, 3, 7, 4]

title = "Título do Gráfico"
x_label = "Eixo do X"
y_label = "Eixo do Y"

# codes

plt.title(title)
plt.xlabel(x_label)
plt.ylabel(y_label)
plt.bar(x_amostra_1, y_amostra_1, label="Amostra 1")
plt.bar(x_amostra_2, y_amostra_2, label="Amostra 2")
plt.legend()
plt.show()


# outputs
