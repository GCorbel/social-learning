export default Ember.Controller.extend
  actions:
    submit: ->
      @model.save()
      @transitionTo '/'
