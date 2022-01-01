(define (problem test)
    (:domain ReservasHotel)
    (:objects
        pet1 pet2 pet3 pet4 - peticion
        hab1 hab2 hab3 hab4 hab5 hab6 - habitacion
        N S E O - direccion)
    (:init
        (= (cantidad pet1) 4) (= (dia-inicio pet1) 21) (= (dia-final pet1) 24) (orientada pet1 E)
        (= (cantidad pet2) 2) (= (dia-inicio pet2) 11) (= (dia-final pet2) 13) (orientada pet2 O)
        (= (cantidad pet3) 1) (= (dia-inicio pet3) 29) (= (dia-final pet3) 30) (orientada pet3 N)
        (= (cantidad pet4) 3) (= (dia-inicio pet4) 23) (= (dia-final pet4) 28) (orientada pet4 S)
        (= (capacidad hab1) 4) (orientada hab1 S)
        (= (capacidad hab2) 1) (orientada hab2 N)
        (= (capacidad hab3) 4) (orientada hab3 S)
        (= (capacidad hab4) 3) (orientada hab4 S)
        (= (capacidad hab5) 3) (orientada hab5 S)
        (= (capacidad hab6) 4) (orientada hab6 N)
        (= (n-denegadas) 0)
        (= (n-norientadas) 0)
        (= (n-sobrantes) 0)
        (= (n-abiertas) 0))
    (:goal
        (forall (?p - peticion) (servida ?p)))

    (:metric minimize
        (+ (* 5.0 (n-denegadas)) (+ (* 0.5 (n-norientadas)) (+ (* 0.2 (n-sobrantes)) (* 0.5 (n-abiertas))))))
)
