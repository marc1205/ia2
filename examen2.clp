(deffacts BH

    (maxCajas 1)
    (problema bloques bloque tipo A bloque tipo B bloque tipo C bloque tipo D bloque tipo E robot cajasActuales 0 cajas pila 0 pilas)
)

(defrule comprobarBloques
    (declare (salience 60))
    (problema bloques $?iniBloque bloque ?tipoBloque ?cuantosCajas $?finBloque  $?resto)
    (test (= ?cuantosCajas 0))
    =>
    (assert(problema bloques $?iniBloque $?finBloque  $?resto))

)

(defrule comprobarFinal
    (declare (salience 100))
    (problema bloques $?bloque lineaBloque $?resto)
    (test (= (length$ $?pila) 3))
    =>
    (printout t "FIN" crlf)
    (halt)

)

(defrule cogerCaja
    (declare (salience 50))
    (maxCajas ?numCajas)
    (problema bloques $?iniBloque c ?tipoBloque ?cuantosCajas $?finBloque lineaBloque $?lineaBloque robot cajasActuales ?cajasActuales cajas $?cajas)
    (test (< ?cajasActuales ?numCajas )) 
    (test (> ?stockCaja 0))
    (test (> ?cuantosCajas 0)) 
    =>
    (assert (problema bloques $?iniBloque tipo ?tipoBloque ?cuantosCajas $?finBloque lineaBloque $?lineaBloque robot cajasActuales (+ ?cajasActuales 1) cajas $?cajas ?tipoBloque (- ?stockCaja 1) $?fin))
)

(defrule dejarCaja
    (declare (salience 60))
    (problema bloques $?iniBloque tipo ?tipoBloque ?cuantosCajas $?finBloque lineaBloque $?lineaBloque robot cajasActuales ?cajasActuales cajas ?caja $?cajas)
    (test (eq ?tipoBloque ?caja))
    (test (> ?cajasActuales 0))
    =>
    (assert (problema bloques $?iniBloque tipo ?tipoBloque (- ?cuantosCajas 1) $?finBloque lineaBloque $?lineaBloque ?caja robot cajasActuales (- ?cajasActuales 1) cajas $?cajas))

)

(defrule apilarCaja
    (declare (sailence 70))
    (maxCajas ?numCajas)
    (problema bloques $?iniBloque c ?tipoBloque ?cuantosCajas $?finBloque lineaBloque $?lineaBloque robot cajasActuales ?cajasActuales cajas $?cajas pila $?pilas)
    (test (< ?cajasActuales ?numCajas )) 
    (test (> ?pilas 0))
    =>
    (assert (problema bloques $?iniBloque tipo ?tipoBloque ?cuantosCajas $?finBloque lineaBloque $?lineaBloque robot cajasActuales cajas $?cajas ?tipoBloque pila (+ ?pilas 1) $?fin))
)

(defrule desapilarCaja
    (declare (sailence 80))
    (maxCajas ?numCajas)
    (problema bloques $?iniBloque c ?tipoBloque ?cuantosCajas $?finBloque lineaBloque $?lineaBloque robot cajasActuales ?cajasActuales cajas $?cajas pila $?pilas)
    (test (< ?cajasActuales ?numCajas )) 
    (test (> ?pilas 0))
    =>
    (assert (problema bloques $?iniBloque tipo ?tipoBloque ?cuantosCajas $?finBloque lineaBloque $?lineaBloque robot cajasActuales cajas $?cajas ?tipoBloque pila (- ?pilas 1) $?fin))
)
