var axios = require("axios");
var params = { coin: "ETH" };

var config = {
  method: "get",
  url: "https://exchange-api.lcx.com/api/balance",
  headers: {
    // auth headers
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
