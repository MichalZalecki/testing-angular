'use strict'

angular.module 'filltext.filltext-service', []

.service 'filltext', ['$http', class FillText
  constructor: (@$http) ->
  getRecords: (rows = 10) ->
    @$http.jsonp 'http://filltext.com',
      params:
        rows: rows
        name: '{firstName}'
        surname: '{lastName}'
        callback: 'JSON_CALLBACK'

  getRecordsBackUp: ->
    @$http.get '/filltext.json'
]
