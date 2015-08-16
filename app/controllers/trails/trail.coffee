export default Ember.Controller.extend
  new_message:(->
    @store.createRecord('message')
  ).property('message')
  actions:
    submit: ->
      trail = @get('model')
      newMessage = @get('new_message')
      newMessage.set('trail_id', trail.id)
      newMessage.save().then =>
        trail.get('messages').unshiftObject(newMessage)
        @set('new_message', @store.createRecord('message'))
