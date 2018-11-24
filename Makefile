# App Pipeline to building Docker image & deploy to ECR
validate:
	aws cloudformation validate-template --template-body file://app-pipeline.yml
create:validate
	aws cloudformation create-stack --stack-name pipeline-itizen \
	--template-body file://app-pipeline.yml \
	--capabilities CAPABILITY_IAM
update:validate
	aws cloudformation update-stack \
	--stack-name pipeline-itizen \
	--template-body file://app-pipeline.yml \
	--capabilities CAPABILITY_IAM
delete-artifact:
	aws s3 rb --force s3://`aws cloudformation describe-stack-resources --stack-name pipeline-itizen --logical-resource-id ArtifactStoreS3 | grep PhysicalResourceId | cut -d'"' -f 4`
	aws ecr delete-repository --force --repository-name app-itizen
delete:delete-artifact
	aws cloudformation delete-stack --stack-name pipeline-itizen
