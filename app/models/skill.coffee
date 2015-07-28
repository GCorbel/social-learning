export default DS.Model.extend
  name: DS.attr('string')
  description: DS.attr('string')
  link: DS.attr('string')
  acquired_users: DS.hasMany('users', async: true, inverse: 'acquired_skills')
  searched_users: DS.hasMany('users', async: true, inverse: 'searched_skills')
