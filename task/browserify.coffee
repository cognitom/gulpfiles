gulp       = require 'gulp'
browserify = require 'browserify'
coffeeify  = require 'coffeeify'
debowerify = require 'debowerify'
source     = require 'vinyl-source-stream'
streamify  = require 'gulp-streamify'
uglify     = require 'gulp-uglify'

$ =
  src:  './src/coffee/index.coffee'
  dist: './dist/js/'

gulp.task 'browserify', ->
  browserify
    entries: [$.src]
    extensions: ['.coffee']
  .transform coffeeify
  .transform debowerify
  .bundle()
  .pipe source 'index.js'
  .pipe streamify uglify mangle: false# without mangling for AngularJS
  .pipe gulp.dest $.dist
