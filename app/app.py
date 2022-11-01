from flask import Flask
from flask import jsonify
from flask import request

app_name = 'hello'
app = Flask(app_name)
app.debug = True

comments = {}

@app.route('/hello')
def api_comment_list():
    message = 'Hello World!'
    return message;
    
    
    
#def api_comment_new():
#    request_data = request.get_json()
#
#    email = request_data['email']
#    comment = request_data['comment']
#    content_id = '{}'.format(request_data['content_id'])
#    new_comment = {
#            'email': email,
#            'comment': comment,
#            }
#
#    if content_id in comments:
#        comments[content_id].append(new_comment)
#    else:
#        comments[content_id] = [new_comment]
#
#    message = 'comment created and associated with content_id {}'.format(content_id)
#    response = {
#            'status': 'SUCCESS',
#            'message': message,
#            }
#    return jsonify(response)
