'use strict'

angular.module 'moment.moment-filter', []

.filter 'moment', [ 'moment', (moment) ->
  (input, format = "L") ->
    moment(input).format(format)
]