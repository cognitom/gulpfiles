gulp    = require 'gulp'
changed = require 'gulp-changed'
replace = require 'gulp-replace'
straw   = require 'gulp-straw'

$ =
  src:  './src/*.html'
  dist: './dist/'
straw.override $ # with package.json

gulp.task 'html', ->
  gulp.src $.src
  .pipe changed $.dist
  .pipe replace ".#{$.dist}js/", 'js/'
  .pipe gulp.dest $.dist
