export default Ember.Controller.extend
  actions:
    submit: ->
      @model.save().then =>
        @transitionTo '/'
