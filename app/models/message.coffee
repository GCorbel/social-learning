export default DS.Model.extend
  body: DS.attr('string')
  trail_id: DS.attr('string')
  trail: DS.belongsTo('trail', async: true)
  created_at: DS.attr('string')
