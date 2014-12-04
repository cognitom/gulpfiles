# gulpfiles

This is the repo for tracking my gulpfiles. Use this repo with [gulp-straw](https://github.com/cognitom/gulp-straw) which help managing and updating gulpfiles.

| taskfile | defined tasks |
| :-- | :-- |
| [gulpfile](gulpfile.coffee) | `default` `clean` `watch` |
| [task/bower](task/bower.coffee) | `bower` `bower-install` `bower-update` `bower-copy` |
| [task/browserify](task/browserify.coffee) | `browserify` |
| [task/coffee](task/coffee.coffee) | `coffee` |
| [task/css](task/css.coffee) | `css` `css-lint` |
| [task/icon](task/icon.coffee) | `icon` |
| [task/parse](task/parse.coffee) | `parse` |

## Getting Started

[gulp.js](https://github.com/gulpjs/gulp) and [gulp-straw](https://github.com/cognitom/gulp-straw) is required.

```bash
$ npm install -g gulp
$ npm install -g gulp-straw
```

You need to `setup` to work with your own (cloned) repo. See also [Installation section of gulp-straw](https://github.com/cognitom/gulp-straw#installation).

```bash
$ straw setup
```

Then, get gulpfiles from your repo:

```bash
$ straw install gulpfile
$ straw install task/css
```

Or, get gulpfiles from other's:

```bash
$ straw install cognitom:gulpfile
$ straw install cognitom:task/css
```

See also [Getting Started section of gulp-straw](https://github.com/cognitom/gulp-straw#getting-started).
