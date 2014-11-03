
key = 'sleep-notes'
rawData = (localStorage.getItem key)

if rawData
  store = JSON.parse rawData
else
  store =
    night: ''
    morning: ''

window.onbeforeunload = ->
  rawData = JSON.stringify store
  localStorage.setItem key, rawData

exports.get = ->
  store

exports.updateNight = (text) ->
  store.night = text
  @emit()

exports.updateMorning = (text) ->
  store.morning = text
  @emit()