export default Ember.Route.extend
  model: (params) ->
    @store.createRecord('user')
