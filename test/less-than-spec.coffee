ReturnValue = require 'nanocyte-component-return-value'
LessThan = require '../src/less-than'

describe 'LessThan', ->
  beforeEach ->
    @sut = new LessThan

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({message: 'anything'})).to.deep.equal 'anything'
