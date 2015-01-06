'use strict'

describe 'myApp', ->

  beforeEach module 'myApp'

  describe 'myApp.myAppCtrl', ->

    myAppCtrl = filltext = scope = null

    beforeEach inject ($controller, $rootScope, _filltext_, $q) ->
      scope = $rootScope.$new()
      filltext = _filltext_

      failHTTPPrimiseMock = ->
        promise = $q.reject()
        promise.success = promise.error = (fn) ->
          fn([])
          promise
        promise

      spyOn(filltext, 'getRecords').and.callFake failHTTPPrimiseMock
      spyOn(filltext, 'getRecordsBackUp').and.callFake failHTTPPrimiseMock

      myAppCtrl = $controller 'myApp.myAppCtrl', {
        $scope: scope, filltext: filltext
      }
      scope.$digest()

    it 'should have scope.people array', ->
      expect(scope.people).toEqual jasmine.any(Array)

    it 'should have scope.notify function', ->
      expect(scope.notify).toEqual jasmine.any(Function)

    it 'should have called filltext.getRecords with 20', ->
      expect(filltext.getRecords).toHaveBeenCalledWith(20)

    it 'should have called filltext.getRecordsBackUp on fail', ->
      expect(filltext.getRecordsBackUp).toHaveBeenCalled
