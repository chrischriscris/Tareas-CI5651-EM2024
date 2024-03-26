#import "template.typ": conf, question, pseudocode, GITFRONT_REPO

#show: doc => conf("Tarea 8: Divide y Vencerás/Programación Dinámica", doc)

#question[
Considere un polinomio formado por los números de su carné, donde el i–ésimo
número corresponde al coeficiente para $x^i$.

Por ejemplo, si su carné es `12-02412`, entonces el polinomio será:

$ P (x) &= 1x^0 + 2x^2 + 0x^3 + 2x^4 + 4x^5 + 1x^6 + 2x^7 \
      &= 1 + 2x^2 + 2x^4 + 4x^5 + x^6 + 2x^7 $

Calcule y muestre el resultado de aplicar la DFT (Transformada Discreta de
Fourier) al polinomio obtenido, usando las *raíces octavas* de la unidad.
][
  Solución 1
][
  Considere un número entero positivo $X$. Definimos la función $"decomp"(X)$ como
  la cantidad de enteros positivos $a$, $b$, $c$ y $d$ de tal forma que
  $a b + c d = X$.

  $ "decomp"(X) = |{(a, b, c, d) : a, b, c, d > 0 and a b + c d = X}| $

  Dado un número $N$ , queremos hallar el máximo valor para $"decomp"(X)$ donde
  $1 <= X <= N$.

  Diseñe un algoritmo que permita encontrar la respuesta en $O(N log N)$.

  _Nota: Puede suponer que todas las operaciones aritméticas, incluyendo
  multiplicaciones, divisiones y módulos se hacen en O(1)_.

  *Pistas:*

  - ¿De cuántas formas se puede descomponer $N$ en dos sumandos $a$ y $b$, tal que $a+b = N$?
  - ¿De cuántas formas se puede descomponer $N$ en dos factores $a$ y $b$, tal que $a times b = N$?
  - ¿Que relación existe entre la cantidad de divisores de un número y su
    descomposición en factores primos?
  - La Criba de Eratóstenes se puede usar para ver si un número es primo. ¿Se podrá
    modificar para calcular algo más?
  - Un cambio de perspectiva pudiera ser de utilidad.
][
  Solución 2
][
  Sea $P = {(x_1 , y_1 ), (x_2 , y_2 ), dots, (x_n , y_n )}$ un conjunto de $n$
  puntos.

  Para cualquier subconjunto $C subset.eq P$ , definimos la lejanía de $C$ como la
  multiplicación de la distancia horizontal hasta el origen más grande en $C$
  por la distancia vertical hasta el origen más grande en $C$ (nótese que no
  necesariamente es el mismo punto quien tiene estos máximos).

  $ "lejania"(C) = (max_((x, y) in C) |x|) times (max_((x, y) in C) |y|) $

  Queremos realizar una partición de $P$ en subconjuntos $C_1 , C_2 , dots, C_m$
  de tal forma que

  #align(center)[
    #box(height: 10pt)[
      #columns(2)[
        - $C_1 union C_2 union dots union C_m = P$
        - $C_1 sect C_2 sect dots sect C_m = emptyset$
      ]
    ]
  ]

  La cantidad $m$ de subconjuntos que forma la partición es libre, entre $1$ y $n$.
  La lejanía de la partición es la suma de las lejanías de los conjuntos que lo
  conforman.

  $ "lejania"(C_1 union C_2 union dots union C_m) = "lejania"(C_1) + "lejania"(C_2) + dots
  + "lejania"(C_m) $

  Diseñe un algoritmo que permita hallar una partición con mínima lejanía en
  $O(n log n)$, usando memoria adicional $O(n)$.

  *Pistas:*

  - ¿Existen puntos en la entrada que son redundantes?
  - ¿Dar un orden a los puntos nos permitiría considerar *subsecuencias* en lugar de
    *subconjuntos*?
  - La geometría es un área muy útil de las matemáticas.
][
  Solución 3
]
