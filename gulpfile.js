var gulp = require('gulp'),
    less = require('gulp-less'),
    livereload = require('gulp-livereload');

gulp.task('less', function() {
  gulp.src('less/*.less')
    .pipe(less())
    .pipe(gulp.dest('build/css'));
});

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch('less/**', ['less'])
  gulp.watch('build/**').on('change', livereload.changed);
});
