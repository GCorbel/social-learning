export default Ember.Component.extend
  setup: (->
    $('select').select2({theme: 'bootstrap'})
  ).on 'didInsertElement'
  actions:
    submit: ->
      @sendAction 'submit'
