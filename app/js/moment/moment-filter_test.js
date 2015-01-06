// Generated by CoffeeScript 1.8.0
(function() {
  'use strict';
  describe('moment', function() {
    beforeEach(module('moment'));
    return describe('moment.moment-filter', function() {
      var $filter, moment;
      moment = $filter = {};
      beforeEach(inject(function(_$filter_) {
        return $filter = _$filter_;
      }));
      it('should use L (MM/DD/YYYY) format by default', function() {
        return expect($filter('moment')("2015-01-07 18:30")).toEqual("01/07/2015");
      });
      it('should say whether date is invalid', function() {
        return expect($filter('moment')("AngularJS")).toEqual("Invalid date");
      });
      it('should work with custom format', function() {
        return expect($filter('moment')("2015-01-07 18:30", "MMMM Do YYYY, h:mm:ss a")).toEqual("January 7th 2015, 6:30:00 pm");
      });
      return it('should work with custom escaped format', function() {
        return expect($filter('moment')("2015-01-07 18:30", "[Hello in] YYYY!")).toEqual("Hello in 2015!");
      });
    });
  });

}).call(this);
