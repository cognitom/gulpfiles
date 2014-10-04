gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
changed = require 'gulp-changed'
meta    = require '../package.json'

$ = meta.gulpvars
    
gulp.task 'parse', ->
  gulp.src ["#{$.parseSrc}/**/*.coffee"]
  .pipe changed "#{$.parseDist}/"
  .pipe coffee bare: true
  .pipe gulp.dest "#{$.parseDist}/"
