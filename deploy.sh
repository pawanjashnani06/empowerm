#!/usr/bin/env bash

# more bash-friendly output for jq
JQ="jq --raw-output --exit-status"


FAMILY="empowerm"
CLUSTER="empowerm"
SERVICES="empowerm"
REGION="ap-south-1"
CONTAINER_NAME="empowerm"
AWS_ACCOUNT_ID="223414129485"

configure_aws_cli(){
	aws --version
	aws configure set default.region ${REGION}
	aws configure set default.output json
}

deploy_cluster() {
    make_task_def
    register_definition

}

make_task_def(){
	task_template='[
		{
			"name": "empowerm",
			"image": "'${AWS_ACCOUNT_ID}'.dkr.ecr.'${REGION}'.amazonaws.com/empowerm:latest",
			"essential": true,
			"memory": 500,
			"cpu": 10,
			"portMappings": [
				{
					"hostPort": 80,
					"containerPort": 8080,
					"protocol": "tcp"
				}
			]
		}
	]'
  echo $task_template
	task_def=$(printf "$task_template" $AWS_ACCOUNT_ID latest)
}

register_definition() {

    if revision=$(aws ecs register-task-definition --container-definitions "$task_def" --family ${FAMILY} | $JQ '.taskDefinition.taskDefinitionArn'); then
        echo "Revision: $revision"
    else
        echo "Failed to register task definition"
        return 1
    fi
		task_revision=`aws ecs describe-task-definition --task-definition ${FAMILY} | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`
}
push_ecr_image(){
	eval $(aws ecr get-login --region ${REGION})
	docker tag empowerm $AWS_ACCOUNT_ID.dkr.ecr.${REGION}.amazonaws.com/${CONTAINER_NAME}:latest
	docker push $AWS_ACCOUNT_ID.dkr.ecr.${REGION}.amazonaws.com/${CONTAINER_NAME}:latest
}

configure_aws_cli
push_ecr_image
deploy_cluster
