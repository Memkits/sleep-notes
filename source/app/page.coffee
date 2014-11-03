
React = require 'react'
$ = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'app-page'

  getInitialState: ->
    editing: @props.data.trim().length is 0
    buffer: @props.data

  startEditing: ->
    @setState editing: yes
    setTimeout =>
      node = @refs.text.getDOMNode()
      node.selectionStart = @state.buffer.length
      node.focus()
    , 100

  finishEditing: ->
    @props.onChange @state.buffer
    if @state.buffer.trim().length > 0
      @setState editing: no

  onBufferChange: (event) ->
    @setState buffer: event.target.value

  render: ->
    $.div className: 'app-page',
      if @state.editing
        $.textarea
          ref: 'text'
          className: 'text'
          onBlur: @finishEditing
          value: @state.buffer
          onChange: @onBufferChange
          placeholder: 'edit this...'
      else
        @renderItems()

  renderItems: ->
    @props.data
    .split '\n'
    .filter (x) ->
      x.trim().length > 0
    .map (item, index) =>
      $.div
        key: index
        className: 'item'
        onDoubleClick: @startEditing
        item.trim()