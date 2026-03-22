(require :drakma)

(defun get_account_info ()
  (let ((url "https://exchange-api.lcx.com/api/account"))
    (drakma:http-request url)))
(defun get_balances ()
  (let ((url "https://exchange-api.lcx.com/api/balances"))
    (drakma:http-request url)))
(defun get_asset_balance (asset)
  (let ((url "https://exchange-api.lcx.com/api/balance"))
    (drakma:http-request url)))
(defun get_trading_fees ()
  (let ((url "https://exchange-api.lcx.com/api/fees"))
    (drakma:http-request url)))
(defun get_open_orders (offset, pair)
  (let ((url "https://exchange-api.lcx.com/api/open"))
    (drakma:http-request url)))
(defun get_order_details (orderId)
  (let ((url "https://exchange-api.lcx.com/api/order"))
    (drakma:http-request url)))
(defun get_order_history (offset, pair, fromDate, toDate, side, orderStatus, orderType)
  (let ((url "https://exchange-api.lcx.com/api/orderHistory"))
    (drakma:http-request url)))
(defun get_user_trade_history (offset, pair, fromDate, toDate)
  (let ((url "https://exchange-api.lcx.com/api/uHistory"))
    (drakma:http-request url)))
# POST method not supported for lisp
# PUT method not supported for lisp
# DELETE method not supported for lisp
# DELETE method not supported for lisp
(defun check_balance_workflow ()
  (let ((url "https://exchange-api.lcx.com/api/balances"))
    (drakma:http-request url)))
# Workflow: CheckBalanceWorkflow (sequence)

# None method not supported for lisp
(defun place_order_workflow (BTC/USDC)
  (let ((url "https://exchange-api.lcx.com/api/ticker"))
    (drakma:http-request url)))
# Workflow: PlaceOrderWorkflow (sequence)

# POST method not supported for lisp
(defun get_order_info (order_response)
  (let ((url "https://exchange-api.lcx.com/api/order"))
    (drakma:http-request url)))
# None method not supported for lisp
(defun manage_open_orders_workflow (0)
  (let ((url "https://exchange-api.lcx.com/api/orderHistory"))
    (drakma:http-request url)))
# Workflow: ManageOpenOrdersWorkflow (sequence)

(defun get_trade_history (0)
  (let ((url "https://exchange-api.lcx.com/api/uHistory"))
    (drakma:http-request url)))
# None method not supported for lisp
# PUT method not supported for lisp
# DELETE method not supported for lisp
# None method not supported for lisp
(defun account_monitoring_workflow ()
  (let ((url "https://exchange-api.lcx.com/api/balances"))
    (drakma:http-request url)))
# Workflow: AccountMonitoringWorkflow (sequence)

(defun get_open_orders (0)
  (let ((url "https://exchange-api.lcx.com/api/open"))
    (drakma:http-request url)))
(defun get_fees ()
  (let ((url "https://exchange-api.lcx.com/api/fees"))
    (drakma:http-request url)))
# None method not supported for lisp
