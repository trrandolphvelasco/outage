var gulp    = require('gulp');
var pug     = require('gulp-pug');
var clean   = require('gulp-clean');
var exec    = require('child_process').exec;
var fs      = require('fs');

var paths = {
  pug: ['!includes/**/*.pug', '!layout/**/*.pug', './*.pug', '!**/_*.pug', '!node_modules/**/*']
}

gulp.task('default',['clean'], function(cb) {
  var dir = './html';
  if (!fs.existsSync(dir)){
    fs.mkdirSync(dir);
  }
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

/*
  gulp.task('html', function() {
    return gulp.src(paths.pug)
    .pipe(pug({
      doctype: 'html',
      pretty: true
    }))
    .on('error', function(err){
      gutil.log(err.message);
      this.emit('end'); // prevents watch from dying
    })
    .pipe(gulp.dest('./html'));
  });
*/
