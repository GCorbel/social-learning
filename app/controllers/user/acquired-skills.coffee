export default Ember.Controller.extend
  choosedSkills: (->
    @model.get('acquired_skills')
  ).property('choosedSkills')
  skills: (->
    @store.findAll 'skill'
  ).property('skills')
  actions:
    edit: (acquired_skill) ->
      acquired_skill.save()
    delete: (acquired_skill) ->
      acquired_skill.destroyRecord().then =>
        @get('acquired_skills').removeObject(acquired_skill)
    submit: ->
      user = @get('user')
      skill = @get('skill')
      acquired_skills = @get('acquired_skills')

      acquired_skill = @store.createRecord('acquired-skill')
      acquired_skill.set('description', @get('newSkill').get('description'))
      if skill
        acquired_skill.set('skill', skill)
        acquired_skill.set('skill_id', skill.get('id'))
      acquired_skill.set('user_id', user.get('id'))
      acquired_skill.set('user', user)

      acquired_skill.save().then ->
        acquired_skills.pushObject acquired_skill
