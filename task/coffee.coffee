gulp     = require 'gulp'
coffee   = require 'gulp-coffee'
uglify   = require 'gulp-uglify'
straw    = require 'gulp-straw'

$ =
  src:  './src/coffee/**/*.coffee'
  dist: './dist/coffee/'
straw.override $ # with package.json

gulp.task 'coffee', ->
  gulp.src $.src
  .pipe coffee()
  .pipe streamify uglify mangle: false# without mangling for AngularJS
  .pipe gulp.dest $.dist
