export default Ember.Controller.extend
  actions:
    submit: ->
      data = @getProperties('identification', 'password')
      session = @get('session')
      session.authenticate('authenticator:custom', data).then =>
        session.set('identification', data.identification)
        this.transitionTo '/'
