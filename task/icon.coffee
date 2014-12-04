gulp        = require 'gulp'
rename      = require 'gulp-rename'
sketch      = require 'gulp-sketch'
iconfont    = require 'gulp-iconfont'
consolidate = require 'gulp-consolidate'

$ =
  src:       './src/icon/'
  dist:      './dist/font/'
  name:      'symbols'
  className: 'mi'
  template:  'fontawesome-style'

gulp.task 'icon', ->
  gulp.src "#{$.src}#{$.name}.sketch}"
  .pipe sketch
    export: 'artboards'
    formats: 'svg'
  .pipe iconfont fontName: $.name
  .on 'codepoints', (codepoints) ->
    gulp.src "#{$.src}#{$.template}.*"
    .pipe consolidate 'lodash',
      glyphs: codepoints
      fontName: $.name
      className: $.className
    .pipe rename basename: $.name
    .pipe gulp.dest $.dist
  .pipe gulp.dest $.dist
