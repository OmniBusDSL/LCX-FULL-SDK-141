(require :drakma)

# POST method not supported for lisp
(defun check_order_status (order_id)
  (let ((url "https://exchange-api.lcx.com/api/trading/order/{order_id}"))
    (drakma:http-request url)))
# POST method not supported for lisp
(defun complete_order_flow (currency)
  (let ((url "https://exchange-api.lcx.com/api/account/balance"))
    (drakma:http-request url)))


# POST method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
# None method not supported for lisp
