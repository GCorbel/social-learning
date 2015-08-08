export default Ember.Route.extend
  model: ->
    user = @modelFor('dashboard')
    user_id = user.get('id')
    Ember.$.getJSON("http://localhost:3000/api/v1/users/#{user_id}/matches")
