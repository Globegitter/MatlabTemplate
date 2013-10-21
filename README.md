MatlabTemplate
==============
Template repository for new Matlab projects which provides a template-file to create unit tests as well as all the necessary files to run these tests automatically on every commit.

## Setup

Clone template and set up a new repository as well as the pre-commit hook:

```
git clone --depth=1 git@github.com:Globegitter/MatlabTemplate.git . && rm -rf .git && ./run-first
```

Now you just have to modify the contents in ```moduleTests.m``` to fit your needs
