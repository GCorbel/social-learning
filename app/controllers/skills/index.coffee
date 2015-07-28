export default Ember.ArrayController.extend
  actions:
    search: ->
      @set('model', @store.find('skill', { search: @get('search')}))
