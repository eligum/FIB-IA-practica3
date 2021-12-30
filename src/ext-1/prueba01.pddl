;; Instanciacion del problema de reservas hotel

(define (problem prueba01)
    (:domain ReservasHotel)

    (:objects
        pet1_c2_12 pet2_c2_23 pet3_c2_34 pet4_c2_230 - peticion
        hab1_c2                                      - habitacion
    )

    (:init
        ;; peticiones
        (= (cantidad pet1_c2_12)  2) (= (dia-inicio pet1_c2_12)  1) (= (dia-final pet1_c2_12)   2)
        (= (cantidad pet2_c2_23)  2) (= (dia-inicio pet2_c2_23)  2) (= (dia-final pet2_c2_23)   3)
        (= (cantidad pet3_c2_34)  2) (= (dia-inicio pet3_c2_34)  3) (= (dia-final pet3_c2_34)   4)
        (= (cantidad pet4_c2_230) 2) (= (dia-inicio pet4_c2_230) 2) (= (dia-final pet4_c2_230) 30)
        ;; habitaciones
        (= (capacidad hab1_c2) 2)
        ;; metrics
        (= (n-denegadas) 0)
    )

    (:goal
        (forall (?p - peticion) (servida ?p))
    )

    (:metric minimize
        (+ (* 1.0 (n-denegadas)) 0)
    )
)
