// Get modules
var gulp = require('gulp');
var rename = require("gulp-rename");
var sass = require('gulp-sass');
var postcss = require('gulp-postcss');
var mincss = require('gulp-minify-css');
var autoprefixer = require('autoprefixer-core');
var uglify = require('gulp-uglify');
var imagemin = require('gulp-imagemin');
var svgo = require('gulp-svgo');
var browserSync = require('browser-sync').create();
var reload = browserSync.reload;

// Task serve
gulp.task('serve', function(){
		return browserSync.init(null, {
		proxy: "http://lyw.dev/",
		startPath: "/",
		files: "css/*.css"
	});
});

// Task reload
gulp.task('reload', function(){
	reload();
});

// Task sass
gulp.task('styles', function () {
	gulp.src('scss/*.scss')
		.pipe(sass({errLogToConsole: true}))
		.pipe(postcss([ autoprefixer({ browsers: ['last 2 version', 'IE 8'] }) ]))
		//.pipe(mincss({compatibility: 'ie8'}))
		.pipe(gulp.dest('css'))
        .pipe(reload({stream: true}));
});

// Task scripts
gulp.task('scripts', function() {
	// gulp.src('js/main.js')
	// 	.pipe(uglify())
	// 	.pipe(rename('main.min.js'))
	// 	.pipe(gulp.dest('js'));
});

// Task images
gulp.task('images', function () {
	// gulp.src('images-orig/*.{png,gif,jpg}')
	// 	.pipe(imagemin())
	// 	.pipe(gulp.dest('images/'));
	// gulp.src('images-orig/*.svg')
	// 	.pipe(svgo())
	// 	.pipe(gulp.dest('images/'));
});

// Task watch
gulp.task('watch', function () {
	gulp.watch('scss/**/*.scss', ['styles']);
	gulp.watch('js/**.js', ['scripts']);
	// gulp.watch('images-orig/**', ['images']);
	gulp.watch('templates/**', ['reload']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['styles', 'scripts', 'images', 'watch', 'serve']);