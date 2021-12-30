(define (problem prueba02)
    (:domain ReservasHotel)
    (:objects
        pet1 pet2 pet3 pet4 - peticion
        hab1 hab2 hab3 - habitacion
        N S E O - direccion)
    (:init
        (= (cantidad pet1) 4) (= (dia-inicio pet1) 15) (= (dia-final pet1) 27) (orientada pet1 N)
        (= (cantidad pet2) 1) (= (dia-inicio pet2) 5) (= (dia-final pet2) 9) (orientada pet2 S)
        (= (cantidad pet3) 1) (= (dia-inicio pet3) 3) (= (dia-final pet3) 4) (orientada pet3 N)
        (= (cantidad pet4) 1) (= (dia-inicio pet4) 6) (= (dia-final pet4) 23) (orientada pet4 O)
        (= (capacidad hab1) 4) (orientada hab1 N)
        (= (capacidad hab2) 1) (orientada hab2 E)
        (= (capacidad hab3) 1) (orientada hab3 S)
        (= (n-denegadas) 0)
        (= (n-orientadas) 0)
    )
    (:goal
        (forall (?p - peticion) (servida ?p)))

    (:metric minimize
        (+ (* 1.0 (n-denegadas)) (* 0.5 (n-orientadas))))
)
