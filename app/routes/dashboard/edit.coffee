export default Ember.Route.extend
  model: (params) ->
    @modelFor('dashboard')
