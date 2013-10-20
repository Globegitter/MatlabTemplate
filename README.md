MatlabTemplate
==============
Template repository for new Matlab projects which provides a template-file to create unit tests as well as all the necessary files to run these tests automatically on every commit.

## Setup
Clone only the repository content:

```
git clone --depth=1 git@github.com:Globegitter/MatlabTemplate.git . && rm -rf .git
```

To set up the pre-commit hook, run:

```
./run-first
```

You just have to modify the contents in ```modulesTest.m``` to fit your needs
