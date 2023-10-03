# GitHub Action: `deploy-aws-cdk-stack`

This action deploys a Stack to AWS using the Cloud Development Kit (CDK).

## Action Inputs

### `stack-id`

**Required** 

The ID of the Stack to deploy.

### `add-branch-suffix`

**Optional**

If true, appends a short hash of the Git commit to the end of the Stack ID.

Defaults to false.

## Action Outputs

## `stack-output`

A JSON string containing the contents of any CDKOutputs defined in the Stack.

## Example Usage

```yaml
uses: rivelinrobotics/deploy-aws-cdk-stack@v1
with:
  stack-id: MyCustomStack
  add-branch-suffix: true
```