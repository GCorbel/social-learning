export default Ember.Route.extend
  model: (params) ->
    this.modelFor('user')
