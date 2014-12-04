gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
changed = require 'gulp-changed'

$ =
  src:  './src/parse/**/*.coffee'
  dist: './cloud/'

gulp.task 'parse', ->
  gulp.src $.src
  .pipe changed $.dist
  .pipe coffee bare: true
  .pipe gulp.dest $.dist
