export default DS.Model.extend
  description: DS.attr('string')
  user: DS.belongsTo('user')
  skill: DS.belongsTo('skill')
