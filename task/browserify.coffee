gulp       = require 'gulp'
browserify = require 'browserify'
coffeeify  = require 'coffeeify'
debowerify = require 'debowerify'
source     = require 'vinyl-source-stream'
streamify  = require 'gulp-streamify'
uglify     = require 'gulp-uglify'
straw      = require 'gulp-straw'

$ =
  src:  './src/coffee/index.coffee'
  dist: './dist/coffee/'
straw.override $ # with package.json

gulp.task 'coffee', ->
  browserify
    entries: [$.src]
    extensions: ['.coffee']
  .transform coffeeify
  .transform debowerify
  .bundle()
  .pipe source 'index.js'
  .pipe streamify uglify mangle: false# without mangling for AngularJS
  .pipe gulp.dest $.dist
