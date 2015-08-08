export default Ember.Route.extend
  model: (params) ->
    @modelFor('skill').get('searched_users')

