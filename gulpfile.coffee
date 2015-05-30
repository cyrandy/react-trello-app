require 'coffee-script/register'
gulp     = require 'gulp'
gutil    = require 'gulp-util'
del      = require 'del'
runSequence = require 'run-sequence'
jade     = require 'gulp-jade'

webpack  = require 'webpack'
webpackConfig = require './webpack.config.js'
sass     = require 'gulp-ruby-sass'

bs       = require 'browser-sync'
reload   = bs.reload

basePath = {
  src  : 'src/'
  dest : 'public/'
}

src = {
  template   : "#{basePath.src}template/"
  stylesheet : "#{basePath.src}stylesheets/"
  scripts    : "#{basePath.src}scripts/"
  material   : "#{basePath.src}material/"
}

dest = {
  template   : "#{basePath.dest}"
  stylesheet : "#{basePath.dest}stylesheets/"
  js         : "#{basePath.dest}js/"
  material   : "#{basePath.dest}material/"
}

gulp.task 'clean', (cb) ->
  del "#{basePath.dest}**/*", cb

gulp.task 'jade', ->
  gulp.src "#{src.template}**/*.jade"
    .pipe jade {pretty: true}
    .pipe gulp.dest dest.template

devCompiler = webpack(webpackConfig)
gulp.task "webpack", (callback) ->
  # Run webpack.
  devCompiler.run (err, stats) ->
    throw new gutil.PluginError("webpack", err)  if err
    gutil.log "[webpack]", stats.toString(colors: true)
    callback()
    return

  return

gulp.task 'sass', ->
  sass "#{src.stylesheet}", {
    style: 'expanded'
    compass: true
    require: ['susy']
  }
  .pipe gulp.dest(dest.stylesheet)
  .pipe reload({stream: true})

# gulp.task 'material', ->
#   gulp.src "#{src.material}**/*.!(jpg|jpeg|png|gif|svg)"
#     .pipe gulp.dest(dest.material)
#   gulp.src "#{src.material}**/*.{jpg,jpeg,png,gif,svg}"
#     .pipe imagemin {progressive: true}
#     .pipe gulp.dest(dest.material)

gulp.task 'build', ['jade', 'sass', 'webpack']

gulp.task 'jade-watch', ['jade'], reload
gulp.task 'webpack-watch', ['webpack'], reload
# gulp.task 'coffee-watch', ['browserify'], reload

gulp.task 'browser-sync', ['build'], ->
  bs {
    server: {
      baseDir: 'public/'
      index: 'index.html'
    }
  }
  gulp.watch "#{src.template}**/*.jade", ['jade-watch']
  gulp.watch "#{src.stylesheet}**/*.sass", ['sass']
  gulp.watch "#{src.scripts}**/*", ['webpack-watch']

gulp.task 'default', ->
  runSequence 'clean', 'browser-sync'
