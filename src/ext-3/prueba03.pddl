(define (problem test03)
    (:domain ReservasHotel)
    (:objects
        pet1 pet2 pet3 - peticion
        hab1 hab2 hab3 hab4 hab5 - habitacion)
    (:init
        (= (cantidad pet1) 1) (= (dia-inicio pet1) 5) (= (dia-final pet1) 12)
        (= (cantidad pet2) 2) (= (dia-inicio pet2) 9) (= (dia-final pet2) 20)
        (= (cantidad pet3) 1) (= (dia-inicio pet3) 8) (= (dia-final pet3) 27)
        (= (capacidad hab1) 1)
        (= (capacidad hab2) 2)
        (= (capacidad hab3) 3)
        (= (capacidad hab4) 4)
        (= (capacidad hab5) 2)
        (= (n-denegadas) 0)
        (= (n-sobrantes) 0))
    (:goal
        (forall (?p - peticion) (servida ?p)))

    (:metric minimize
        (+ (* 1.0 (n-denegadas)) (* 0.25 (n-sobrantes))))
)
