export default Ember.Route.extend
  model: (params) ->
    @store.find('trail', params.id)
