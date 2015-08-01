export default Ember.Controller.extend
  actions:
    submit: ->
      data = @getProperties('email', 'password')
      session = @get('session')
      session.authenticate('authenticator:custom', data).then =>
        session.set('identification', data.identification)
        session.set('user_id', data.user_id)
        this.transitionTo '/'
