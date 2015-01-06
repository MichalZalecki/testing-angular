exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['spec.coffee'],
	multiCapabilities: [{
	  'browserName': 'firefox'
	}, {
	  'browserName': 'chrome'
	}],
	chromeOptions: {
    'args': ['show-fps-counter=true']
  }
}