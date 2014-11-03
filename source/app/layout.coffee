
React = require 'react'
$ = React.DOM

store = require '../store'
Page = require './page'

module.exports = React.createFactory React.createClass
  displayName: 'app-layout'

  getInitialState: ->
    time: @getTime()

  getTime: ->
    h = (new Date).getHours()
    if 4 < h < 14 then 'morning' else 'night'

  updateNight: (text) ->
    store.updateNight text

  updateMorning: (text) ->
    store.updateMorning text

  turnNight: ->
    @setState time: 'night'

  turnMorning: ->
    @setState time: 'morning'

  render: ->
    if @state.time is 'night'
      $.div className: 'app-layout is-night',
        $.div className: 'sidebar',
          $.div className: 'section', onClick: @turnMorning, '夜晚'
        Page key: 'night', data: @props.data.night, onChange: @updateNight
    else
      $.div className: 'app-layout is-morning',
        $.div className: 'sidebar',
          $.div className: 'section', onClick: @turnNight, '早晨'
        Page key: 'morning', data: @props.data.morning, onChange: @updateMorning