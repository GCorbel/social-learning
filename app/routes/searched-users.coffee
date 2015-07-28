export default Ember.Route.extend
  model: (params) ->
    this.modelFor('skill').get('searched_users')

