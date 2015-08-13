export default Ember.Controller.extend
  actions:
    submit: ->
      @model.save().then =>
        @controllerFor('application').set('message', 'Your account has been modified')
