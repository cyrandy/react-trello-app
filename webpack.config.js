var path = require('path');
var webpack = require('webpack');

module.exports = {
  entry: [
    // "webpack/hot/dev-server",
    './src/scripts/router'
  ],
  devtool: "eval",
  output: {
    path: path.join(__dirname, "public"),
    publicPath: '/assets/',
    filename: 'bundle.js'
  },
  devServer: {
    contentBase: './public'
  },
  resolveLoader: {
    modulesDirectories: ['node_modules']
  },
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee']
  },
  module: {
    loaders: [
      { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
      { test: /\.coffee$/, loader: 'coffee' },
      {
        test: /\.sass$/,
        loader: "style!css!sass?indentedSyntax&outputStyle=expanded" +
          "includePaths[]=" +
            (path.resolve(__dirname, "./bower_components")) + "&" +
          "includePaths[]=" +
            (path.resolve(__dirname, "./node_modules"))
      }
    ]
  },
  // plugins: [ new webpack.HotModuleReplacementPlugin() ]
};
