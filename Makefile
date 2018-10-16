# TODO: empty s3 bucket before deletation
# TODO: empty ecr repository before deletation
validate:
	aws cloudformation validate-template --template-body file://pipeline.yml
create:validate
	aws cloudformation create-stack --stack-name itizen \
	--template-body file://pipeline.yml \
	--capabilities CAPABILITY_IAM \
	--parameters ParameterKey=Subnets,ParameterValue='subnet-37ac516f\,subnet-94f72ce2' \
	ParameterKey=SourceSecurityGroup,ParameterValue=sg-04ce930d54d7241df \
	ParameterKey=VPC,ParameterValue=vpc-cecea5aa
update:validate,
	aws cloudformation update-stack \
	--stack-name itizen \
	--template-body file://pipeline.yml \
	--capabilities CAPABILITY_IAM \
	--parameters ParameterKey=Subnets,ParameterValue='subnet-37ac516f\,subnet-94f72ce2' \
	ParameterKey=SourceSecurityGroup,ParameterValue=sg-04ce930d54d7241df \
	ParameterKey=VPC,ParameterValue=vpc-cecea5aa
delete-artifact:
	aws s3 rb --force s3://`aws s3 ls | grep itizen-artifact | awk '{ print $$3 }' `
delete:delete-artifact
	aws cloudformation delete-stack --stack-name itizen
