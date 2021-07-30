import json as json

MSG ='Welcome to our demo API, here are the details of your request:'
def lambda_handler(event, context):

    #delete unused AWS auto-added-headers
    eh = event['headers']
    headers_list = [f'{header}: {eh[header]}\n' for header in eh if not header.startswith('X-')]

    return {
        'statusCode': 200,
        'body': MSG + 
        '\n\n==Headers==\n' + 
        ''.join(headers_list) + 
        '\n==Method==\n'+
        event['httpMethod'] +
        '\n\n==Body==\n' + 
        json.dumps(event['body']),
        'headers' : {
            "Access-Control-Allow-Origin" : "*"
        }
    }