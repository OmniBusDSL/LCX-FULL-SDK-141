var axios = require("axios");
var params = {
  orderIds: [
    "70aba300-0990-481d-ad76-7bd499f473ab",
    "ecaf000a-8f4c-459a-b105-784c0e0436df",
  ],
};

const transformRequestOptions = (params) => {
  let options = "";
  for (const key in params) {
    if (typeof params[key] !== "object" && params[key]) {
      options += `${key}=${params[key]}&`;
    } else if (
      typeof params[key] === "object" &&
      params[key] &&
      params[key].length
    ) {
      params[key].forEach((el) => {
        options += `${key}=${el}&`;
      });
    }
  }
  return options ? options.slice(0, -1) : options;
};

var config = {
  method: "delete",
  url: "https://exchange-api.lcx.com/order/cancel-all",
  headers: {
    // auth headers
  },
  params,
  paramsSerializer: (params) => transformRequestOptions(params),
};

axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data));
  })
  .catch(function (error) {
    console.log(error);
  });
