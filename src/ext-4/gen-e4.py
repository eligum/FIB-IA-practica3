#!/bin/python

import argparse
import random
import sys


def main():
    # Create the parser
    parser = argparse.ArgumentParser(description="Generador de problemas para el dominio de ReservasHotel.")

    parser.add_argument("-e", "--explicit",
                        action="store_true",
                        help="introducir manualmente las características de las peticiones y habitaciones")

    parser.add_argument("-s", "--seed",
                        action="store",
                        type=int,
                        default=None,
                        help="sleccionar la semilla que se usa para generar los valores aleatorios")

    parser.add_argument("-o",
                        action="store",
                        type=str,
                        default="test04",
                        help="nombre del archivo de salida, se añade la extension '.pddl' automaticamente" )

    parser.add_argument("--pet",
                        action="store",
                        type=int,
                        required=True,
                        help="numero total de peticiones")

    parser.add_argument("--hab",
                        action="store",
                        type=int,
                        required=True,
                        help="numero total de habitaciones")

    args = parser.parse_args()
    n_pet = args.pet
    n_hab = args.hab
    seed = args.seed
    fname = args.o

    # Generate random values for peticiones and habitaciones
    random.seed(seed)
    cantidades = [random.randrange(1, 5) for _ in range(n_pet)]
    capacidades = [max(cantidades)] + [random.randrange(1, 5) for _ in range(n_hab - 1)]
    # p_dirs = random.choices(['N', 'S', 'E', 'O'], k=n_pet)
    # h_dirs = random.choices(['N', 'S', 'E', 'O'], k=n_hab)
    dis = [random.randrange(1, 30) for _ in range(n_pet)]
    dfs = [random.randrange(di+1, 31) for di in dis]

    peticiones = list(zip(cantidades, dis, dfs))
    habitaciones = list(zip(capacidades))

    print(peticiones)
    print(habitaciones)

    if args.explicit:
        print("Option -e, --explicit is not supported yet!")
        sys.exit()

    # Actual application code
    with open(f"{fname}.pddl", mode='w') as fid:
        fid.write(f"(define (problem {fname})\n")
        fid.write("    (:domain ReservasHotel)\n")
        fid.write("    (:objects\n")
        fid.write("       ")
        for i in range(n_pet):
            fid.write(f" pet{i + 1}")
        fid.write(" - peticion\n")
        fid.write("       ")
        for i in range(n_hab):
            fid.write(f" hab{i + 1}")
        fid.write(" - habitacion\n")
        fid.write("       ")
        for c in "NSEO":
            fid.write(f" {c}")
        fid.write(" - direccion)\n")
        # Inicializar objetos
        fid.write("    (:init\n")
        for (i, (c, di, df)) in enumerate(peticiones):
            fid.write("        ")
            fid.write(f"(= (cantidad pet{i+1}) {c}) (= (dia-inicio pet{i+1}) {di}) (= (dia-final pet{i+1}) {df})\n")
        for (i, (c,)) in enumerate(habitaciones):
            fid.write("        ")
            fid.write(f"(= (capacidad hab{i+1}) {c})\n")
        fid.write("        ")
        fid.write("(= (n-denegadas) 0)\n")
        fid.write("        ")
        fid.write("(= (n-sobrantes) 0)\n")
        fid.write("        ")
        fid.write("(= (n-abiertas) 0))\n")
        fid.write("    (:goal\n")
        fid.write("        (forall (?p - peticion) (servida ?p)))\n\n")
        fid.write("    (:metric minimize\n")
        fid.write("        (+ (* 2.0 (n-denegadas)) (+ (* 0.5 (n-norientadas)) (+ (* 0.25 (n-sobrantes)) (* 0.1 (n-abiertas))))))\n")
        fid.write(")\n")


if __name__ == "__main__":
    main()
else:
    print("This file is meant to be executed as a script.")
