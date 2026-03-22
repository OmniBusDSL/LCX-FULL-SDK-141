(require :drakma)

(defun fetch_all_pairs_data (pair)
  (let ((url "https://exchange-api.lcx.com/api/ticker"))
    (drakma:http-request url)))
# Workflow: FetchAllPairsData (sequence)

(defun get_ethusdc_ticker (pair)
  (let ((url "https://exchange-api.lcx.com/api/ticker"))
    (drakma:http-request url)))
(defun get_lcxusdc_ticker (pair)
  (let ((url "https://exchange-api.lcx.com/api/ticker"))
    (drakma:http-request url)))
