fs    = require 'fs'
del   = require 'del'
sds   = require 'sds'
path  = require 'path'
gulp  = require 'gulp'
p     = require('gulp-load-plugins') lazy:false
(eval "#{k} = p.#{k}" for k,v of p)

onError = (err) -> util.log err

gulp.task 'bump', ->
    gulp.src 'package.json'
        .pipe bump()
        .pipe gulp.dest '.'
        
gulp.task 'clean', (c) ->
    del.sync ['grammars/noon.cson']
    c()

gulp.task 'default', ->
                
    gulp.watch '**/*.noon', (s) ->
        cson = path.join path.dirname(s.path), path.basename(s.path, path.extname(s.path)) + '.cson'
        sds.save cson, sds.load s.path
