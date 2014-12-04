gulp    = require 'gulp'
changed = require 'gulp-changed'
replace = require 'gulp-replace'

$ =
  src:  './src/*.html'
  dist: './dist/'

gulp.task 'html', ->
  gulp.src $.src
  .pipe changed $.dist
  .pipe replace ".#{$.dist}js/", 'js/'
  .pipe gulp.dest $.dist
