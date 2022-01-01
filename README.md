# Practica 3 IA - reservas hotel
Explicado en el informe.

## Generadores
Hay un generador para las extensiones 2, 3 y 4. Permiten crear fácilmente entradas aleatorias especificando el número de peticiones y habitaciones que se desea.

Por ejemplo:

```py
python gen-e2.py -s 1234 --pet 10 --hab 4
```

Genera un fichero de problema con 10 peticiones y 4 habitaciones a partir de la semilla 1234.

## Cómo ejecutar los planificadores (Hay que usar Metric-FF):

* Compilamos el código del directorio Metric-FF (make). Ésto creará el ejecutable "ff".
* Ejecutamos en la consola:

 ```sh
 ./ff -O -o reservas.pddl -f prueba02.pddl
 ```
Siendo pruebaXX.pddl el juego de pruebas generado.
