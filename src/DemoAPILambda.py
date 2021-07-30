import json as json

MSG ='Welcome to our demo API, here are the details of your request:'
def lambda_handler(event, context):

    return {
        'statusCode': 200,
        'body':MSG + 
        '\n **Headers** \n' + 
        json.dumps(event['headers']) + 
        '\n **Method** \n'+
        event['httpMethod'] +
        '\n **Body** \n' + 
        json.dumps(event['body']),
        'headers' : {
            "Access-Control-Allow-Origin" : "*"
        }
    }