path = require 'path'
webpack = require 'webpack'
HtmlWebpackPlugin = require 'html-webpack-plugin'

module.exports =
  entry: './src/client/client.coffee'
  output:
    filename: "app-#{Date.now()}.js"
    path: path.resolve __dirname, 'public'
  module:
    loaders: [
        test: /\.coffee$/
        loader: 'coffee-loader'
      ,
        test: /\.pug$/
        loader: 'pug'
      ,
        test: /\.json$/
        loader: 'json'
      ,
        test: /\.styl$/
        loader: 'style!css!stylus?resolve url'
    ]
  plugins: [
      new webpack.optimize.UglifyJsPlugin(
        compress: true
        comments: false
        mangle: false
        stats: true
      )
    ,
      new HtmlWebpackPlugin(
        filename: 'index.html'
        template: './src/client/index.pug'
      )
    ]
