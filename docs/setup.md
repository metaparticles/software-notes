# Requirements/Setup

1. Install Jekyll (https://jekyllrb.com/docs/installation/)
Avoid using `sudo` while installing jekyll. Use the `gem install --user-install bundler jekyll` (macOS)
2. Install Docker
3. Install Jupyter Notebooks
4. [Optional] Microsoft account for running Azure notebooks
5. [Optional] AWS Account for cloning AMI's, trying out Lambda functions, etc.

For writing in markup language, I think Sublime Text does pretty well and shows syntax highlighting.

To see live preview:
From the root folder
`bundle exec jekyll serve -s _source/`

For building the output to host on metaparticles.github.io, run
`bundle exec jekyll build -s _source/`

.....

Then go to localhost:4000