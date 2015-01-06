'use strict'

describe 'moment.moment-factory', ->

  moment = null

  beforeEach module 'moment.moment-factory'
  beforeEach inject (_moment_) ->
    moment = _moment_

  it 'shoud be windows.moment', ->
    expect(moment).toEqual window.moment
    expect(moment).toEqual jasmine.any(Function)