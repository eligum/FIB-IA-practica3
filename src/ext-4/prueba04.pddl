(define (problem prueba04)
    (:domain ReservasHotel)
    (:objects
        pet1 pet2 pet3 pet4 pet5 pet6 - peticion
        hab1 hab2 hab3 hab4 hab5 hab6 - habitacion)
    (:init
        (= (cantidad pet1) 4) (= (dia-inicio pet1) 23) (= (dia-final pet1) 24)
        (= (cantidad pet2) 2) (= (dia-inicio pet2) 15) (= (dia-final pet2) 21)
        (= (cantidad pet3) 1) (= (dia-inicio pet3) 17) (= (dia-final pet3) 28)
        (= (cantidad pet4) 3) (= (dia-inicio pet4) 11) (= (dia-final pet4) 20)
        (= (cantidad pet5) 1) (= (dia-inicio pet5) 22) (= (dia-final pet5) 27)
        (= (cantidad pet6) 4) (= (dia-inicio pet6) 1) (= (dia-final pet6) 6)
        (= (capacidad hab1) 4)
        (= (capacidad hab2) 3)
        (= (capacidad hab3) 3)
        (= (capacidad hab4) 4)
        (= (capacidad hab5) 4)
        (= (capacidad hab6) 2)
        (= (n-denegadas) 0)
        (= (n-sobrantes) 0)
        (= (n-abiertas) 0))
    (:goal
        (forall (?p - peticion) (servida ?p)))

    (:metric minimize
        (+ (* 1.5 (n-denegadas)) (+ (* 0.2 (n-sobrantes)) (* 0.5 (n-abiertas)))))
)
