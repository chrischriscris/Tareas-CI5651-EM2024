#import "template.typ": conf, question, pseudocode, GITFRONT_REPO

#show: doc => conf("Tarea 9: Algoritmos probabilísticos y aproximados", doc)

#question[
Considere su número de carné (sin el guión) restando 1 si es par, concatenado
tres veces, como un número entero. Por ejemplo, si su carné es `12-34567`,
entonces el entero a considerar sería:

#align(center)[
  123456712345671234567
]

Muestre la ejecución del algoritmo de Miller–Rabin repetido, paso a paso (a
nivel del ciclo principal de `MillerRabinRep`), para ver si el número es primo o
compuesto, usando $k = 10$. ¿En cuántas iteraciones obtiene el resultado
esperado? ¿Ejecutó las $k = 10$ iteraciones?

_Nota: Puede usar el generador de números aleatorios que viene con su lenguaje de
elección._
][
En este caso, el carné es `18-10892`, por lo que el número a considerar es
$181089118108911810891$.

Notemos que, por construcción, para cualquier carnet el número resultante de
concatenarlo 3 veces será compuesto, de la siguiente manera:

Sea $c > 1$, $c in NN$ un carnet dado, concatenar $c$ 3 veces será equivalente
a:

$ c + c*10000000 + c*100000000000000 &= c*(1 + 10000000 + 100000000000000)\
                                   &= c*100000010000001 $

Veamos entonces cuál es el resultado de la ejecución del algoritmo de
Miller-Rabin:

- El número aleatorio $a$ resulta ser $a = 106681647674259816197$ (generado por un
  dado de 6 caras).
- El primer ciclo itera 1 vez:
  - $t = 90544559054455905445$.
- $x = a^t mod 181089118108911810891 = 87323191318267542098$.
- El resultado no es 1 ni $n - 1 = 181089118108911810890$.
- Como $s = 1$ el segundo ciclo no itera.
- El resultado no es 1 ni $n - 1 = 181089318108931810892$.
- Se concluye que el número es compuesto.

][
  Sea $A$ y $B$ dos matrices $n times n$, para algún entero $n > 0$.

  Sospechamos que $B = A^(−1)$. Esto es, que $B$ es la matriz inversa de $A$.

  Diseñe un algoritmo de Monte Carlo que permita confirmar esta sospecha, con un
  cierto error permitido $epsilon$, usando tiempo $O(n^2 log 1/epsilon)$.

  _Nota: Puede usar el generador de números aleatorios que viene con su lenguaje de
  elección._
][
Queremos saber si $A B = I_n$, sea $I_n$ la matriz identidad de grado $n$. Así,
un algoritmo de Monte Carlo que nos permite confirmar esta sospecha con un error
arbitrario $epsilon > 0$ y tiempo $O(n^2 log 1/epsilon)$ es ejecutar el método
de Freivalds $k$ veces, con $k = lg(1/epsilon)$:

#pseudocode[
```python
    def freivalds(A: Matriz, B: Matriz, C: Matriz) -> bool:
        n = A.tamaño
        x = vector_aleatorio(0, 1, n)

        return x*A*B == x*C

    def es_inversa(A: Matriz, B: Matriz, epsilon: Real) -> bool:
        n = A.tamaño
        k = ceil(log(1/epsilon))

        I = matriz_identidad(n)
        i = 0
        while i < k:
            if not freivalds(A, B, I):
                return False

            i = i + 1
        return True
    ```
]
Una implementación de este algoritmo en Java se puede encontrar
#link(GITFRONT_REPO + "tarea9/ej2/")[aquí].
][
  Sea un grafo $G = (N, C)$, decimos que $V subset.eq N$ es un cubrimiento de
  vértices para $G$ si todas las conexiones tienen alguno de sus extremos en V .

  $ (forall a, b in N : {a, b} in C => {a, b} sect V != emptyset) $

  Sea $"MIN−COVER"$ el problema de hallar un cubrimiento de vértices de
  cardinalidad mínima. Sabemos que $"MIN−COVER"$ es $"NP"$–completo.

  Diseñe un algoritmo para el problema 1–relativo–$"MIN−COVER"$ asociado. Esto es,
  diseñe un algoritmo eficiente (en tiempo polinomial) que resuelve el problema
  del mínimo cubrimiento de vértices, produciendo una respuesta que es a lo sumo
  el doble de la solución óptima. Debe demostrar que esto último es cierto para su
  algoritmo propuesto.
][
Para resolver aproximadamente el problema del mínimo cubrimiento de vértices,
basta con ir tomando aristas $A$ cualesquiera del grafo y eliminar las aristas
incidentes a los vértices de $A$, pues ya estarán cubiertas por los vértices de
$A$, que se agregarán al cubrimiento. Si repetimos esto hasta considerar todas
las aristas, obtendremos un cubrimiento de vértices. Veamos el algoritmo:

#pseudocode[
```python
  def min_cover(G: Grafo) -> Conjunto:
      C = {}
      for u, v in G.aristas:
          C.unir({u, v})
          G.eliminar_vertice(u)
          G.eliminar_vertice(v)

      return C
  ```
]
Notemos que, como en cada iteración escogemos una arista distinta y eliminamos
sus vértices y respectivas aristas incidentes, el cubrimiento $C$ obtenido será
equivalete a un _emparejamiento_, y de hecho, uno maximal (si en vez de guardar
los vértices guardáramos las aristas). Llamemos $M$ a este emparejamiento.

Por otro lado, tenemos también que un cubrimiento de vértices de cardinalidad
mínima debe contener por definición al menos un vértice por cada arista del
emparejamiento maximal (de no ser así, no cubriría todas las aristas), es decir,
sea $C^*$ la solución óptima, entonces $|M| <= |C^*|$.

Pero el algoritmo propuesto no guarda aristas, sino los dos vértices de la
misma, por lo que $|C| = 2|M|$, y por lo tanto $(|C|)/2 <= |C^*|$, o lo que es
lo mismo, $|C| <= 2|C^*|$.

Se concluye así que el algoritmo propuesto produce una respuesta que es a lo
sumo el doble de la solución óptima.

Una implementación de este algoritmo en Typescript se puede encontrar
#link(GITFRONT_REPO + "tarea9/ej3/")[aquí].
]
