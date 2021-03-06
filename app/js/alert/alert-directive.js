// Generated by CoffeeScript 1.8.0
(function() {
  'use strict';
  angular.module('alert.alert-directive', []).directive('alert', [
    function() {
      return {
        restrict: 'E',
        transclude: true,
        scope: {
          id: '@',
          type: '@',
          dismissible: '=',
          callback: '&'
        },
        link: function(scope, element, attr) {
          scope["class"] = scope.type != null ? "alert-" + scope.type : '';
          scope["class"] += scope.dismissible ? ' alert-dismissible' : '';
          return scope.close = function() {
            if (attr.callback != null) {
              scope.callback({
                id: scope.id
              });
            }
            scope.$destroy();
            element.remove();
          };
        },
        template: '<div class="alert {{ class }}" role="alert"> <button ng-if="dismissible" ng-click="close()" type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button> <div ng-transclude></div> </div>'
      };
    }
  ]);

}).call(this);
