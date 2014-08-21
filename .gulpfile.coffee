gulp       = require('gulp')
coffee     = require('gulp-coffee')
sourcemaps = require('gulp-sourcemaps') 
uglify     = require('gulp-uglify')
concat     = require('gulp-concat')
rename     = require('gulp-rename')
gutil      = require('gulp-util')
jade        = require('gulp-jade')


gulp.task 'templates', ->
  gulp.src('src/*.jade')
      .pipe(jade({pretty: true}))
      .pipe(gulp.dest('dist/'))
      .pipe( livereload( server ))

gulp.task 'scripts', ->
  gulp.src('./app/src/*.coffee')
      .pipe(coffee({bare: true}))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest('./build'))

gulp.task 'vendor', ->
  gulp.src('vendor/*.js')
      .pipe(concat('vendor.js'))
      .pipe(gulp.dest('build'))
      .pipe(uglify())
      .pipe(rename('vendor.min.js'))
      .pipe(gulp.dest('build'))
      .on('error', gutil.log)

