export default Ember.Route.extend
  model: (params) ->
    this.modelFor('skill').get('acquired_users')

