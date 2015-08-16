export default Ember.ArrayController.extend
  actions:
    createNewTrail: (user) ->
      trail = @store.createRecord('trail')

      id = @get('session').get('user_id')
      @store.find('user', id).then (current_user) =>

        trail.get('user_ids').pushObject(current_user)
        trail.get('user_ids').pushObject(user)

        trail.save().then =>
          @transitionTo('trails.trail', trail.get('id'))
