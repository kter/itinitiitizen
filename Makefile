# TODO: empty s3 bucket before deletation
# TODO: empty ecr repository before deletation
# TODO: 引数を使ってまとめる
# pipeline or ecs
target = ecs
validate:
	aws cloudformation validate-template --template-body file://${target}.yml

pipeline-create:validate
	aws cloudformation create-stack --stack-name pipeline-itizen \
	--template-body file://pipeline.yml \
	--capabilities CAPABILITY_IAM
pipeline-update:validate,
	aws cloudformation update-stack \
	--stack-name pipeline-itizen \
	--template-body file://pipeline.yml \
	--capabilities CAPABILITY_IAM
pipeline-delete-artifact:
	aws s3 rb --force s3://`aws s3 ls | grep itizen-artifact | awk '{ print $$3 }' `
pipeline-delete:pipeline-delete-artifact
	aws cloudformation delete-stack --stack-name pipeline-itizen

ecs-create:validate
	aws cloudformation create-stack --stack-name ecs-itizen \
	--template-body file://ecs.yml \
	--capabilities CAPABILITY_IAM \
	--parameters ParameterKey=Subnets,ParameterValue='subnet-37ac516f\,subnet-94f72ce2' \
	ParameterKey=SourceSecurityGroup,ParameterValue=sg-04ce930d54d7241df \
	ParameterKey=VPC,ParameterValue=vpc-cecea5aa
ecs-update:validate,
	aws cloudformation update-stack \
	--stack-name ecs-itizen \
	--template-body file://ecs.yml \
	--capabilities CAPABILITY_IAM \
	--parameters ParameterKey=Subnets,ParameterValue='subnet-37ac516f\,subnet-94f72ce2' \
	ParameterKey=SourceSecurityGroup,ParameterValue=sg-04ce930d54d7241df \
	ParameterKey=VPC,ParameterValue=vpc-cecea5aa
ecs-delete:
	aws cloudformation delete-stack --stack-name ecs-itizen
