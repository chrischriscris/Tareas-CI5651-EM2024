# Ejercicio 3

Para compilar el programa se debe ejecutar el siguiente comando:

```bash
make
```

Para ejecutar el programa se debe ejecutar el siguiente comando:

```bash
./WPSTree "<parentheses_string>"
```

Donde `<parentheses_string>` es la cadena de paréntesis que se desea evaluar.

El programa se mantendrá preguntado al usuario sobre un rango de valores `i` y `j` para usar el árbol de segmentos y calcular en tiempo O(log n) el tamaño de la sub-cadena bien parentizada más larga en el rango `[i..j]`.

Se implementa la construcción del árbol de segmentos en la función `buildWPSTree` y la consulta en la función `queryWPSTree`, ambas en el archivo [src/WPSTree.hs](src/WPSTree.hs).

---
Hecho con <3 por chrischriscris
