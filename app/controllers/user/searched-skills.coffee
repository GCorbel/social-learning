export default Ember.Controller.extend
  choosedSkills: (->
    @model.get('searched_skills')
  ).property('choosedSkills')
  skills: (->
    @store.findAll 'skill'
  ).property('skills')
  actions:
    delete: (searched_skill) ->
      searched_skill.destroyRecord().then =>
        @get('searched_skills').removeObject(searched_skill)
    submit: ->
      user = @get('user')
      skill = @get('skill')
      searched_skills = @get('searched_skills')

      searched_skill = @store.createRecord('searched-skill')
      searched_skill.set('description', @get('newSkill').get('description'))
      if skill
        searched_skill.set('skill', skill)
        searched_skill.set('skill_id', skill.get('id'))
      searched_skill.set('user_id', user.get('id'))
      searched_skill.set('user', user)

      searched_skill.save().then ->
        searched_skills.pushObject searched_skill
