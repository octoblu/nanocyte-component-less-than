ReturnValue = require 'nanocyte-component-return-value'

class LessThan extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = LessThan
