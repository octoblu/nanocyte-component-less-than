ReturnValue = require 'nanocyte-component-return-value'
LessThan = require '../src/less-than'

describe 'LessThan', ->
  beforeEach ->
    @sut = new LessThan

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an equal left and right', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 2, right: 2}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when called with a lesser left than right', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 1, right: 2}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'

    describe 'when called with a greater left than right', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 6, right: 2}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when left and right are gregorically equal', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 'Jan 1, 2012', right: '2012-01-01'}, message: 'anything'

      it 'should not return the message', ->
        expect(@result).not.to.exist

    describe 'when left is gregorically less than right', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 'Jan 2, 1777', right: '2012-01-01'}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'
