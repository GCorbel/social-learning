export default Ember.Controller.extend
  choosedSkills: (->
    @model.get('skill_users')
  ).property('choosedSkills')
  skills: (->
    @store.findAll 'skill'
  ).property('skills')
  actions:
    edit: (skill_user) ->
      skill_user.save()
    delete: (skill_user) ->
      skill_user.destroyRecord().then =>
        @get('skill_users').removeObject(skill_user)
    submit: ->
      user = @get('user')
      skill = @get('skill')
      skill_users = @get('skill_users')

      skill_user = @store.createRecord('skill-user')
      skill_user.set('description', @get('newSkillUser').get('description'))
      skill_user.set('kind', 0)
      if skill
        skill_user.set('skill', skill)
        skill_user.set('skill_id', skill.get('id'))
      skill_user.set('user_id', user.get('id'))
      skill_user.set('user', user)

      skill_user.save().then ->
        skill_users.pushObject skill_user
