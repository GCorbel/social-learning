export default Ember.Component.extend
  setup: (->
    $('.actions').hide()
  ).on 'init'
  actions:
    submit: ->
      searched_skill = @get('searched_skill')
      container = $("#skill-#{searched_skill.get('id')}")
      new_description = container.find('textarea').val()
      searched_skill.set('description', new_description)
      @sendAction 'edit', searched_skill
      container.find('.description').html(new_description)
      container.find('.actions').hide()
    delete: ->
      @sendAction 'delete', @get('searched_skill')
    edit: ->
      searched_skill = @get('searched_skill')
      container = $("#skill-#{searched_skill.get('id')}")
      textarea = $('<textarea/>', text: searched_skill.get('description'))
      container.find('.description').html(textarea)
      container.find('.actions').show()
