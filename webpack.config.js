const path = require("path");
const isDev = process.env.NODE_ENV === "development";

module.exports = {
  mode: isDev ? "development" : "production",
  entry: ["./views/src/index.js"],
  output: {
    publicPath: "/public/",
    path: path.resolve(__dirname, "views", "public"),
    filename: "bundle.js",
  },
  devServer: {
    static: {
      directory: path.resolve(__dirname, "views", "public"),
    },
    contentBase: path.resolve(__dirname, "views", "public"),
    publicPath: "/public/",
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
