---
layout: page
location: pages/coding/tools/flutter/leaf
permalink: /pages/coding/tools/flutter/Construct-Infra
---

## Contents of this page:

- [Tools like dart format in our pipeline](#tools-like-dart-format-in-our-pipeline)
- [Deployment - making faster](#deployment---making-faster)

## Tools like dart format in our pipeline

- Chad has made a change to how `dart format` runs in the pipeline...
- in `construct/.github/workflows/ci.yaml`
    - CI is for PRs and CD is for main
- it now has 
    - `dart format --fix`
    - and uses `stefanzweifel/git-auto-commit-action@v5` 
        - more about that [here](https://github.com/marketplace/actions/git-auto-commit)
    - this means it will automatically fix any issues it finds and commit the new change back to the branch that is being merged in this PR
- it was previously using `--set-exit-if-changed` to force the pipeline to fail if any problems found, but now it fixes problems instead

## Deployment - making faster

- Chad was making tiny changes to code and then deploying, because trying to debiug dev instance. But each deployment took min 10 mins, which made things painful.
    - Pipeline was running everything on every change, even though somethings hadn't change
    - Chad has changed it so that it only runs the relevant parts of the pipeline according to what's changed
    - Reduced it from 10+ mins to 13 seconds!
- Changes made in this PR here: https://github.com/The-Construct-Software-Dev/construct/pull/102
- Chad has done a thing to say certain parts of the pipeline will not run unless necessary
- changed_files.yaml
- uses tj-actions/changed
    - means it wants to use an action - can be local action or repository
    - those actions can take arguments
    - similar to outputs you can have inputs, which is how you congiure an action
- files_yaml is an argument to the changed_files action
    - already defined, not by us
    - see here for more: https://github.com/tj-actions/changed-files/blob/main/action.yml
- `infra`, `app` and `functions` are keys
    - they refer to the folders in our codebase
    - `app` refers to Flutter app source code changes
    - `infra` is the terraform setting up Firebase, storage, etc
    - `functions` is cloud functions - emails and payment stuff
- there are corresponding outputs - outputs for the job, then also have to be set as outputs for the workfow too
- ci.yaml now has something saying it depends on changed_files
    - means we've now set a dependency for these jobs so it waits for the results of the pattern matching before moving on
    - uses `needs.` to say if `infra` has changed, it will run this job
    - same is done with `functions` and `app`
- The `app` job in Github  actions is currently dependent on the `infra` job
    - effectively it's a chain, it does `infra` then it does `app`
    - Github actions sees that as a dependency
    - But we do want them in that order - we want infra changes made before app changes
    - so we wait for infra to finish before doing app
    - even though there are no actual outputs from the infra step which app relies on
    - But we sometimes want to bypass `infra` but still run the `app` step
    - Github actions makes this difficult, but it is possible
    - Chad made infra a dependency in the `needs` section
    - infra is a dependency in terms of deployments but not in terms of PRs
        - the workflow is different for a PR
        - for a PR the infra step just runs the tests for terraform
    - the workaround is to say as long as there's no failure and it hasn't been cancelled, then don't skip future jobs, run them anyway
    - for a PR there are no dependencies, they all run in parallel
    - for a deployment, when we merge the PR, there is a dependency - they have to be done in a certain order
        - so Chad introduced the same dependency temporarily into the PR workflow, just to test the workaround that allows for skipping steps, to make sure it worked and test it in the PR workflow
- Further speed improvements might also be possible by running some steps in parallel
    - instead of conditional deployment that waits for one thing to finish before starting another
    - eg checking env vars to see if they've changed and whether cloud functions might need updating as a result
- Other improvements could also be made:
    - The env file gets created bit by bit with a certain amount of duplication, where in fact it could be done just all in one go