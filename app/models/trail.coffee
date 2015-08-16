export default DS.Model.extend
  users: DS.hasMany('users', async: true)
  user_ids: DS.hasMany('users', async: true)
  messages: DS.hasMany('message', async: true)
