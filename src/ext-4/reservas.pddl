;; Definicion del dominio de reservas hotel

(define (domain ReservasHotel)
    (:requirements :adl :typing :equality :fluents)
    (:types
        peticion habitacion - object)

    (:predicates
        (servida ?p - peticion)
        (asignada-a ?p - peticion ?h - habitacion)
        ; (orientada ?obj - object ?d - direccion)
        (abierta ?h - habitacion)
    )

    (:functions
        (dia-inicio ?p - peticion)
        (dia-final ?p - peticion)
        (cantidad ?p - peticion)
        (capacidad ?h - habitacion)
        (n-denegadas)
        (n-sobrantes)
        (n-abiertas)
    )

    (:action asignar
        :parameters (?pet - peticion ?hab - habitacion)
        :precondition
            (and
                (<= (cantidad ?pet) (capacidad ?hab))
                (abierta ?hab)
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
                ; (when (not (exists (?dir - direccion)
                ;                    (and (orientada ?pet ?dir)
                ;                         (orientada ?hab ?dir))))
                ;     (increase (n-norientadas) 1))
                (increase (n-sobrantes) (- (capacidad ?hab) (cantidad ?pet)))
            )
    )

    (:action denegar
        :parameters (?pet - peticion)
        :precondition (not (servida ?pet))
        :effect
            (and
                (servida ?pet)
                (increase (n-denegadas) 1)
            )
    )

    (:action abrir
        :parameters (?hab - habitacion)
        :precondition (not (abierta ?hab))
        :effect
            (and
                (abierta ?hab)
                (increase (n-abiertas) 1)
            )
    )
)
