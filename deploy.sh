#!/bin/sh

# Source name
source=Resume

# If a command fails then the deploy stops
set -e


# Render latex
xelatex $source.tex

# Remove junk
rm $source.log
rm $source.aux
rm $source.out


# Add changes to git.
git add .

# Commit changes.
msg="updating resume $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
