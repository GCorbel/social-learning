export default Ember.Route.extend
  model: (params) ->
    this.store.find('skill', params.id)
