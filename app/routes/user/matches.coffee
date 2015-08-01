export default Ember.Route.extend
  model: ->
    Ember.$.getJSON('http://localhost:3000/api/v1/users/1/matches')
