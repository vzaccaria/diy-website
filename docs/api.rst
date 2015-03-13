
API
=====

Build primitives
****************

In this section you will find all the primitives that can be used to build a makefile.
The utility section that comes after is just built above these primitives.

.. note::

   All the examples are in Javascript ES6; they use template strings,
   arrow functions and rest and spread parameters.

.. js:function:: generateProject(block)

  :param function block: function describing the construction of a set of targets

  This is the main entry point for the specification of the build process.
  The effect of this function is to generate a makefile in the current directory.

.. js:function:: collect(name, block)

  :param string name: name to be assigned to targets declared in the block
  :param function block: function describing the construction of a set of targets

  Creates a phony target in the makefile associated with the construction of
  the targets declared in the function block. Phony targets creation can
  be organized hierarchically.

  This example creates an ``all`` phony target that will produce, in parallel,
  two sub phony targets (``build1`` and ``build2``); the makefile will contain
  3 targets that can be invoked on the command line (``all``, ``build1`` and ``build2``):

  .. code-block:: javascript

    generateProject(_ => {

      _.collect("all", _ => {
        _.collect("build1", _ => {
          _.toFile( "_site/client1.js", _ => { .. })
          })
        _.collect("build2", _ => {
          _.toFile( "_site/client2.js", _ => { .. })
          })
        })
      })

.. js:function:: collectSeq(name, block)

  :param string name: name to be assigned to targets declared in the block
  :param function block: function describing the construction of a set of targets

  Similar to :js:func:`collect`. However, subtargets are executed serially.
  This example creates an ``all`` phony target that will invoke first ``build1`` then ``build2``.

  .. code-block:: javascript

    generateProject(_ => {

      _.collectSeq("all", _ => {
        _.collect("build1", _ => {
          _.toFile( "_site/client1.js", _ => { ... })
          })
        _.collect("build2", _ => {
          _.toFile( "_site/client2.js", _ => { ... })
          })
        })
      })

.. js:function:: compileFiles(cmd, product, src, deps..)

  :param function cmd: function that generates the command string
  :param function product: function that generates the name of the compiled file
  :param string src: glob representing the source files to be considered
  :param string deps: (one or more) files on which recompilation is dependent on (a part from src)

  This function is the essential building block for declaring transforms for files that require
  compilation. It basically iterates over all the files specified by the glob ``src``, emitting
  the compilation commands through the string generation function ``cmd``. ``cmd`` receives an object
  with ``source`` and ``product`` properties. ``source`` corresponds to the current source being compiled
  while ``product`` is the string generated with the ``product`` function. ``product`` receives an object
  with only a ``source`` property.

  You don't typically use this function alone. In fact, you build arbitrary compile commands from it. For
  example, here we extend the set of available transforms in Diy by introducing a browserify transform
  that we use later on.




  .. code-block:: coffeescript
     :emphasize-lines: 3-7

     generateProject(_ => {

        _.browserify = (dir, ...deps) => {
          var command = (_) => `./node_modules/.bin/browserify -t liveify -t node-lessify  ${_.source} -o ${_.product}`
          var product = (_) => `${_.source.replace(/\..*/, '.bfd.js')}`
          _.compileFiles(...([ command, product, dir ].concat(deps)))
        }

        _.collect("all", _ => {
          _.toFile( "_site/client.js", _ => {
              _.browserify("src/index.ls", "src/**/*.less", "src/**/*.ls")
          })
        })
      }

.. js:function:: toFile(filename, block)

  :param string filename: name of the file that will be created with the results of the block
  :param function block: function describing the construction of a set of targets

  If the block passed as a second parameter produces a single file, i.e., it is
  the result of a concatenation (or other reduction), this command specifies
  that the content should be written into the specified file.

  Here we copy the result of browserify's into ``_site/client.js``:

  .. code-block:: coffeescript
     :emphasize-lines: 4

     generateProject(_ => {

        _.collect("all", _ => {
          _.toFile( "_site/client.js", _ => {
              _.browserify("src/index.ls", "src/**/*.less", "src/**/*.ls")
          })
        })
      }
  .. warning::

    If the child block creates more than one file, the effect is unspecified
    (at the moment).

.. js:function:: processFiles(cmd, product, block)

      :param function cmd: function that generates the command string
      :param function product: function that generates the name of the compiled file
      :param function block: function describing the construction of a set of targets

      This function is the essential building block for declaring transforms for files that have
      already been compiled. It basically iterates over all the files compiled in ``block`` by
      emitting transform commands through the string generation function ``cmd``. As with :js:func:`compileFiles`,
      ``cmd`` receives an object
      with ``source`` and ``product`` properties. ``source`` corresponds to the current source being transformed
      while ``product`` is the string generated with the ``product`` function. ``product`` receives an object
      with only a ``source`` property.

      You don't typically use this function alone. In fact, you build arbitrary transform commands from it.
      For example, here we extend the set of available transforms in Diy by introducing a minification
      transform (``minify``) that invokes ``uglifyjs``. We use it to minify the browserified file on line 10:


      .. code-block:: coffeescript
         :emphasize-lines: 3-6,10

         generateProject(_ => {

            _.minify = (block) =>
               command = (_) => `uglifyjs ${_.source} > ${_.product}`
               product = (_) => `minified-${uid(4)}.js`
               _.processFiles(command, product, block)

            _.collect("all", _ => {
              _.toFile( "_site/client.js", _ => {
                  _.minify( _ => {
                    _.browserify("src/index.ls", "src/**/*.less", "src/**/*.ls")
                  })
              })
            })
          }

      .. warning::

          Product names that are the result of transformations of existing files should ensure that
          there are no name clashes. That is why we used a unique ``id`` generation function ``uid`` for
          our product:

          .. code-block:: coffeescript

            product = (_) => `minified-${uid(4)}.js`


Built in utility functions
**************************

.. js:function:: minify(block)

      :param function block: function describing the construction of a set of targets

      Built-in javascript minification function. Defined as

      .. code-block:: coffeescript

        _.minify = (block) =>
           command = (_) => `uglifyjs ${_.source} > ${_.product}`
           product = (_) => `minified-${uid(4)}.js`
           _.processFiles(command, product, block)
