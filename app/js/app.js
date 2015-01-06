// Generated by CoffeeScript 1.8.0
(function() {
  'use strict';
  angular.module('myApp', ['alert', 'moment', 'filltext']).controller('myApp.myAppCtrl', [
    '$scope', 'filltext', 'recordsCount', function($scope, filltext, recordsCount) {
      $scope.notify = function(txt) {
        return console.log("" + txt + " has been closed");
      };
      $scope.people = [];
      $scope.recordsCount = recordsCount;
      return ($scope.getRecords = function() {
        return filltext.getRecords($scope.recordsCount).success(function(data, status, headers, config) {
          return $scope.people = data;
        }).error(function() {
          return filltext.getRecordsBackUp().success(function(data, status, headers, config) {
            return $scope.people = data;
          });
        });
      })();
    }
  ]).value('recordsCount', 20);

}).call(this);
