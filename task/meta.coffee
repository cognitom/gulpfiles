gulp        = require 'gulp'
changed     = require 'gulp-changed'
rename      = require 'gulp-rename'
runSequence = require 'run-sequence'

$ =
  src:     './src/root/*'
  dotfile: './src/root/dotfile/*'
  dist:    './dist/'

gulp.task 'meta', (cb) -> runSequence 'meta-file', 'meta-dotfile', cb

gulp.task 'meta-file', ->
  gulp.src $.src
  .pipe changed $.dist
  .pipe gulp.dest $.dist

gulp.task 'meta-dotfile', ->
  gulp.src $.dotfile
  .pipe changed $.dist
  .pipe rename prefix: '.'
  .pipe gulp.dest $.dist
