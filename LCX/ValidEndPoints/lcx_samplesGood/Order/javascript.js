var axios = require("axios");
var params = { orderId: "e8737c4a-3804-461c-9e67-4fe0af5aeb06" };

var config = {
  method: "get",
  url: "https://exchange-api.lcx.com/api/order",
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
