MatlabTemplate
==============
Template repository for new Matlab projects which provides a template-file to create unit tests as well as all the necessary files to run these tests automatically on every commit.

## Setup

Clone the template, set up a new repository as well as the pre-commit hook:

```
git clone --depth=1 https://github.com/Globegitter/MatlabTemplate.git . && rm -rf .git && ./run-first
```

Now you just have to modify the contents in ```moduleTests.m``` to fit your needs and use git/Matlab as usual.

Note: Since the ```run-first``` script creates a local repository you will probably want to add an origin (new github repository) via ```git remote add origin url https://username@github.com/user/repo.git``` and afterwards ```git push -u origin master``` to set it as default.
