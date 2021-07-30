import json as json

MSG ='Welcome to our demo API, here are the details of your request:'
def lambda_handler(event, context):

    #delete unused AWS auto-added-headers
    headers=event['headers']
    headers.pop('X-Forwarded-For', None)
    headers.pop('X-Forwarded-Proto', None)
    headers.pop('X-Forwarded-Port', None)
    headers.pop('X-Amzn-Trace-Id', None)
    
    headers_list = ''
    for key in headers:
        headers_list+=str(key)+ ": " + str(headers[key]) +'\n'

    return {
        'statusCode': 200,
        'body': MSG + 
        '\n\n ***Headers*** \n' + 
        headers_list + 
        '\n ***Method*** \n'+
        event['httpMethod'] +
        '\n\n ***Body*** \n' + 
        json.dumps(event['body']),
        'headers' : {
            "Access-Control-Allow-Origin" : "*"
        }
    }