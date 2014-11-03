
React = require 'react'

store = require './store'
Layout = require './app/layout'

store.emit = ->
  component = Layout
    data: store.get()
  React.render component, document.body

store.emit()