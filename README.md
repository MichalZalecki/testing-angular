# Testing AngularJS with Jasmine and CoffeeScript

## Instalation

You just have to run `npm install` and `bower install`.

## How project was setted up

To set up such project from scrach you need basically three things.
Firstly [Node.js](http://nodejs.org/) with `npm`, secondly Bower and last but
not least [Karma](http://karma-runner.github.io/) test runner.

```
npm init
npm install karma --save-dev
npm install karma-jasmine --save-dev
npm install karma-phantomjs-launcher --save-dev
npm install karma-coffee-preprocessor --save-dev
npm install karma-html-reporter --save-dev
npm install -g karma-cli
npm install -g http-server
karma init karma.conf.coffee
bower init
bower install angular --save
bower install angular-mocks --save-dev
bower install jquery --save-dev
bower install moment --save
```