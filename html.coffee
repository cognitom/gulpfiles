gulp    = require 'gulp'
changed = require 'gulp-changed'
replace = require 'gulp-replace'
meta    = require './package.json'

$ = meta.gulpvar

gulp.task 'html', ->
  gulp.src ["#{$.htmlSrc}/*.html"]
  .pipe changed "#{$.htmlDist}/"
  .pipe replace ".#{$.htmlDist}/js/", 'js/'
  .pipe gulp.dest "#{$.htmlDist}/"
