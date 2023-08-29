import boto3
import datetime
import pytz
import os


def lambda_handler(event, context):

    aws_region = os.environ['REGION']   
    timezone = os.environ['TIMEZONE']
    ec2_instance_start_time = os.environ['START_TIME']
    ec2_instance_stop_time = os.environ['STOP_TIME']

    ec2 = boto3.client('ec2', region_name=aws_region)
    target_tz = pytz.timezone(timezone)

    current_time_utc = datetime.datetime.now(pytz.utc)
    current_time_target = current_time_utc.astimezone(target_tz)
    
    if current_time_target.hour >= ec2_instance_start_time and current_time_target.hour < ec2_instance_stop_time:
        start_instances(ec2)
    else:
        stop_instances(ec2)

def start_instances(ec2_client):
    response = ec2_client.describe_instances(
        Filters=[
            {
                'Name': 'tag:AutoStartStop',
                'Values': ['true']
            }
        ]
    )

    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            ec2_client.start_instances(InstanceIds=[instance_id])
            print(f'Starting instance: {instance_id}')

def stop_instances(ec2_client):
    response = ec2_client.describe_instances(
        Filters=[
            {
                'Name': 'tag:AutoStartStop',
                'Values': ['true']
            }
        ]
    )

    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            ec2_client.stop_instances(InstanceIds=[instance_id])
            print(f'Stopping instance: {instance_id}')