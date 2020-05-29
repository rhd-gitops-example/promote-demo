# promote-demo
A sample microservice to be used with the `services' gitops-cli
# Example source repository to be promoted using GitOps

Note the directory structure - this is a *source repository* and not a GitOps repository. It's not intended to be a production-grade application by any means - the point is that it's something to build and promote, and nothing more.

This can be promoted into an existing remote GitOps repository with, for example (do this from the parent directory):

```
services promote --from promote-demo --to https://github.com/<myorg>/<mydevopsrepository>.git --service promote-demo
```

an examplar *GitOps* repository can be found at https://github.com/rhd-gitops-example/gitops-example-staging.

So what happens here, with the promote?

https://github.com/rhd-gitops-example/services/blob/master/README.md#services-- outlines the design in more detail, but specifically (for the local "source to GitOps" repository), this happens:

A pull request will be created against the GitOps repository, whereby you will see the `config/deploy.yaml` contents are now in the GitOps repository's `/environments/*environment name*/services/*service name*/base/config` folder. 

In the GitOps repository, it's assumed there'll be only one folder under `environments` for now, otherwise you'll have to provide a `--env` flag which I've yet to fully implement and document (see https://github.com/rhd-gitops-example/services/issues/92). If the GitOps repository has `environments/stage`, that would be used as the target folder.