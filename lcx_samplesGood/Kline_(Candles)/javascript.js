var axios = require("axios");
var params = {
  pair: "ETH/BTC",
  resolution: "60",
  from: 1608129416,
  to: 1608229416,
};

var config = {
  method: "get",
  url: "https://api-kline.lcx.com/v1/market/kline",
  headers: {
    "Content-Type": "application/json",
  },
  params,
};

axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data));
  })
  .catch(function (error) {
    console.log(error);
  });
