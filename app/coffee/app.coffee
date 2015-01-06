'use strict'

angular.module 'myApp', [
    'alert',
    'moment',
    'filltext'
]

.controller 'myApp.myAppCtrl', [ '$scope', 'filltext', 'recordsCount'
  ($scope, filltext, recordsCount) ->
    $scope.notify = (txt) ->
      console.log "#{txt} has been closed"

    $scope.people = []
    $scope.recordsCount = recordsCount

    ($scope.getRecords = ->

      filltext.getRecords($scope.recordsCount)
        .success (data, status, headers, config) ->
          $scope.people = data
        .error ->
          filltext.getRecordsBackUp()
            .success (data, status, headers, config) ->
              $scope.people = data)()
]

.value 'recordsCount', 20