gulp         = require 'gulp'
cssimport    = require 'gulp-cssimport'
autoprefixer = require 'gulp-autoprefixer'
minifyCss    = require 'gulp-minify-css'
csslint      = require 'gulp-csslint'
notify       = require 'gulp-notify'
meta         = require './package.json'

$ = meta.gulpvar

gulp.task 'css', ->
  gulp.src ["#{$.cssSrc}/style.css"]
  .pipe cssimport()
  .pipe autoprefixer 'last 2 versions'
  .pipe minifyCss keepSpecialComments: 0
  .pipe gulp.dest "#{$.cssDist}/"

gulp.task 'css-lint', ->
  gulp.src ["#{$.cssSrc}/**/*.css"]
  .pipe csslint()
  .pipe csslint.reporter()
  .pipe notify (file) -> "#{file.relative} (#{file.csslint.results.length} errors)" unless file.csslint.success  
