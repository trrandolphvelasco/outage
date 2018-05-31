var gulp    = require('gulp');
var pug     = require('gulp-pug');
var clean   = require('gulp-clean');
var exec    = require('child_process').exec;

var paths = {
  pug: ['includes/**/*.pug', 'assets/vendor/**/*.pug', 'layout/**/*.pug', 'partials/**/*.pug', './*.pug', '!**/_*.pug', '!node_modules/**/*']
}

gulp.task('default', ['clean'], function(cb) {
  exec('bash compile.sh', function(err,stdout,stderr) {
    console.log(stdout);
    console.log(stderr);
    cb(err);
  });
});

gulp.task('clean', function() {
  return gulp.src('./html', { read: false })
    .pipe(clean({force: true}));
});
