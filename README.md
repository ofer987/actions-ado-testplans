# cicd_gh-actions-cucumber-azure-devops-sync

This pattern is been created to provide a way to automatically upload Cucumber(BDD) Test Cases from GitHub Repo to Azure DevOps TestPlans.  This is to reduce manual efforts involved.

## Sample Screenshots of Test Cases in Azure DevOps after Successful Run:-

## Inputs

This Action defines the following formal inputs.

| Name | Required | Default | Description
|-|-|-|-|
| **`ado_pat`**  | true | None | ADO PAT Token
| **`ado_org_url`**  | true | None | ADO ORG URL
| **`project_name`**  | true | None | ADO Project Name you want the test cases to be uploaded under
| **`feature_path`**  | true | None | Path of Cucumber Gherkins Style Features
| **`area_path`**  | true | None | ADO Area Path
| **`set_then_steps_as_expected`**  | true | false | Setting true will copy Then Statements to exected result column
| **`cucumber_sync_tool_id`**  | true | None | GH-Actions-Sync
| **`tag_prefix_id`**  | false | @ADO- | ADO PAT Token

## Outputs

This Action updates your feature files with ADO Test Case ID as Tag so its suggested to make a commit back to Git Repo  by making a PR


## Usage

See below example.

```
name: cucumber-ado-sync

on:
  push:
    branches:
      - '**'
    paths-ignore:
      - '**.md'
    tags-ignore:
      - '**'

jobs:

  test:
    runs-on: ubuntu-latest
    env:
        GIT_USER_EMAIL: "actions@github.com"
        GIT_USER_NAME: "GitHub Actions"
        CUCUMBER_BRANCH_NAME: cucumber-ado-sync
        TEMP_BADGE_BRANCH_NAME: temp-cucumber-ado-sync

    steps:
      - name: Checkout Git Repo
        uses: actions/checkout@v3

        # run only if some file in 'src' folder was changed
      - name: Cucumber to ADO Sync
        uses: tr/cicd_gh-actions-cucumber-azure-devops-sync@v0.1
        if: steps.changes.outputs.src == 'true'
        with:
            ado_pat: ${{ secrets.ADO_PAT }}
            ado_org_url: https://dev.azure.com/tr-ihn-sandbox
            project_name: 'Azure DevOps Training'
            feature_path: 'test/features'
            area_path: 'Azure DevOps Training'
            set_then_steps_as_expected: false
            cucumber_sync_tool_id: ADO-Upload-Aug-1st-2022
            tag_prefix_id: '@ADO-'

      - uses: dorny/paths-filter@v2
        id: post-ado-sync
        with:
          filters: |
          features:
             - 'test/features/*/features'

      #  Commit Cucumber Feature Files to triggering branch and all newly generated badge images to tr-cicd-resources branch
      - name: Commit badge images and README Markdown
        if: steps.post-ado-sync.outputs.features == 'true'
        env:
          GITHUB_REF_NAME: ${{ env.GITHUB_REF_NAME }}
          CUCUMBER_ROOT_DIR: ${{ env.feature_path }}
        run: |
          git config --local user.email $GIT_USER_EMAIL
          git config --local user.name $GIT_USER_NAME
          if [ $GITHUB_REF_NAME != "main" ]
          then
            git pull --ff -q
            git add ${{ env.CUCUMBER_ROOT_DIR }}
            git commit -m 'Updated Cucumber Gherkins Features'
            git push
          fi
          git add ${{ env.CUCUMBER_ROOT_DIR }}/
          if [ `git branch -r --list "origin/${{ env.CUCUMBER_BRANCH_NAME }}"` ]
          then
              git checkout -b ${{ env.TEMP_CUCUMBER_BRANCH_NAME }}
              git commit -m "Updated badge images"
              if [ $GITHUB_REF_NAME == "main" ]
              then
                git stash
              fi
              git checkout ${{ env.CUCUMBER_BRANCH_NAME }}
              git checkout ${{ env.TEMP_BADGE_BRANCH_NAME }} ${{ env.CUCUMBER_ROOT_DIR }}
              git add ${{ env.CUCUMBER_ROOT_DIR }}/
              git commit -m "Updated Cucumber Feature Files"
              git push --force
              git branch -D ${{ env.TEMP_CUCUMBER_BRANCH_NAME }}
          else
              git checkout -b ${{ env.CUCUMBER_BRANCH_NAME }}
              git commit -m "Updated Cucumber Feature Files"
              git push --set-upstream origin ${{ env.CUCUMBER_BRANCH_NAME }}
          fi

```          