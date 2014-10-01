gulp        = require 'gulp'
runSequence = require 'run-sequence'
requireDir  = require 'require-dir'
dir         = requireDir './task'
del         = require 'del'
browserSync = require 'browser-sync'
reload      = browserSync.reload
meta        = require './package.json'

$ = meta.gulpvar

gulp.task 'default', (cb) -> runSequence 'clean', ['coffee'], cb

gulp.task 'clean', (cb) -> del [$.dist], -> cb()

gulp.task 'watch', ->
  browserSync.init
    notify: false
    server: baseDir: "#{$.dist}/"
  o = debounceDelay: 3000
  gulp.watch ["#{$.coffeeDist}/**/*.coffee"], o, ['coffee']
  gulp.watch ["#{$.cssDist}/**/*.css"], o, ['css']
  gulp.watch ["#{$.dist}/**/*.css", "#{$.dist}/**/*.html"], o, reload
