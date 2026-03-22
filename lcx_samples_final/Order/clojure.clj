(require '[clj-http.client :as client])
(println (:body (client/get "https://exchange-api.lcx.com/api/order")))
