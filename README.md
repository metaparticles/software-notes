# Hi!

This repository contains the setup and data files for hosting the github pages site [metaparticles/software-notes](https://metaparticles.github.io/software-notes/). You need to be added as a collaborator to this repository to contribute.


# Requirements/Setup

1. Install Jekyll (https://jekyllrb.com/docs/installation/). Avoid using `sudo` while installing jekyll. For example, use the `gem install --user-install bundler jekyll` (in macOS)

2. [Optional] Install Docker

3. [Optional] Install Jupyter Notebooks

4. [Optional] Microsoft account for running Azure notebooks

5. [Optional] AWS Account for cloning AMI's, trying out Lambda functions, etc.

**For writing in markup language, I think Sublime Text does pretty well and shows syntax highlighting.**

### To see live preview
From the root folder run the below command<br>
`bundle exec jekyll serve -s _source/`

After this, you can go to the url specified by the output of the above command

### For building the output only
From the root folder run the below command<br>
`bundle exec jekyll build -s _source/`

### To deploy the code to production
After you have merged your changes to master, switch the local branch to master and take the latest pull.
Then run the below command(s) from the root folder<br>
`chmod u+x deploy.sh`
`./deploy.sh`


