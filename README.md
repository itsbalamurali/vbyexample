# V by Example

Content and build toolchain for [V by Example](https://vbyexample.com),
a site that teaches V via annotated example programs.

### Overview

The V by Example site is built by extracting code and
comments from source files in `examples` and rendering
them via the `templates` into a static `public`
directory. The programs implementing this build process
are in `tools`, along with some vendor'd dependencies
in `vendor`.

The built `public` directory can be served by any
static content system. The production site uses S3 and
CloudFront, for example.

### Building

[![Build Status](https://travis-ci.com/itsbalamurali/vbyexample.svg "Travis CI status")](https://travis-ci.com/itsbalamurali/vbyexample)

To build the site you'll need Go, V and Python installed. Run:

```console
$ go get github.com/russross/blackfriday
$ tools/build
$ open public/index.html
```

To build continuously in a loop:

```console
$ tools/build-loop
```

### Publishing

To upload the site:

```console
$ gem install aws-sdk
$ export AWS_ACCESS_KEY_ID=...
$ export AWS_SECRET_ACCESS_KEY=...
$ tools/upload
```

### License

This work is copyright Balamurali Pandranki and licensed under a
[Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).

The V is copyright [Alexander Medvednikov](https://vlang.io/) and licensed under a
[MIT License](https://github.com/vlang/v/blob/master/LICENSE).

### Thanks

Thanks to [Mark McGranaghan](https://github.com/mmcgrana) for [GoByExample](http://gobyexample.com/), which inspired this project.
