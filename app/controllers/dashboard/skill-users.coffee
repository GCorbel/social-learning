export default Ember.Controller.extend
  skills: (->
    @store.find('skill')
  ).property('skills')
  actions:
    edit: (skill_user, defer) ->
      skill_user.save().then ->
        defer.resolve()
    delete: (skill_user) ->
      skill_user.destroyRecord().then =>
        @get('skill_users').removeObject(skill_user)
    submit: ->
      user = @get('user')
      skill_users = @get('skill_users')

      skill_user = @get('newSkillUser')
      skill_user.set('kind', @get('kind'))
      skill_user.set('user_id', user.get('id'))
      skill_user.set('user', user)

      skill_user.save().then =>
        @set('newSkillUser', @store.createRecord('skill-user'))
        @store.find('skill', skill_user.get('skill_id')).then (skill) ->
          skill_user.set('skill', skill)
          skill_users.pushObject skill_user

