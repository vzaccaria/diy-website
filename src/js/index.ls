debug         = require('debug')('diy-website/index')
global.jQuery = require "jquery"
global.$      = global.jQuery

debug "Require finished"

setupStyles = ->
  bootstrap = require('../less/main.less')
  fontello  = require('../less/fontello.css')

setupHighlight = ->
  github        = require('../less/styles/github.css')
  global.hljs   = require "highlight.js"
  global.$(document).ready ->
      debug "Highlighting code"
      hljs.initHighlighting!



setupShareButtons = ->
  require('indiesocial')

setupStyles!
setupHighlight!
setupShareButtons!
