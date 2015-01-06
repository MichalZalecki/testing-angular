'use strict'

angular.module 'alert.alert-directive', []

.directive 'alert', [ ->
  restrict: 'E',
  transclude: true,
  scope:
    id: '@'
    type: '@'
    dismissible: '='
    callback: '&'
  link: (scope, element, attr) ->
    scope.class = if scope.type? then "alert-#{scope.type}" else ''
    scope.class += if scope.dismissible then ' alert-dismissible' else ''
    scope.close = () ->
      if attr.callback?
        scope.callback({id: scope.id})
      scope.$destroy()
      element.remove()
      return
  template: '
    <div class="alert {{ class }}" role="alert">
      <button ng-if="dismissible" ng-click="close()" type="button" class="close"
        aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div ng-transclude></div>
    </div>
  '
]