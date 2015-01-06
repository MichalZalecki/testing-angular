'use strict'

class Car
    status = {}

    constructor: (@manufacturer, @model, tankCapacity) ->
        status.tankCapacity = tankCapacity
        status.gas = tankCapacity / 2
        status.broken = false

    upAndRunning: () ->
        status.gas > 0 and !status.broken

    getName: () ->
        "#{@manufacturer} #{@model}"

    getGasStatus: () ->
        status.gas

    goForARide: (gas) ->
        if gas > 0
            if gas <= status.tankCapacity
                if this.upAndRunning()
                    return status.gas -= gas
                else
                    throw new Error "Car is broken!"
            else
                status.gas = 0
                throw new Error "Car run out of gas!"
        else
            throw new Error "Car have to USE some gas!"

    brakeDown: () ->
        status.broken = true

    fix: () ->
        status.broken = false

    refuelBy: (gas) ->
        if status.gas + gas <= status.tankCapacity
            status.gas += gas
        else
            throw new Error "Carefull, you are going to spill!"

    refuelTo: (gas) ->
        if gas <= status.tankCapacity
            status.gas = gas
        else
            throw new Error "Carefull, you are going to spill!"
