export default Ember.Route.extend
  setupController: (controller) ->
    user = @modelFor('dashboard')
    user_id = user.get('id')

    controller.set('acquired_skills', [])

    controller.set('user', user)
    controller.set('newSkill', @store.createRecord('skill'))

    @store.find('acquired_skill', user_id: user_id).then (result) ->
      # Copy the array to avoid immutability
      acquired_skills = result.map (acquired_skill) ->
        acquired_skill

      controller.set('acquired_skills', acquired_skills)
