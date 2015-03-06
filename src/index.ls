debug         = require('debug')('diy-website/index')
global.jQuery = require "jquery"
global.$      = global.jQuery

debug "Require finished"

setupStyles = ->
  bootstrap = require('./main.less')
  fontello  = require('./fontello.css')

setupHighlight = ->
  github        = require('./styles/github.css')
  global.hljs   = require "highlight.js"
  global.$(document).ready ->
      debug "Highlighting code"
      hljs.initHighlighting!



setupShareButtons = ->
  require('indiesocial')

setupStyles!
setupHighlight!
setupShareButtons!
