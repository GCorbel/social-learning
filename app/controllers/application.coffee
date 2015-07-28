export default Ember.Controller.extend
  actions:
    invalidateSession: ->
      return @get('session').invalidate()
