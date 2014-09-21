[![Build Status](https://travis-ci.org/bluelemons/bowlemon.svg)](https://travis-ci.org/bluelemons/bowlemon)
[![Code Climate](https://codeclimate.com/github/bluelemons/bowlemon/badges/gpa.svg)](https://codeclimate.com/github/bluelemons/bowlemon)
[![Test Coverage](https://codeclimate.com/github/bluelemons/bowlemon/badges/coverage.svg)](https://codeclimate.com/github/bluelemons/bowlemon)

# Bowling
this is a sinatra application to keep record of bowlings games.

## Install

    git clone git@github.com:bluelemons/bowlemon.git

    cd bowlemon

    bundle

## Usage

    ruby app.rb

### Create a new game

    /games/new

### Push information

   PUT /lines/:line?shoot=4

## console

    irb
    require './app'

## test

    rake test
