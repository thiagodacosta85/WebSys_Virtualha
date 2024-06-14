# imports
import os
import matplotlib.pyplot as plt

# settings
os.system('cls')
os.system('color 6')

# variables

x = [1, 2, 3, 4, 5]
y = [20, 20, 5, 12, 77]

title = "Título do Gráfico"
x_label = "Eixo do X"
y_label = "Eixo do Y"

# codes

plt.title(title)
plt.xlabel(x_label)
plt.ylabel(y_label)
plt.bar(x, y)
plt.show()


# outputs
