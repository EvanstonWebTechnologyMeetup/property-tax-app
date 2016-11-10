var gulp = require('gulp');
var watch = require('gulp-watch');
var express = require('express');
var parse = require('csv-parse/lib/sync');
var fs = require('fs');
var properties = require('./evanston-properties.json')

// TODO: Add watch & autorefresh

gulp.task('server', function() {
  var app = express();
  app.use(express["static"]('public'));
  app.get('/properties', function (req, res) {
    res.send(properties.splice(0, 50));
  });
  app.listen(8080);
});

gulp.task('default', ['server']);
