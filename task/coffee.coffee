gulp       = require 'gulp'
browserify = require 'browserify'
source     = require 'vinyl-source-stream'
streamify  = require 'gulp-streamify'
uglify     = require 'gulp-uglify'
meta       = require '../package.json'

$ = meta.gulpvars

gulp.task 'coffee', ->
  browserify
    entries: ["#{$.coffeeSrc}/index.coffee"]
    extensions: ['.coffee']
  .bundle()
  .pipe source 'index.js'
  .pipe streamify uglify mangle: false# without mangling for AngularJS
  .pipe gulp.dest "#{$.coffeeDist}/"
