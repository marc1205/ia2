(deffacts BH

    (maxCajas 1)
    (problema pedidos pedido naranjas 3 pedido manzanas 3 pedido uvas 1 lineaPedido robot cajasActuales 0 cajas)
)

(defrule cogerCaja
    (declare (salience 50))
    (maxCajas ?numCajas)
    (problema pedidos $?iniPedido pedido ?tipoPale ?cuantosPedido $?finPedido lineaPedido $?lineaPedido robot cajasActuales ?cajasActuales cajas $?cajas)
    (test (< ?cajasActuales ?numCajas )) ; no puede llevar mas del tope
    (test (> ?stockPale 0))
    (test (> ?cuantosPedido 0)) ; que el pedido aun le queden
    =>
    (assert (problema pedidos $?iniPedido pedido ?tipoPale ?cuantosPedido $?finPedido lineaPedido $?lineaPedido robot cajasActuales (+ ?cajasActuales 1) cajas $?cajas ?tipoPale pales $?ini pale ?tipoPale (- ?stockPale 1) $?fin))
)

(defrule dejarCaja
    (declare (salience 60))
    (problema pedidos $?iniPedido pedido ?tipoPale ?cuantosPedido $?finPedido lineaPedido $?lineaPedido robot cajasActuales ?cajasActuales cajas ?caja $?cajas pales $?pales)
    (test (eq ?tipoPale ?caja))
    (test (> ?cajasActuales 0))
    =>
    (assert (problema pedidos $?iniPedido pedido ?tipoPale (- ?cuantosPedido 1) $?finPedido lineaPedido $?lineaPedido ?caja robot cajasActuales (- ?cajasActuales 1) cajas $?cajas pales $?pales))

)

(defrule apilarCaja

)

(defrule desapilarCaja

)