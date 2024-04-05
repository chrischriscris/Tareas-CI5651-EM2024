#import "template.typ": conf, question, pseudocode, GITFRONT_REPO

#show: doc => conf("Tarea 9: Algoritmos probabilísticos y aproximados", doc)

#question[
Considere su número de carné (sin el guión), concatenado tres veces, como un
número entero. Por ejemplo, si su carné es `12-34567`, entonces el entero a
considerar sería:

123456712345671234567

Muestre la ejecución del algoritmo de Miller–Rabin repetido, paso a paso (a
nivel del ciclo principal de `MillerRabinRep`), para ver si el número es primo o
compuesto, usando $k = 10$. ¿En cuántas iteraciones obtiene el resultado
esperado? ¿Ejecutó las $k = 10$ iteraciones?

_Nota: Puede usar el generador de números aleatorios que viene con su lenguaje de
elección._
][
  Solución 1
][
  Sea $A$ y $B$ dos matrices $n times n$, para algún entero $n > 0$.

  Sospechamos que $B = A^(−1)$. Esto es, que $B$ es la matriz inversa de $A$.

  Diseñe un algoritmo de Monte Carlo que permita confirmar esta sospecha, con un
  cierto error permitido $epsilon$, usando tiempo $O(n^2 log 1/epsilon)$.

  _Nota: Puede usar el generador de números aleatorios que viene con su lenguaje de
  elección._
][
  Solución n
][
  Sea un grafo $G = (N, C)$, decimos que $V subset.eq N$ es un cubrimiento de
  vértices para $G$ si todas las conexiones tienen alguno de sus extremos en V .

  $ (forall a, b in N : {a, b} in C => a in V or b in V) $

  Sea $"MIN−COVER"$ el problema de hallar un cubrimiento de vértices de
  cardinalidad mínima. Sabemos que $"MIN−COVER"$ es $"NP"$–completo.

  Diseñe un algoritmo para el problema 1–relativo–$"MIN−COVER"$ asociado. Esto es,
  diseñe un algoritmo eficiente (en tiempo polinomial) que resuelve el problema
  del mínimo cubrimiento de vértices, produciendo una respuesta que es a lo sumo
  el doble de la solución óptima. Debe demostrar que esto último es cierto para su
  algoritmo propuesto.
][
  Solución n
]
