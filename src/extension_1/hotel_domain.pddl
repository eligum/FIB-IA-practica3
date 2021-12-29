;; Definicion del dominio de reservas hotel

(define (domain ReservasHotel)
    (:requirements :adl :typing :equality :fluents)
    (:types
        peticion habitacion - object)

    (:predicates
        (servida ?p - peticion)
        (asignada-a ?p - peticion ?h - habitacion)
    )

    (:functions
        (dia-inicio ?p - peticion)
        (dia-final ?p - peticion)
        (cantidad ?p - peticion)
        (capacidad ?hab - habitacion)
    )

    (:action asignar
        :parameters (?pet - peticion ?hab - habitacion)
        :precondition
            (and
                (<= (cantidad ?pet) (capacidad ?hab))
                (not (servida ?pet))
                (not (exists (?p - peticion)
                             (and
                                (asignada-a ?p ?hab)
                                (or (and
                                        (>  (dia-final ?p) (dia-inicio ?pet))
                                        (<= (dia-final ?p) (dia-final ?pet)))
                                    (and
                                        (<  (dia-inicio ?p) (dia-final ?pet))
                                        (>= (dia-inicio ?p) (dia-inicio ?pet)))))))
            )
        :effect
            (and
                (servida ?pet)
                (asignada-a ?pet ?hab)
            )
    )
)
