describe 'Demo page', ->

  beforeEach ->
    browser.get 'http://testing-angularjs-michalrazorzalecki.c9.io/app/'

  #
  # Alert
  #

  it 'should have a title', ->
    expect(browser.getTitle())
      .toEqual 'Testing AngularJS with Jasmine and CoffeeScript'

  it 'should have 5 .alert', ->
    expect(element.all(By.css '.alert').count()).toBe 5

  it 'should have 3 .close buttons', ->
    expect(element.all(By.css '.alert .close').count()).toBe 3

  it 'should have number of .alert .close buttons equal .alert-dismissible', ->
    buttons = element.all By.css '.alert .close'
    alertDism = element.all By.css '.alert-dismissible'
    expect(buttons.count()).toEqual alertDism.count()

  it 'should have .alert .close button which can close the alert', ->
    alertDism = element.all By.css '.alert-dismissible'
    expect(alertDism.count()).toBeGreaterThan 0
    element.all(By.css '.alert .close').click()
    expect(alertDism.count()).toBe 0

  #
  # Moment.js
  #

  it 'should not have invalid dates', ->
    expect(element.all(By.css '.moment').getText())
      .not.toContain 'Invalid date'

  #
  # FillText.com
  #

  it 'should have 20 people', ->
    expect(element.all(By.repeater 'person in people').count()).toEqual(20)

  it 'should be able to reload people', ->
    people = element.all(By.repeater 'person in people' ).getText()
    element(By.css '.records-control__btn' ).click()
    browser.waitForAngular()
    peopleReloaded = element.all(By.repeater 'person in people' ).getText()
    expect(people).not.toEqual peopleReloaded

  it 'should be able to load specyfic number of people', ->
    element(By.model 'recordsCount' ).clear().sendKeys '13'
    element(By.css '.records-control__btn' ).click()
    browser.waitForAngular()
    expect(element.all(By.repeater 'person in people' ).count()).toBe 13
