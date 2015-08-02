export default DS.RESTAdapter.extend
  host: 'http://localhost:3000'
  namespace: 'api/v1'
  pathForType: (type) ->
    Ember.String.pluralize Ember.String.underscore(type)
