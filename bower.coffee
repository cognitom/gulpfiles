gulp        = require 'gulp'
rename      = require 'gulp-rename'
bower       = require 'bower'
runSequence = require 'run-sequence'
merge       = require 'merge-stream'
meta        = require './package.json'

$ = meta.gulpvar

gulp.task 'bower', (cb) -> runSequence 'bower-update', 'bower-copy', cb

gulp.task 'bower-install', -> bower.commands.install()
  
gulp.task 'bower-update', -> bower.commands.update()
  
gulp.task 'bower-copy', ->
  bowerSrc =
    for key, val of $.bowerMap
      gulp.src "./bower_components/#{val}"
      .pipe rename basename: key
  merge bowerSrc
  .pipe gulp.dest "#{$.bowerDist}/"
