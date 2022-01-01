(define (problem prueba04)
    (:domain ReservasHotel)
    (:objects
        pet1 pet2 pet3 pet4 pet5 pet6 - peticion
        hab1 hab2 - habitacion
        N S E O - direccion)
    (:init
        (= (cantidad pet1) 4) (= (dia-inicio pet1) 9) (= (dia-final pet1) 20) (orientada pet1 S)
        (= (cantidad pet2) 2) (= (dia-inicio pet2) 18) (= (dia-final pet2) 30) (orientada pet2 E)
        (= (cantidad pet3) 1) (= (dia-inicio pet3) 9) (= (dia-final pet3) 15) (orientada pet3 O)
        (= (cantidad pet4) 3) (= (dia-inicio pet4) 5) (= (dia-final pet4) 7) (orientada pet4 N)
        (= (cantidad pet5) 1) (= (dia-inicio pet5) 7) (= (dia-final pet5) 29) (orientada pet5 S)
        (= (cantidad pet6) 4) (= (dia-inicio pet6) 21) (= (dia-final pet6) 27) (orientada pet6 S)
        (= (capacidad hab1) 4) (orientada hab1 N)
        (= (capacidad hab2) 3) (orientada hab2 S)
        (= (n-denegadas) 0)
        (= (n-norientadas) 0)
        (= (n-sobrantes) 0)
        (= (n-abiertas) 0))
    (:goal
        (forall (?p - peticion) (servida ?p)))

    (:metric minimize
        (+ (* 2.0 (n-denegadas)) (+ (* 0.5 (n-norientadas)) (+ (* 0.25 (n-sobrantes)) (* 0.1 (n-abiertas))))))
)
