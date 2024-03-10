#import "template.typ": conf, question, pseudocode, GITFRONT_REPO
#import "ej3/prefix-suffix.typ": prefix-suffix

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

#let example1 = "ABRACADABRA";
#let example2 = "AREPERA";
#let example3 = "ALGORITMO";

- Para la cadena #underline(`ABRA`)`CAD`#underline(`ABRA`), la respuesta
  sería #raw(prefix-suffix(example1)).
- Para la cadena #underline(`A`)`REPER`#underline(`A`), la respuesta sería
  #raw(prefix-suffix(example2)).
- Para la cadena `ALGORITMO`, la respuesta sería #prefix-suffix(example3).
  (la cadena vacía).

Diseñe un algoritmo que pueda responder a esta consulta usando tiempo $O(n)$.
][
Notemos que a la hora de hacer el preprocesamiento de una cadena dada $S$ en
el algoritmo de KMP, se calcula una tabla de saltos que se puede interpretar
exactamente como lo que se pide (y de hecho, es ese el invariante que se
mantiene en cada iteración de la construcción): la longitud del prefijo de
$S[0..i]$ más largo que también es sufijo de $S[0..i]$ sin ser $S[0..i]$.

De esta forma, el algoritmo que resolvería este problema consiste simplemente
en preprocesar de dicha manera $S$ y retornar una subcadena en el rango
$[0, r)$, donde $r$ es el último elemento de la tabla de saltos.

El algoritmo sería entonces el siguiente:

#pseudocode[
```python
def prefix_suffix(s: Cadena) -> Cadena:
    tabla = preprocesar(s)

    return s.subcadena(0, tabla.último())
```
]

Una implementación de este algoritmo se utilizó al compilar el código fuente de
este documento y mostrar los resultados de los ejemplos en el enunciado,
se puede encontrar #link(GITFRONT_REPO + "tarea7/src/ej3/")[aquí].
]
