export default Ember.Controller.extend
  newSkill: (->
    @store.createRecord('skill')
  ).property('newSkill')
  choosedSkills: (->
    @model.get('searched_skills')
  ).property('choosedSkills')
  skills: (->
    @store.findAll 'skill'
  ).property('skills')
  actions:
    submit: ->
      skill_ids = @model.get('searched_skills').map (skill) ->
        skill.id
      data = @getProperties('description')

      Ember.$.ajax
        url: "http://localhost:3000/api/v1/users/#{@model.id}/update_searched_skills"
        data:
          searched_skill_ids: skill_ids
        type: 'PUT'
