#!/bin/zsh
##  commit.sh
##  A simple script to commit changes to a git repository. 
##
##  Copyright (c) 2022 Miclaus Industries Corporation B.V. Advanced Software Technologies Research and Development Group.
##
##  Permission is hereby granted, free of charge, to any person obtaining a copy
##  of this software and associated documentation files (the "Software"), to deal
##  in the Software without restriction, including without limitation the rights
##  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
##  copies of the Software, and to permit persons to whom the Software is
##  furnished to do so, subject to the following conditions:
##
##  The above copyright notice and this permission notice shall be included in all
##  copies or substantial portions of the Software.
##
##  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
##  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
##  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
##  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
##  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
##  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
##  SOFTWARE.
##

# Check if .git directory exists
if [ -d .git ]; then
    # Check if there are any changes
    if [ -n "$(git status --porcelain)" ]; then
        # Ask for the Commit message
        echo Type your Commit message # Ask for the Commit message
        read commit                   # Read the commit message

        # Ask for the Branch name
        echo Type your Branch name    # Ask for the Branch name in which to commit
        read branch                   # This is the branch name

        # Commit & Push
        git add --all                 # Add all files to staging
        git commit -m "$commit"       # Commit with message
        git branch -M "$branch"       # Rename the branch
        git push -u origin "$branch"  # Push to remote repository
        echo Done.                    # Print Done
    else
        # No changes
        echo "No changes to commit."
    fi
else
    # No .git directory
    echo "Not a git repository."
fi
