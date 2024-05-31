module.exports = {
  presets: [
    "@babel/preset-env",
    ["@babel/preset-react", { runtime: "automatic" }],
  ],
  plugins: [
    [
      "module-resolver",
      {
        root: ["./"],
        alias: {
          test: "./test",
        },
      },
    ],
  ],
};
