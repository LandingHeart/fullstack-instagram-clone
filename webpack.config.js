const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

const isDev = process.env.NODE_ENV === "development";
module.exports = {
  mode: "development",
  entry: ["./views/src/index.js"],
  output: {
    // publicPath: "/",
    path: __dirname + "/views/public/",
    filename: "bundle.js",
  },
  devServer: {
    static: {
      directory: path.join(__dirname, "public"),
    },
    hot: true,
    historyApiFallback: true,
    watchContentBase: true,
  },
  resolve: {
    extensions: [".js", ".jsx"],
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
        test: /\.(js|jsx)$/, // .js and .jsx files
        exclude: /node_modules/, // excluding the node_modules folder
        use: {
          loader: "babel-loader",
        },
      },
      {
        test: /\.css$/i, // to import css
        use: ["style-loader", "css-loader"],
      },
      {
        test: /\.(png|woff|woff2|eot|ttf|svg)$/, // to import images and fonts
        loader: "file-loader",
        options: { limit: false },
      },
    ],
  },
};
