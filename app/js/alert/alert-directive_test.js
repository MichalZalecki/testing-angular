// Generated by CoffeeScript 1.8.0
(function() {
  'use strict';
  describe('alert.alert-directive', function() {
    var $compile, element, isolated, scope;
    element = $compile = scope = isolated = {};
    beforeEach(module('alert.alert-directive'));
    beforeEach(inject(function(_$compile_, _$rootScope_) {
      $compile = _$compile_;
      return scope = _$rootScope_.$new();
    }));
    describe('default', function() {
      beforeEach(function() {
        element = '<alert>Default alert!</alert>';
        element = $compile(element)(scope);
        scope.$digest();
        return isolated = element.isolateScope();
      });
      it('should have .alert element without additional classes', function() {
        return expect(element.find('.alert').attr('class').trim()).toEqual('alert');
      });
      it('should not have .alert-dismissible', function() {
        return expect(element.find('.alert-dismissible').length).toBe(0);
      });
      it('should not have .close button', function() {
        return expect(element.find('.close').length).toBe(0);
      });
      it('should contain appropriate message', function() {
        return expect(element.text()).toContain('Default alert!');
      });
      it('should have type undefinied', function() {
        return expect(isolated.type).toBeUndefined();
      });
      return it('should have class empty', function() {
        return expect(isolated["class"]).toEqual('');
      });
    });
    describe('dismissible with success type', function() {
      beforeEach(function() {
        element = '<alert type="success" dismissible="true">Not so ordinary alert!</alert>';
        element = $compile(element)(scope);
        scope.$digest();
        isolated = element.isolateScope();
        spyOn(isolated, 'callback');
        return spyOn(isolated, 'close').and.callThrough();
      });
      it('should have .alert-success class', function() {
        return expect(element.find('.alert-success').length).toBe(1);
      });
      it('should have .alert-dismissible class', function() {
        return expect(element.find('.alert-dismissible').length).toBe(1);
      });
      it('should have .close button class', function() {
        return expect(element.find('.close').length).toBe(1);
      });
      it('should have .close button which call scope.close() on click', function() {
        element.find('.close').click();
        return expect(isolated.close).toHaveBeenCalled();
      });
      return it('should have scope.close() which call callback if defined', function() {
        element.find('.close').click();
        return expect(isolated.callback).not.toHaveBeenCalled();
      });
    });
    return describe('dismissible with error type and callback', function() {
      beforeEach(function() {
        scope.fn = function(id) {};
        element = '<alert type="error" dismissible="true" callback="fn(id)" id="someID">Error callback with alert!</alert>';
        element = $compile(element)(scope);
        scope.$digest();
        isolated = element.isolateScope();
        return spyOn(isolated, 'callback');
      });
      it('should have .alert-error class', function() {
        return expect(element.find('.alert-error').length).toBe(1);
      });
      it('should have scope.close() which call callback with proper id', function() {
        element.find('.close').click();
        return expect(isolated.callback).toHaveBeenCalledWith({
          id: isolated.id
        });
      });
      return it('should destroy scope on click', inject(function($rootScope) {
        expect(isolated.$$destroyed).toBe(false);
        element.find('.close').click();
        return expect(isolated.$$destroyed).toBe(true);
      }));
    });
  });

}).call(this);
