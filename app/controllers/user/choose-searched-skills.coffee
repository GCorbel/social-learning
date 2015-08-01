export default Ember.Controller.extend
  choosedSkills: (->
    @model.get('skills')
  ).property('choosedSkills')
  skills: (->
    @store.findAll 'skill'
  ).property('skills')
  actions:
    submit: ->
      skill_ids = @model.get('acquired_skills').map (skill) ->
        skill.id

      Ember.$.ajax
        url: "http://localhost:3000/api/v1/users/#{@model.id}/update_searched_skills"
        data:
          skill_ids: skill_ids
        type: 'PUT'
