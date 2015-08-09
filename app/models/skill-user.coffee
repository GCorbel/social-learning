export default DS.Model.extend
  description: DS.attr('string')
  user_id: DS.attr('string')
  skill_id: DS.attr('string')
  user: DS.belongsTo('user', async: true)
  skill: DS.belongsTo('skill', async: true)
  kind: DS.attr('string')
