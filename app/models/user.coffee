export default DS.Model.extend
  email: DS.attr('string')
  nickname: DS.attr('string')
  acquired_skills: DS.hasMany('skills', async: true, inverse: 'acquired_users')
  searched_skills: DS.hasMany('skills', async: true, inverse: 'searched_users')
