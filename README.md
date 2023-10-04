# GitHub Action: Deploy AWS CDK Stack

This action deploys a Stack to AWS using the Cloud Development Kit (CDK).

This action should be used in conjunction with the [Configure AWS Credentials](https://github.com/aws-actions/configure-aws-credentials) action to assume
a Role with appropriate CloudFormation acess and a Trust Policy allowing a runner to assume the Role via a GitHub OIDC Identity Provider.

## Action Inputs

| *Input*           | *Type*  | *Required* | *Default* | *Description*                                 |
|-------------------|---------|------------|-----------|-----------------------------------------------|
| stack-id          | string  | yes        |           | The ID of the Stack to Deploy                 |
| add-branch-suffix | boolean | no         | false     | Appends a commit hash to the Stack ID         |
| ephemeral         | boolean | no         | false     | Destroys the Stack at the end of the workflow |

## Action Outputs

| *Output*     | *type* | *Description*                                            |
|--------------|--------|----------------------------------------------------------|
| stack-output | string | The JSON contents of all CDKOutputs defined in the Stack |

## Example Usage

```yaml
jobs:
  perform-deployment:
    runs-on: ubuntu-latest
    permissions:
      id-token: write
      contents: read
    steps:
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v3
        with:
          role-to-assume: ${{ secrets.AWS_DEPLOYMENT_ROLE_ARN }}
          aws-region: ${{ secrets.AWS_DEFAULT_REGION }}
          role-session-name: GithubRunnerDeployment
      - name: Deploy to AWS
        uses: rivelinrobotics/deploy-aws-cdk-stack@v1
        with:
          stack-id: MyCustomStack
          add-branch-suffix: true
          ephemeral: true
```
