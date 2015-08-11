export default Ember.Route.extend
  setupController: (controller, params) ->
    user = @modelFor('dashboard')
    user_id = user.get('id')

    controller.set('skill_users', [])

    controller.set('user', user)
    controller.set('newSkillUser', @store.createRecord('skill_user'))
    controller.set('kind', params.kind)

    @store.find('skill_user', user_id: user_id, kind: params.kind).then (result) ->
      # Copy the array to avoid immutability
      skill_users = result.map (skill_user) ->
        skill_user

      controller.set('skill_users', skill_users)
