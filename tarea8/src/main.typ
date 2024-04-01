#import "template.typ": conf, question, pseudocode, GITFRONT_REPO

#show: doc => conf("Tarea 8: Divide y Vencerás/Programación Dinámica", doc)

#question[
Considere un polinomio formado por los números de su carné, donde el i–ésimo
número corresponde al coeficiente para $x^i$.

Por ejemplo, si su carné es `12-02412`, entonces el polinomio será:

$ P (x) &= 1x^0 + 2x^1 + 0x^2 + 2x^3 + 4x^4 + 1x^5 + 2x^6 \
      &= 1 + 2x + 2x^3 + 4x^4 + x^5 + 2x^6 $

Calcule y muestre el resultado de aplicar la DFT (Transformada Discreta de
Fourier) al polinomio obtenido, usando las *raíces octavas* de la unidad.
][
En este caso, el carné a considerar es `18-10892`, por lo que el polinomio es:

$ P (x) &= 1x^0 + 8x^1 + 1x^2 + 0x^3 + 8x^4 + 9x^5 + 2x^6 \
      &= 1 + 8x + x^2 + 8x^4 + 9x^5 + 2x^6 $

Con esto, el vector de coeficientes es $(1, 8, 1, 0, 8, 9, 2, 0)$, ya que
debemos completar hasta tener un vector de coeficientes de tamaño $2^k$.

Luego, las raíces octavas de la unidad vendrán dadas por
$omega^k = e^((pi k)/4 i) $, con $k in [0..7]$.

Corriendo el algoritmo `FFT` con este vector obtenemos el siguiente resultado
(comenzando por $omega$):

$ "FFT"((1, 8, 1, 0, 8, 9, 2, 0), e^(pi/4 i)) &\
=
                                            &(29, -7 - i - e^(pi/4 i), 6 + 17i, -7 + i + e^((3pi)/4 i),\
  &-5, -7 - e^(pi/2 i) + e^(pi/4 i), 6 - 17i, -7 + e^(pi/2 i) - e^((3pi)/4 i))\
=                                           &(29, -7 - sqrt(2) / 2 - (sqrt(2)/2 + 1) i, 6 + 17i, -7 + sqrt(2) / 2 + (1 - sqrt(2)/2)i,\
  &-5, -7 + sqrt(2) / 2 + (sqrt(2)/2 - 1)i, 6 - 17i, -7 - sqrt(2) / 2 + (sqrt(2)/2 + 1)i) $

Lo que corresponde a $(P(omega^0), P(omega^1), dots, P(omega^7))$.
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
  Veamos que para $X < 2$ el valor de $"decomp"(X)$ es $0$.

  $N$ tiene $N - 1$ descomposiciones en sumandos, que vienen dadas por
  $1 + (N - 1), 2 + (N - 2), dots, (N - 1) + 1$.

  Por otro lado, sea $k$ la cantidad de divisores de $N$, $N$ tiene $k - 1$
  descomposiciones en factores si es un cuadrado perfecto, y $k$ en caso
  contrario.

  Ejemplo: (Para 10)
  1 + 9
  2 + 8
  3 + 7
  4 + 6
  5 + 5
  6 + 4
  7 + 3
  8 + 2
  9 + 1

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
