#import "template.typ": conf, question, pseudocode, GITFRONT_REPO
#import "ej3/prefixSuffix.typ": buildKMPTable

#show: doc => conf(
    "Tarea 7: Cadenas de caracteres/Geometría computacional",
    doc
)


#question[
Sea $n$ una cadena de caracteres que tiene su número de carné (sin el guión):

#enum(numbering: "(a)")[
Construya un árbol de sufijos para $n$.
][
Construya un arreglo de sufijos a partir del árbol de sufijos para $n$.
][
Para cada posición $k$, calcule los valores para $"PLCP"[k]$ (el prefijo común
permutado más largo) y $"LCP"[k]$ (el prefijo común más largo), como fue visto
en clase.
]
][
Para este caso, la cadena de caracteres $n$ es `18-10892`, con lo que el árbol
de sufijos sería el siguiente:

#figure(caption: [Árbol de sufijos para `1810892`])[
#image("img/suffixtree.svg", width: 250pt)
]<arbol> \

][
Sea $P = {p_1 , p_2 , dots , p_n }$ un conjunto de puntos en el plano
cartesiano. Definimos una *capa* como aquellos puntos que forman parte del
polígono convexo más pequeño que rodea a todos los puntos en $P$. Pero los
puntos son como los ogros o las cebollas y pueden tener más de una capa. En
particular, se puede remover la capa para $P$ y obtener un conjunto de puntos
$P'$ a los que también se les puede calcular su capa. ¿Cuántas capas tiene el
conjunto de puntos $P$?

Diseñe un algoritmo que pueda responder a esta consulta usando tiempo
$O(n^2 log n)$ y memoria $O(n)$.
][
Solución 2
][
Considere una cadena de caracteres $S$, de longitud $n$. Se desea hallar la
subcadena $T$ de $S$ más grande, tal que:

- $T$ sea prefijo de $S$ (la cadena $S$ _empieza_ con $T$).
- $T$ sea sufijo de $S$ (la cadena $S$ _termina_ con $T$).
- $T != S$.

Considere los siguientes ejemplos:

- Para la cadena #underline(`ABRA`)`CAD`#underline(`ABRA`), la respuesta
  sería `ABRA`.
- Para la cadena #underline(`A`)`REPER`#underline(`A`), la respuesta sería `A`.
- Para la cadena `ALGORITMO`, la respuesta sería $lambda$ (la cadena vacía).

Diseñe un algoritmo que pueda responder a esta consulta usando tiempo $O(n)$.
][
Ejemplo:

#let test1 = "ABRACADABRA"
#let test2 = "SEVENTY SEVEN AAAAAAA SEVENTY SEVEN"

#buildKMPTable(test1).map(i => str(i)).join(" ")

#buildKMPTable(test2).map(i => str(i)).join(" ")

With ALGORITMO #buildKMPTable("ALGORITMO").map(i => str(i)).join(" ")
With ABRACADABRA #buildKMPTable("ABRACADABRA").map(i => str(i)).join(" ")
With AREPERA #buildKMPTable("AREPERA").map(i => str(i)).join(" ")
]
