export default Ember.Route.extend
  model: ->
    @modelFor('users').get('searched_skills')

