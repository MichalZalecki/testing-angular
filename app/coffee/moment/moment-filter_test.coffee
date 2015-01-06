'use strict'

describe 'moment', ->

  beforeEach module 'moment'

  describe 'moment.moment-filter', ->

    moment = $filter = {}

    beforeEach inject (_$filter_) ->
      $filter = _$filter_

    it 'should use L (MM/DD/YYYY) format by default', ->
      expect($filter('moment')("2015-01-07 18:30")).toEqual "01/07/2015"

    it 'should say whether date is invalid', ->
      expect($filter('moment')("AngularJS")).toEqual "Invalid date"

    it 'should work with custom format', ->
      expect($filter('moment')("2015-01-07 18:30", "MMMM Do YYYY, h:mm:ss a"))
        .toEqual "January 7th 2015, 6:30:00 pm"

    it 'should work with custom escaped format', ->
      expect($filter('moment')("2015-01-07 18:30", "[Hello in] YYYY!"))
        .toEqual "Hello in 2015!"



