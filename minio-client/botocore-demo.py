
import botocore
import botocore.session 
from time import sleep

BUCKET = "bucket1"

session = botocore.session.get_session()
client = session.create_client("s3",
        use_ssl=False,
        endpoint_url="http://irods-s3-bridge:8080",
        aws_access_key_id="rods",
        aws_secret_access_key="a good key")

#sleep(2)
#print("I'm going to put some files on this")
#for i in range(10):
#    i = '0' + str(i)
#    client.put_object(Bucket=BUCKET, Key=str(i), Body=("0000"+str(i)).encode())
#    client.put_object(Bucket=BUCKET, Key="hehe/"+str(i), Body=("0000"+str(i)).encode())
#
#print("I'm going to get some files from this")
#sleep(2)
#for i in range(10):
#    i = '0'+str(i)
#    print(f"{i}={client.get_object(Bucket=BUCKET, Key=str(i))}")
#
#print("I'm going to list some objects!")
#sleep(2)
#print(client.list_objects_v2(Bucket=BUCKET, EncodingType='url'))
#print(client.list_objects_v2(Bucket=BUCKET,Prefix="hehe", EncodingType='url'))
#
#sleep(2)
#client.delete_object(Bucket=BUCKET, Key="01")
#
#
# Display the signature stuff
session.set_stream_logger('botocore.auth', botocore.logging.DEBUG)

# Make a really big file to make the heuristics decide to not hash the
# file on the client side

with open("bigge", 'w') as f:
    for i in range(300):
        f.write("a"*20*i)
with open('bigge','rb') as f:
    client.put_object(Bucket='bucket1', Key='bigge', Body=f)

