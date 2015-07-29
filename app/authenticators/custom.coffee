import Ember from 'ember'
import Base from 'simple-auth/authenticators/base'

export default Base.extend
  restore: (data) ->
    new (Ember.RSVP.Promise) (resolve, reject) ->
      if !Ember.isEmpty(data.token)
        resolve data
      else
        reject()

  authenticate: (credentials) ->
    new (Ember.RSVP.Promise) (resolve, reject) ->
      Ember.$.ajax(
        url: 'http://localhost:3000/api/v1/sessions'
        type: 'POST'
        data: session:
          email: credentials.identification
          password: credentials.password
      ).then ((response) ->
        credentials.user_id = response.user_id
        Ember.run ->
          resolve token: response.token
      ), (xhr, status, error) ->
        console.log xhr.responseText
        response = JSON.parse(xhr.responseText)
        Ember.run ->
          reject response.error

  invalidate: (data) ->
    _this = this
    new (Ember.RSVP.Promise) (resolve) ->
      Ember.$.ajax(
        url: 'http://localhost:3000/api/v1/sessions'
        type: 'DELETE').always ->
        resolve()
