export default Ember.Route.extend
  model: (params) ->
    id = @get('session').get('user_id')
    @store.find('user', id)
