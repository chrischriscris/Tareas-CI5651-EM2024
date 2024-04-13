# Ejercicio 2

Para compilar el programa se debe ejecutar el siguiente comando:

```bash
./package-jar.sh
```

No es necesario compilar el programa. En caso de tener un JRE, se
puede omitir el paso anterior y ejecutar el siguiente comando para correr el
programa:

```bash
./run-inverse-checker.sh <filename> <epsilon>
```

Donde `<filename>` es el nombre del archivo que contiene las matrices $A$ y la
sospechosa matriz $B$ en el siguiente formato:

```
n
a_11 a_12 ... a_1n
a_21 a_22 ... a_2n
...
a_n1 a_n2 ... a_nn
b_11 b_12 ... b_1n
b_21 b_22 ... b_2n
...
b_n1 b_n2 ... b_nn
```

Y `<epsilon>` el error permitido para el algoritmo de Monte Carlo.

La función específica que resuelve el problema es `isInverse` en el archivo
[inverseChecker/src/main/java/com/chus/InverseChecker.java](inverseChecker/src/main/java/com/chus/InverseChecker.java).

---

Hecho con :heart: por chrischriscris
