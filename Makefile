# App Pipeline to building Docker image & deploy to ECR
validate:
	aws cloudformation validate-template --template-body file://app-pipeline.yml
create:validate
	aws cloudformation create-stack --stack-name app-pipeline-itizen \
	--template-body file://app-pipeline.yml \
	--capabilities CAPABILITY_IAM
update:validate
	aws cloudformation update-stack \
	--stack-name app-pipeline-itizen \
	--template-body file://app-pipeline.yml \
	--capabilities CAPABILITY_IAM
delete-artifact:
	aws s3 rb --force s3://`aws s3 ls | grep itizen-artifact | awk '{ print $$3 }' `
delete:delete-artifact
	aws cloudformation delete-stack --stack-name app-pipeline-itizen