(require :drakma)

# POST method not supported for lisp
# POST method not supported for lisp
# POST method not supported for lisp
# PUT method not supported for lisp
# PUT method not supported for lisp
# PUT method not supported for lisp
# DELETE method not supported for lisp
# DELETE method not supported for lisp
(defun get_all_open_orders (offset)
  (let ((url "https://exchange-api.lcx.com/api/open"))
    (drakma:http-request url)))
(defun get_open_orders_for_pair (offset, pair)
  (let ((url "https://exchange-api.lcx.com/api/open"))
    (drakma:http-request url)))
(defun get_open_orders_with_date_range (offset, pair, fromDate, toDate)
  (let ((url "https://exchange-api.lcx.com/api/open"))
    (drakma:http-request url)))
(defun get_single_order_status (orderId)
  (let ((url "https://exchange-api.lcx.com/api/order"))
    (drakma:http-request url)))
(defun get_complete_order_history (offset)
  (let ((url "https://exchange-api.lcx.com/api/orderHistory"))
    (drakma:http-request url)))
(defun get_order_history_for_pair (offset, pair)
  (let ((url "https://exchange-api.lcx.com/api/orderHistory"))
    (drakma:http-request url)))
(defun get_order_history_by_status (offset, orderStatus)
  (let ((url "https://exchange-api.lcx.com/api/orderHistory"))
    (drakma:http-request url)))
(defun get_order_history_by_type (offset, orderType)
  (let ((url "https://exchange-api.lcx.com/api/orderHistory"))
    (drakma:http-request url)))
(defun get_filtered_order_history (offset, pair, fromDate, toDate, side, orderStatus, orderType)
  (let ((url "https://exchange-api.lcx.com/api/orderHistory"))
    (drakma:http-request url)))
(defun get_all_trade_history (offset)
  (let ((url "https://exchange-api.lcx.com/api/uHistory"))
    (drakma:http-request url)))
(defun get_trade_history_for_pair (offset, pair)
  (let ((url "https://exchange-api.lcx.com/api/uHistory"))
    (drakma:http-request url)))
(defun get_trade_history_by_date_range (offset, pair, fromDate, toDate)
  (let ((url "https://exchange-api.lcx.com/api/uHistory"))
    (drakma:http-request url)))
(defun simple_buy_workflow (order_result)
  (let ((url "https://exchange-api.lcx.com/api/order"))
    (drakma:http-request url)))
# Workflow: SimpleBuyWorkflow (sequence)

# None method not supported for lisp
# PUT method not supported for lisp
(defun get_history (0, BTC/USDC)
  (let ((url "https://exchange-api.lcx.com/api/orderHistory"))
    (drakma:http-request url)))
(defun get_trades (0, BTC/USDC)
  (let ((url "https://exchange-api.lcx.com/api/uHistory"))
    (drakma:http-request url)))
# None method not supported for lisp
# DELETE method not supported for lisp
(defun confirm_cancelled (first_order_from_list)
  (let ((url "https://exchange-api.lcx.com/api/order"))
    (drakma:http-request url)))
# None method not supported for lisp
