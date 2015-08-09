export default Ember.Route.extend
  model: (params) ->
    user_id = @modelFor('users').get('id')
    @store.find('skill-user', user_id: user_id, kind: params.kind)

