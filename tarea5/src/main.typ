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
Solución
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
- Cada casilla puede tener alguno de estos símbolos, ninguno o ambos (en cuyo caso se
  forma un +).
- En cada turno, el jugador no puede jugar en la misma casilla que el jugador
  anterior.
- Gana aquel jugador que logre formar tres + en una misma fila, columna o
  diagonal.

Por ejemplo, la siguiente es una configuración ganadora (donde la última jugada fue de |):

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
