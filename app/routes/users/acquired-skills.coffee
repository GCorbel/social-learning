export default Ember.Route.extend
  model: ->
    @modelFor('users').get('acquired_skills')

