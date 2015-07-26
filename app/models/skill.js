import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  link: DS.attr('string'),
  acquired_skills: DS.hasMany('users', { async: true, inverse: 'acquired_skills' } ),
  searched_skills: DS.hasMany('users', { async: true, inverse: 'searched_skills' } )
});
