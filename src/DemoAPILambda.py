import json as json

MSG ='Welcome to our demo API, here are the details of your request:'
def lambda_handler(event, context):

    #delete unused AWS auto-added-headers
    headers=event['headers']
    headers.pop('X-Forwarded-For', None)
    headers.pop('X-Forwarded-Proto', None)
    headers.pop('X-Forwarded-Port', None)
    headers.pop('X-Amzn-Trace-Id', None)
    
    return {
        'statusCode': 200,
        'body':MSG + 
        '\n **Headers** \n' + 
        json.dumps(headers) + 
        '\n **Method** \n'+
        event['httpMethod'] +
        '\n **Body** \n' + 
        json.dumps(event['body']),
        'headers' : {
            "Access-Control-Allow-Origin" : "*"
        }
    }