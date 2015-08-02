export default Ember.Route.extend
  setupController: (controller) ->
    user = @modelFor('user')
    user_id = user.get('id')

    controller.set('searched_skills', [])

    controller.set('user', @modelFor('user'))
    controller.set('newSkill', @store.createRecord('skill'))

    @store.find('searched_skill', user_id: user_id).then (result) ->
      # Copy the array to avoid immutability
      searched_skills = result.map (searched_skill) ->
        searched_skill

      controller.set('searched_skills', searched_skills)
