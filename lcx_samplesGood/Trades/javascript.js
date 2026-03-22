var axios = require("axios");
var params = { pair: "ETH/BTC", offset: 1 };

var config = {
  method: "get",
  url: "https://exchange-api.lcx.com/api/uHistory",
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
