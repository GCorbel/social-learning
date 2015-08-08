export default Ember.Route.extend
  model: (params) ->
    @modelFor('skill').get('acquired_users')

