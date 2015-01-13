gulp       = require 'gulp'
browserify = require 'browserify'
coffeeify  = require 'coffeeify'
debowerify = require 'debowerify'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
streamify  = require 'gulp-streamify'
uglify     = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'
path       = require 'path'

$ =
  src:    './src/coffee/app.coffee'
  dist:   './public/js/'
  mangle: true # set it false for AngularJS

gulp.task 'browserify', ->
  browserify
    entries: [$.src]
    extensions: ['.coffee']
    debug: true
  .transform coffeeify
  .transform debowerify
  .bundle()
  .pipe source "#{path.basename $.src, '.coffee'}.js"
  .pipe buffer()
  .pipe sourcemaps.init loadMaps: true
  .pipe streamify uglify mangle: $.mangle
  .pipe sourcemaps.write './'
  .pipe gulp.dest $.dist
