var axios = require("axios");
var params = { pair: "ETH/BTC" };

var config = {
  method: "post",
  url: "https://exchange-api.lcx.com/api/ticker",
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

axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data))
  })
  .catch(function (error) {
    console.log(error)
  })
