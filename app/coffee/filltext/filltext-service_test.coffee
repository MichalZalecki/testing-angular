'use strict'

describe 'filltext.filltext-service', ->

  beforeEach module 'filltext.filltext-service'

  $httpBackend = null

  beforeEach inject (_$httpBackend_) ->
    $httpBackend = _$httpBackend_
    $httpBackend
      .whenJSONP('http://filltext.com?callback=JSON_CALLBACK' +
        '&name=%7BfirstName%7D&rows=10&surname=%7BlastName%7D')
      .respond [
        { "name": "Yong", "surname": "Thomason" }
        { "name": "Tanny", "surname": "Dykstra" }
        { "name": "Allana", "surname": "Spataro" }
        { "name": "Ben", "surname": "Pervaiz" }
        { "name": "Clarence", "surname": "Schnell" }
        { "name": "Margaret", "surname": "Iliatova" }
        { "name": "Elida", "surname": "Dartmann" }
        { "name": "Raquel", "surname": "Mills" }
        { "name": "Lorena", "surname": "Gullion" }
        { "name": "Sucharitha", "surname": "Ruback" }
      ]

    $httpBackend
      .whenJSONP('http://filltext.com?callback=JSON_CALLBACK' +
        '&name=%7BfirstName%7D&rows=2&surname=%7BlastName%7D')
      .respond [
        { "name": "Yong", "surname": "Thomason" }
        { "name": "Tanny", "surname": "Dykstra" }
      ]

  it 'shoud return array of 10 records by default', inject (filltext) ->
    filltext.getRecords().success (data) ->
      expect(data).toEqual jasmine.any(Array)
      expect(data.length).toBe 10
    $httpBackend.flush()

  it 'shoud return array of 2 records', inject (filltext) ->
    filltext.getRecords(2).success (data) ->
      expect(data).toEqual jasmine.any(Array)
      expect(data.length).toBe 2
    $httpBackend.flush()