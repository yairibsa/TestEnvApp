jQuery(document).on 'turbolinks:load', ->
    comments = $('#comments')
    if comments.length > 0
        App.global_chat = App.cable.subscriptions.create {
            channel: "GuidesChannel"
            guide_id: comments.data('guide_id')
        },
        connected: ->
        disconnected: ->
        received: (data) ->
            comments.append data['comment']
        send_comment: (comment, guide_id) ->
            @perfom 'send_comment', comment: comment, guide_id: guide_id
    $('#new_comment').submit (e) ->
        $this = $(this)
        textarea = $this.find('#comment_content')
        if $.trim(textarea.val()).length > 1
            App.global_chat.send_comment textarea.val(),
            comments.data('guide-id')
            textarea.val('')
        e.preventDefault()
        return false