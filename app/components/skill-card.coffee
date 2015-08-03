export default Ember.Component.extend
  actions:
    delete: ->
      @sendAction 'delete', @get('searched_skill')
