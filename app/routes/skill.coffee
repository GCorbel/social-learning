export default Ember.Route.extend
  model: (params) ->
    @store.find('skill', params.id)
