'use strict'

describe 'Car', ->

  car = {}

  beforeEach ->
    car = new Car 'Toyota', 'Hilux', 76

    spyOn(car, 'upAndRunning').and.callThrough()

  it 'shoud not have public status', ->
    expect(car.status).toBeUndefined()

  it 'shoud not have public tank capacity', ->
    expect(car.tankCapacity).not.toBeDefined()

  it 'shoud be checked before going for a ride', ->
    car.goForARide(10)
    expect(car.upAndRunning).toHaveBeenCalled()

  it 'shoud be able to return gas status', ->
    expect(car.getGasStatus()).toEqual jasmine.any(Number)

  it 'shoud be able to be tanked up TO', ->
    gasBeforeATankUp = car.getGasStatus()
    car.refuelTo 50
    expect(car.getGasStatus()).toEqual 50
    expect(car.getGasStatus()).toBeGreaterThan gasBeforeATankUp

  it 'shoud be able to be tanked up BY', ->
    gasBeforeATankUp = car.getGasStatus()
    car.refuelBy 10
    expect(car.getGasStatus()).toEqual gasBeforeATankUp + 10
    expect(car.getGasStatus()).toBeGreaterThan gasBeforeATankUp

  it 'shoud run only when gas is available', ->
    car.refuelTo(50)
    car.goForARide(50)
    expect(car.upAndRunning()).toBe false

  it 'shoud use some gas while running', ->
    gasBeforeARide = car.getGasStatus()
    car.goForARide(10)
    expect(car.getGasStatus()).toBeLessThan gasBeforeARide

  it 'shoud not produce more gas while running', ->
    gasBeforeARide = car.getGasStatus()
    expect( -> car.goForARide(-10)).toThrowError("Car have to USE some gas!")
    expect(car.getGasStatus()).toEqual gasBeforeARide

  it 'shoud have tank which cannot be overfill', ->
    expect( -> car.refuelTo(999999))
      .toThrowError("Carefull, you are going to spill!")
    expect( -> car.refuelBy(999999))
      .toThrowError("Carefull, you are going to spill!")

  describe 'name', ->

    it 'should contain manufacturer and model', ->
      expect(car.getName()).toContain 'Toyota'
      expect(car.getName()).toContain 'Hilux'

    it 'should not contain strange characters (other than ^[A-Za-z0-9_- ])', ->
      expect(car.getName()).toMatch /^[\w- ]+$/

  describe 'is new', ->
    it 'should be up and running', ->
      expect(car.upAndRunning()).toBe true

  describe 'is broken', ->
    beforeEach ->
      car.brakeDown()

    it 'should not be up and running', ->
      expect(car.upAndRunning()).toBeFalsy()

    it 'should not be able to run', ->
      expect( -> car.goForARide(10)).toThrowError("Car is broken!")

    it 'but it is Hilux and should be fixable', ->
      car.fix()
      expect(car.upAndRunning()).toBe true

  xit 'this test is pending', ->
    expect(car.upAndRunning()).toBe false

  it 'this test is also pending', ->
    expect(car.upAndRunning()).not.toBe true
    pending()

  xdescribe 'has all suit pending', ->
    it 'this test is not pending but all suit does', ->
      expect(car.upAndRunning()).toBe true