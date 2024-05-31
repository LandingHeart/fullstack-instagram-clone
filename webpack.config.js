const path = require("path");
const isDev = process.env.NODE_ENV === "development";

module.exports = {
  mode: isDev ? "development" : "production",
  entry: ["./views/src/index.js"],
  output: {
    path: path.resolve(__dirname, "views", "public"),
    filename: "bundle.js",
  },
  resolve: {
    extensions: [".js", ".jsx", ".json"],
    modules: [
      path.resolve(__dirname, "views/src/"),
      path.resolve(__dirname, "node_modules"),
    ],
  },
  devServer: {
    static: {
      directory: path.resolve(__dirname, "views", "public"),
    },
    hot: true,
    historyApiFallback: true,
    watchContentBase: true,
  },
  devtool: "eval-source-map",
  module: {
    rules: [
      {
        test: /\.svg$/,
        use: [
          {
            loader: "svg-url-loader",
            options: {
              limit: 10000,
            },
          },
        ],
      },
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
      {
        test: /\.css$/i,
        use: ["style-loader", "css-loader"],
      },
      {
        test: /\.(png|woff|woff2|eot|ttf|svg)$/,
        loader: "url-loader",
        options: {
          limit: 8192,
          outputPath: "/",
        },
      },
    ],
  },
};
