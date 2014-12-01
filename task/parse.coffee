gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
changed = require 'gulp-changed'
straw   = require 'gulp-straw'

$ =
  src:  './src/parse/**/*.coffee'
  dist: './cloud/'
straw.override $ # with package.json

gulp.task 'parse', ->
  gulp.src $.src
  .pipe changed $.dist
  .pipe coffee bare: true
  .pipe gulp.dest $.dist
