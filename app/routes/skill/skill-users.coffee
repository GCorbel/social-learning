export default Ember.Route.extend
  model: (params) ->
    skill_id = @modelFor('skill').get('id')
    @store.find('skill-user', skill_id: skill_id, kind: params.kind)

