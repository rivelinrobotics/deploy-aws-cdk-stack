# GitHub Action: `deploy-aws-cdk-stack`

This action deploys a Stack to AWS using the Cloud Development Kit (CDK).

## Action Inputs

### `stack-id`

**Required** 

The ID of the Stack to deploy.

### `deploy-role-arn`

**Required** 

The Amazon Resource Name (ARN) of the IAM Role to assume for deployment.

This role must have the appropriate CloudFormation permissions, and the Trust Policy must
allow the repository using this action to assume the Role via a GitHub OIDC Identity Provider.

### `add-branch-suffix`

**Optional**

If true, appends a short hash of the Git commit to the end of the Stack ID.

Defaults to false.

## Action Outputs

## `stack-output`

A JSON string containing the contents of any CDKOutputs defined in the Stack.

## Example Usage

```yaml
uses: actions/deploy-aws-cdk-stack@v1
with:
  stack-id: MyCustomStack
  deploy-role-arn: arn:aws:iam::123456789012:role/DeploymentRole
  add-branch-suffix: true
```