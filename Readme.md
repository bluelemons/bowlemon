[![Build Status](https://travis-ci.org/bluelemons/bowlemon.svg)](https://travis-ci.org/bluelemons/bowlemon)

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
