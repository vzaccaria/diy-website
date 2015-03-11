var {
  generateProject
} = require('diy');

var $ = require('lodash')
var uid = require('uid')

generateProject(_ => {

  _.browserify = (dir, ...deps) => {
    var command = (_) => `./node_modules/.bin/browserify -t liveify -t node-lessify  ${_.source} -o ${_.product}`
    var product = (_) => `${_.source.replace(/\..*/, '.bfd.js')}`
    _.compileFiles(...([ command, product, dir ].concat(deps)))
  }

  _.jadeify = (dir, ...deps) => {
    var command = (_) => `./node_modules/.bin/jade ${_.source}`
    var product = (_) => `${_.source.replace(/\..*/, '.html')}`
    _.compileFiles(...([ command, product, dir ].concat(deps)))
  }

  _.bemify = (body) => {
    var command = (_) => `./node_modules/.bin/beml-cli < ${_.source} > ${_.product}`
    var product = (_) => `bemified-${uid(4)}.html`
    _.processFiles(command, product, body)
  }


  _.collect("all", _ => {

    _.toFile( "_site/index.html", _ => {
      _.bemify( _ => {
        _.jadeify("src/index.jade")
      })
    })

    _.mirrorTo("_site/fonts", { strip: 'src/fonts/' }, _ => {
      _.copy("src/fonts/*.{eot,woff,woff2,ttf,svg}")
    })

    _.mirrorTo("_site/demo", { strip: 'example/' }, _ => {
      _.copy("example/configure.js")
      _.copy("example/makefile")
    })

    _.mirrorTo("_site", { strip: 'src/' }, _ => {
      _.copy("src/images/*")
    })

    _.toFile( "_site/client.js", _ => {
        _.browserify("src/js/index.ls", "src/**/*.less", "src/**/*.ls")
    })

    _.cmd("sphinx-build -b html docs _site/docs", "docs/**/*.rst")
  })

  _.collectSeq("up", _ => {
    _.cmd("make clean")
    _.cmd("rm -rf _site")
    _.cmd("./node_modules/.bin/babel ./configure.js | node")
  })

  _.collect("start", _ => {
    _.startWatch("_site/**/*")
    _.startServe("_site")
  })
  _.collect("stop", _ => {
    _.stopWatch()
    _.stopServe()
  })
}, {
  productName: "diy-website"
})
