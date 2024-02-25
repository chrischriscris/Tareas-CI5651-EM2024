#import "@preview/tablex:0.0.8": tablex, cellx, hlinex, vlinex
#import "template.typ": conf, question

#show: doc => conf("Tarea 5: Grafos", doc)

#question[
// Pregunta 1
Considere la concatenación de su nombre con su apellido, llevado todo a
minúscula y eliminando todos los caracteres repetidos, menos la primera vez
que ocurran. Si su nombre es `Fulano Mengano`, entonces debe considerar la
cadena `fulanomeg`.

Se desea que:

#enum(numbering: "(a)")[
Construya un árbol binario de búsqueda considerando los caracteres en el
orden en que aparecen (puede suponer que el orden es lexicográfico).
][
Realice un etiquetado en pre-order del árbol resultante.
][
Realice un recorrido de Euler sobre el árbol resultante.
][
Muestre el cálculo del ancestro común más bajo entre los dos últimos caracteres
de su apellido, usando el método de precondicionamiento visto en clase.
]
Para el ejemplo de `fulanomeg`, debe ver el ancestro común más bajo entre `e` y
`g`.
][
En este caso, la cadena a considerar es `christopegmz`. En la @arbol se
puede ver el árbol binario resultante, con el etiquetado en pre-order a la
izquierda de cada nodo y el etiquetado por niveles a la derecha, necesario para
el recorrido de Euler.

#figure(caption: [Arbol binario para `christopegmz`])[
#image("img/arbol.svg", width: 250pt)
]<arbol> \

Luego, el recorrido de Euler tomando en cuenta dichas etiquetas será:

#align(center)[
#tablex(
  columns: (auto, ) * 23,
  [1], [2], [3], [5], [3], [2], [4], [6], [8], cellx(fill: rgb("b1dff9"))[10],
  [8], [11], [8], [6], cellx(fill: rgb("f29898"))[4], [7], [9],
  cellx(fill: rgb("b1dff9"))[12], [9], [7], [4], [2], [1]
)
]

Y la tabla resultante del precondicionamiento es:

#align(center)[
#tablex(
  columns: (auto, ) * 13,
  cellx(align: center)[Nodo], [1], [2], [3], [4], [5], [6], [7], [8], [9],
  cellx(fill: rgb("b1dff9"))[10], [11], cellx(fill: rgb("b1dff9"))[12],
  cellx(align: center)[Primera etiqueta], [0], [1], [2], [6], [3], [7], [15],
  [8], [16], cellx(fill: rgb("b1dff9"))[9], [11], cellx(fill: rgb("b1dff9"))[17]
)
] \

Como se puede concluir con la tabla y el recorrido de Euler, y como se indica
con los colores de las celdas, la primera aparición de `m` (nodo 10) es en la
posición 9 y la primera aparición de `z` (nodo 12) es en la posición 17, y la
etiqueta más pequeña que se puede encontrar en el recoorrido de Euler en el
rango $[9..17]$ del arreglo es 4, que corresponde a la etiqueta de `r`.

Se concluye entonces que el ancestro común más bajo entre `m` y `z` es `r`, y
podemos corroborar que el resultado es correcto con la @arbol.
][
// Pregunta 2
Sea un conjunto $C$ de $n$ números enteros positivos distintos. ¿Cuál es la
menor cantidad de números que debe eliminarse de $C$ de tal forma que no existan
$x, y in C$ tal que $x + y$ sea un número primo?

Diseñe un algoritmo que pueda responder esta consulta en tiempo $O(n^2 sqrt(n))$.
A efectos de esta pregunta, puede suponer que consultar si un número es primo es
$O(1)$.

_Pista: El teorema de *König* puede ser de utilidad._
][
Solución
][
// Pregunta 3
Considere un modificación del clásico juego de la vieja, en donde:

- El primer jugador juega con — y el segundo juega con |.
- Cada casilla puede tener alguno de estos símbolos, ninguno o ambos (en cuyo
  caso se forma un +).
- En cada turno, el jugador no puede jugar en la misma casilla que el jugador
  anterior.
- Gana aquel jugador que logre formar tres + en una misma fila, columna o
  diagonal.

Por ejemplo, la siguiente es una configuración ganadora (donde la última jugada
fue de |):

#align(center)[
#tablex(
  stroke: 0.5pt,
  columns: (auto, auto, auto),
  align: (center, center, center),
  hlinex(stroke: rgb("#FFFFFF"), start: 0, end: 2),
  vlinex(stroke: rgb("#FFFFFF"), start: 0, end: 2),
  [+], [+] , [—] , vlinex(stroke: rgb("#FFFFFF"), start: 0, end: 2),
  [|], [—] , [+] ,
  [—], [ ] , [|] ,
  hlinex(stroke: rgb("#FFFFFF"), start: 0, end: 2),
)]

Diga si hay una estrategia ganadora para alguno de los jugadores involucrados.
Para resolver este problema, utilice el método *minmax*.
][
Solución
]
