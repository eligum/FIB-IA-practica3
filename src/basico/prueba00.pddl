;; Instanciacion del problema de reservas hotel

(define (problem prueba00)
    (:domain ReservasHotel)

    (:objects
        pet1_c2_12 pet2_c2_14 pet3_c2_230 - peticion
        hab1_c2 hab2_c2                   - habitacion
    )

    (:init
        ;; peticiones
        (= (cantidad pet1_c2_12)  2) (= (dia-inicio pet1_c2_12)  1) (= (dia-final pet1_c2_12)   2)
        (= (cantidad pet2_c2_14)  2) (= (dia-inicio pet2_c2_14)  1) (= (dia-final pet2_c2_14)   4)
        (= (cantidad pet3_c2_230) 2) (= (dia-inicio pet3_c2_230) 2) (= (dia-final pet3_c2_230) 30)
        ;; habitaciones
        (= (capacidad hab1_c2) 2)
        (= (capacidad hab2_c2) 2)
    )

    (:goal
        (forall (?p - peticion) (servida ?p))
    )
)
