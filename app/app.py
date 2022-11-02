from flask import Flask

app_name = 'hello'
app = Flask(app_name)
app.debug = True


@app.route('/hello')
def api_comment_list():
    message = 'Hello World!'
    return message;