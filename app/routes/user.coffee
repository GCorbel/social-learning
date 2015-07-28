export default Ember.Route.extend
  model: (params) ->
    this.store.find('user', params.id)
