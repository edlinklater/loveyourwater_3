let mix = require('laravel-mix')

const themepath = 'themes/loveyourwater'

mix.sass(`${themepath}/scss/styles.scss`, `${themepath}/css/`)
  .sourceMaps(true)
  .options({
    processCssUrls: false,
  });
