var axios = require("axios");
var params = { pair: "LCX/ETH" };

var config = {
  method: "get",
  url: "https://exchange-api.lcx.com/api/book",
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
