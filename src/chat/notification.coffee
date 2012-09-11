exports = window.chat ?= {}

class Notification extends EventEmitter
  @defaultImage: 'http://sourceforge.net/p/acupofjavachat/icon'

  constructor: (@_title, @_message, @_image=Notification.defaultImage) ->
    super
    @notification = webkitNotifications.createNotification(
      @_image, @_title, @_message)

    @notification.onclick = =>
      console.log 'CLICKED'
      @cancel()
      @emit 'clicked'

  show: ->
    @notification.show()

  cancel: ->
    @notification.cancel()

exports.Notification = Notification