'use strict'

angular.module 'moment.moment-filter', []

.filter 'moment', [ 'moment', (moment) ->
  (input, format = "L", formatFrom = false) ->
    unless formatFrom
      moment(input, "YYYY-MM-DD HH:mm").format(format)
    else
      moment(input, formatFrom).format(format)
]