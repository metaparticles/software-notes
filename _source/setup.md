# Requirements/Setup

1. Install Jekyll (https://jekyllrb.com/docs/installation/)
Avoid using `sudo` while installing jekyll. Use the `gem install --user-install bundler jekyll` (macOS)
2. Install Docker
3. Install Jupyter Notebooks
4. [Optional] Microsoft account for running Azure notebooks
5. [Optional] AWS Account for cloning AMI's, trying out Lambda functions, etc.

For writing in markup language, I think Sublime Text does pretty well and shows syntax highlighting.

To see live preview:<br>
From the root folder run the below command<br>
`bundle exec jekyll serve -s _source/`

After this, you can go to the url specified by the output of the above command

For building the output only:<br>
From the root folder run the below command<br>
`bundle exec jekyll build -s _source/`

To deploy the code to production:<br>
After you have merged your changes to master, switch the local branch to master and take the latest pull.
Then run the below command(s) from the root folder<br>
`chmod u+x deploy.sh`
`./deploy.sh`


