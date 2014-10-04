gulp        = require 'gulp'
rename      = require 'gulp-rename'
sketch      = require 'gulp-sketch'
iconfont    = require 'gulp-iconfont'
consolidate = require 'gulp-consolidate'
meta        = require '../package.json'

$ = meta.gulpvars

gulp.task 'icon', ->
  gulp.src "#{$.iconSrc}/#{$.iconName}.sketch}"
  .pipe sketch
    export: 'artboards'
    formats: 'svg'
  .pipe iconfont fontName: $.iconName
  .on 'codepoints', (codepoints) ->
    gulp.src "#{$.iconSrc}/#{$.iconTemplate}.*"
    .pipe consolidate 'lodash',
      glyphs: codepoints
      fontName: $.iconName
      className: $.iconClass
    .pipe rename basename: $.iconName
    .pipe gulp.dest "#{$.iconDist}/"
  .pipe gulp.dest "#{$.iconDist}/"
