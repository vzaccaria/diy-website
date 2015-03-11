
API
=====


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
          _.toFile( "_site/client1.js", _ => { ... })
          })
        _.collect("build2", _ => {
          _.toFile( "_site/client2.js", _ => { ... })
          })
        })
      })
