#set document(title: [Tarea 5: Grafos], author: "Christopher Gómez")
#set page(margin: 2cm)
#set text(font: "New Computer Modern", lang: "es")
#show raw: set text(font: "JetBrains Mono")
#set par(leading: 0.55em, justify: true)
#show par: set block(above: 1em, spacing: 0.55em)
#show heading: it => {
  set align(center)
  set text(14pt)
  block(height: 1.5em)[#it]
}
#set list(tight: false)
#set enum(tight: false)

// Start of the document

#grid(
  columns: (1fr, 1fr),
  block[
    #set align(center)
    #image("logo.png",width: 50%)
    Universidad Simón Bolívar \
    CI-5651 - Diseño de Algoritmos I \
    Prof. Ricardo Monascal \
  ],[
    #set align(end)
    #rect(
      fill: rgb("#C4E6FF"),
      outset: 0.5em
    )[
      #set align(center)
      Resuelto por: \
      Christopher Gómez \
    ]
  ]
)

= Tarea 5: Grafos

#enum[

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
`g`. \ \

Solución

][

// Pregunta 2

Sea un conjunto $C$ de $n$ números enteros positivos distintos. ¿Cuál es la
menor cantidad de números que debe eliminarse de $C$ de tal forma que no existan
$x, y in C$ tal que $x + y$ sea un número primo?

Diseñe un algoritmo que pueda responder esta consulta en tiempo $O(n^2 sqrt(n))$.
A efectos de esta pregunta, puede suponer que consultar si un número es primo es
$O(1)$.

_Pista: El teorema de *König* puede ser de utilidad._ \ \

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
#table(
  columns: (auto, auto, auto),
  align: (center, center, center),
  [+], [+] , [—] ,
  [|], [—] , [+] ,
  [—], [ ] , [|] ,
)
]

Diga si hay una estrategia ganadora para alguno de los jugadores involucrados.
Para resolver este problema, utilice el método *minmax*. \ \

Solución

]
