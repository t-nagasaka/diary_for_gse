const { environment } = require("@rails/webpacker");

const webpack = require("webpack");
environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    flatpickr: "flatpickr/dist/flatpickr",
  })
);

module.exports = environment;
