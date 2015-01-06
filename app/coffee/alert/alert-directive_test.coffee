'use strict'

describe 'alert.alert-directive', ->

  element = $compile = scope = isolated = {}

  beforeEach module 'alert.alert-directive'
  beforeEach inject (_$compile_ , _$rootScope_) ->
    $compile = _$compile_
    scope = _$rootScope_.$new()

  describe 'default', ->

    beforeEach ->
      element = '<alert>Default alert!</alert>'
      element = $compile(element)(scope)
      scope.$digest()
      isolated = element.isolateScope()

    it 'should have .alert element without additional classes', ->
      # angular.element.find is limited to lookups by tag name
      # expect(element[0].querySelector('.alert').className.trim())
      #   .toEqual 'alert'
      expect(element.find('.alert').attr('class').trim()).toEqual 'alert'

    it 'should not have .alert-dismissible', ->
      expect(element.find('.alert-dismissible').length).toBe 0

    it 'should not have .close button', ->
      expect(element.find('.close').length).toBe 0

    it 'should contain appropriate message', ->
      expect(element.text()).toContain 'Default alert!'

    it 'should have type undefinied', ->
      expect(isolated.type).toBeUndefined()

    it 'should have class empty', ->
      expect(isolated.class).toEqual ''

  describe 'dismissible with success type', ->

    beforeEach ->
      element = '<alert type="success"
        dismissible="true">Not so ordinary alert!</alert>'
      element = $compile(element)(scope)
      scope.$digest()
      isolated = element.isolateScope()
      spyOn(isolated, 'callback')
      spyOn(isolated, 'close').and.callThrough()

    it 'should have .alert-success class', ->
      expect(element.find('.alert-success').length).toBe 1

    it 'should have .alert-dismissible class', ->
      expect(element.find('.alert-dismissible').length).toBe 1

    it 'should have .close button class', ->
      expect(element.find('.close').length).toBe 1

    it 'should have .close button which call scope.close() on click', ->
      element.find('.close').click()
      expect(isolated.close).toHaveBeenCalled()

    it 'should have scope.close() which call callback if defined', ->
      element.find('.close').click()
      expect(isolated.callback).not.toHaveBeenCalled()

  describe 'dismissible with error type and callback', ->

    beforeEach ->
      scope.fn = (id) ->
      element = '<alert type="error" dismissible="true"
        callback="fn(id)" id="someID">Error callback with alert!</alert>'
      element = $compile(element)(scope)
      scope.$digest()
      isolated = element.isolateScope()
      spyOn(isolated, 'callback')

    it 'should have .alert-error class', ->
      expect(element.find('.alert-error').length).toBe 1

    it 'should have scope.close() which call callback with proper id', ->
      element.find('.close').click()
      expect(isolated.callback).toHaveBeenCalledWith({id: isolated.id})

    it 'should destroy scope on click', inject ($rootScope) ->
      expect(isolated.$$destroyed).toBe false
      element.find('.close').click()
      expect(isolated.$$destroyed).toBe true
