---
layout: page
location: "pages/coding/tools/leaf"
permalink: /pages/coding/tools/Git
---

## Git Quick Start

* Check status: type `git status`
 
* To fetch code: `git pull --rebase`

  * NB – that is two dashes before “rebase”!! (this gets the latest version and makes all changes appear in a straight line)

* To get all the latest files: `git checkout`

* To get one particular file: `git checkout folder/file.cs`

* To see all changes file by file:  `gitk`

*	Pretty tramline view: `git hia`

* To add all latest changes: `git add .`

  * `git add –p`

  * ... will show you each chunk of changes one at a time, so you can accept them one by one – “y” to accept, “n” to reject)

* To save the changes ready to be pushed to the server and merged: `git commit –m "Write something here to describe your changes"`

* To push code to server: 

  * `git pull --rebase`

  * `git push`

  * !! At this point you might have to resolve any merge problems

  * !! Make sure your tests are still passing before you push to server 

  * Configure user name and email:

```
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
```

## Git Misc

- [ohshitgit.com](https://ohshitgit.com/) - A lovely little site by the wonderful [Katie Sylor-Miller](https://twitter.com/ksylor), designed to get you out of those horrible git messes you might get yourself in, using simple language.

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [Git-Playground](https://github.com/claresudbery/Git-Playground)

## Rename master branch to main

- "master" is problematic language because of its connotations of enslavement. Increasing numbers of people are renaming to `main` instead.
- Like this:
- Locally:
  - `git branch -m master main`
  - `git push -u origin main`
- At github.com, gop to your repo:
  - Settings => Branches => Default branch
  - Click the "switch" button (two opposite-facing arrows) to the side of the master branch
  - Select the main branch and click Update
  - Confirm
- Back on your local command line:
  - `git push origin --delete master`



## Git autostash

  - `git autostash`
    
      - You use it to stop you having to do git stash, git pull rebase,
        git stash pop
    
      - Although it’s not that hard, because you can pipe all three
        commands like this: `git stash && git pull --rebase && git
        stash pop`
        
          - It won’t do each following command unless the previous one
            completed successfully
    
      - We get the wrong version of git in our machines (for git
        autostash), so you might have to download a version of git and
        build it on their machine - which wasn’t too hard
    
      - But there’s an alternative which is to have git running in a
        docker container

## Git submodules

  - This command allows you to loop through all submodules: `git
    submodule foreach git pull`
    
      - We have submodules in the Chef repo.
    
      - I tried that command ^^ and it didn’t work.
        
          - To manually clone into the sensitive submodule instead:
        
          - This: `cd \~/development/chef/cookbooks/sensitive`
    
      - This one sort of did (apart from the permissions errors, which
        are to do with ssh vs https - see below): `git clone
        --recursive`
        
          - \! NB When it suggests `git clone --recursive
            <git@github.xxx.com:Sysops/chef.git>`, you might get an
            HTTP error or a public key permission error, in which case
            use `git clone --recursive
            https://github.xxx.com/Sysops/chef.git` instead
        
          - No, that doesn’t help. I think basically you have to set
            yourself up to use ssh instead of https, otherwise the only
            way to get it working is to manually clone each submodule
            repo into each folder using https.
        
          - You can fiddle around with editing `.gitmodules` file and
            calling `git remote set-url origin
            https://github.xxx.com/Sysops/xxx.git`, but this didn’t
            work for me (maybe because I didn’t call `git submodule
            sync`?) but should probably be using ssh (see below).

## Troubleshooting GitHub access

- If you get an error like this: "ERROR: Permission to repo/reponame.git denied to claresudbery.
fatal: Could not read from remote repository. Please make sure you have the correct access rights
and the repository exists."
  - It might be that you need to set up ssh access (see [below](#use-ssh-to-access-repos-instead-of-https))
  - It might be that you're using ssh access instead of https (or vice versa) - check the remote origin url configured in `.git/config`
  - It might be that someone has added you as a collaborator but you have ***forgotten to accept the invite***. Check your email!!

## Use Personal Access Token to access repos

- If you get the error "Support for password authentication was removed on August 13, 2021. Please use a personal access token instead." (possibly in an email)
  - or if you get an email saying your personal access token has expired
  - or if you get "authentication failed" when trying to push to GitHub from command line
- Follow the link to regenerate personal access token (I think I was sent this in an email)
  - ! Note that by default it will be set to expire in 30 days, but you can change this to make it last longer.
  - Make sure you take a copy! You can store it in a password manager.
- Then...
  - Windows:
    - The next time you do a git push on windows, it'll open a git dialog
    - The first dialog wants your actual GitHub password, and it will say it has failed
    - The second one - "OpenSSH" - wants your GitHub username but when it asks for a password it wants the personal access token.
    - After that Windows will store it for you and you won't need it again.
  - Mac:
    - The next time you do a git push, use your GitHub user name and the PAT (access token) instead of password and (on my setup at any rate) it will get saved for you.
      - !! If you're using Terminal in an IDE, eg Rider, it might not ask you for a password
      - Just go and do same in iTerm (or similar) and it should ask for pw there
    - If pushing a new branch, it might not ask for un + pw, but it will if just doing a normal push
    - If you get "authentication failed" when trying to do a pull, do a push instead and it'll give you the opportunity to enter user name and password - use the new PAT as your password.
- [More here](https://stackoverflow.com/a/51505417).

## Use ssh to Access Repos (instead of https)

  - Are you sure you want ssh, and not [personal access token](#use-personal-access-token-to-access-repos)?

  - Ssh stuff:
    [<span class="underline">https://help.github.com/en/articles/connecting-to-github-with-ssh</span>](https://help.github.com/en/articles/connecting-to-github-with-ssh)

  - Note that I now have two scripts in my scripts repo - `add-ssh-key-mac` and `add-ssh-key-win` that help with this.

  - For error "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!" see [below](#troubleshooting-error-warning-remote-host-identification-has-changed)

  - This is what I did to get ssh up and running in the Chef repo - I
    did this twice, for both VM and local laptop:
    
      - This: `cd \~/development/chef/`
    
      - This to check remote url: `git remote -v`
    
      - This (if remote url does not match this one): `git remote
        set-url origin <git@xxx.git>`
        
          - To change it back again: `git remote set-url origin
            <https://github.xxx.com/xxx.git>`
    
      - This to check if you have any ssh keys already: `ls -al
        \~/.ssh`
    
      - This to create a new ssh public-private key pair: `ssh-keygen
        -C [<span class="underline">\[email
        address\]</span>](mailto:csudbery@acme.com)`
    
      - This to start the ssh-agent: `eval "$(ssh-agent -s)"`

      - If you've copied a key from elsewhere and you're on OSX or Linux and you get the error "Unprotected private key file":
      ```
      sudo chmod 600 ~/.ssh/id_rsa
      sudo chmod 600 ~/.ssh/id_rsa.pub
      ```
    
      - This to edit your ssh config file to automatically load keys
        into the ssh-agent and store passphrases in your keychain: `vim
        \~/.ssh/config`
        
          - Now add these lines (note the indentation should be a single
            space):
        
          - `Host \*`
        
          - `IgnoreUnknown AddKeysToAgent,UseKeychain`
        
          - `AddKeysToAgent yes`
        
          - `UseKeychain yes`
        
          - `IdentityFile \~/.ssh/id\_rsa`
    
      - This to add your SSH private key to the ssh-agent and store your
        passphrase in the keychain: `ssh-add -K \~/.ssh/id\_rsa`
        
          - \! The -K option is only for Mac: It only works on local machine
        and not VM (because that’s Linux and not Mac), so remove it for
        VM
    
      - Add the key to GitHub:
        
          - This to display key, so you can then copy to clipboard:
            `cat \~/.ssh/id\_rsa.pub`
        
          - Click your user icon, top right in GitHub, and select
            settings:
            [<span class="underline">https://github.com/settings/profile</span>](https://github.com/settings/profile)
        
          - click SSH and GPG keys on the left
        
          - Click New SSH key (top right) and give it an appropriate
            name

### Troubleshooting error: "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!"

- You might get this when pushing or pulling, around March 2023.
- [Article here explains the fix](https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/)
- I found on Windows in GitBash that I could manually edit `known_hosts`
  - Here: `C:\Users\[username]\.ssh\known_hosts\`
  - But I did then get warnings about IP addresses: "Warning: the RSA host key for 'github.com' differs from the key for the IP address "
  - I fixed this by changing the lines in `known_hosts` relating to the two specified IP addresses, so that they also had the new ssh-rsa hash
  - but I don't really know why those lines are there and whether they're used by anything else, so I've kept the original lines commented out
  - I don't know the difference between `known_hosts` and `hosts`

## GitHub "A personal access token has been added to your account"

* You'll receive an email titled "A personal access token has been added to your account"
* This happens when Git for Windows credential helper acquires a personal access token on your behalf 
* It should have happened at the same time as you saw a popup that asked for your GitHub username and password
* If you visit https://github.com/settings/tokens you will probably see the same request probably being made repeatedly by the same device Id
* If the above two things are not the casae, then you should worry.
* More here: https://stackoverflow.com/questions/55615542/why-did-github-add-a-personal-access-token-even-if-i-didnt-generate-a-new-one

## Andy Grant brown bag - “Git - just like subversion, right?”

  - These are my notes from a brown bag session Andy Grant did at
    LateRooms
  - Revisions in svn (and)
      - Consist of
          - a list of deltas
          - and some commit metadata?
  - Git is a key value store - doesn’t use revisions
      - Key = SHA1 hash
      - Value = Git object. Different git objects:
          - Blob
              - Large data objects, eg large text, as zipped file
              - So effectively the whole source file that has been
                edited - the newest version of it
              - This sounds inefficient, but periodically (eg when you
                do a push or pull) it will do garbage collection, which
                creates a packfile which is effectively a compressed
                version of several blobs
              - NB: It is at this point that it starts doing diffs and
                identifying deltas, so that rather than storing whole
                files, it is storing deltas
              - It is VERY efficient at this - doesn’t necessarily just
                store deltas from one commit to the next, but just
                identifies the most salient deltas (potentially between
                apparently unrelated commits?) and stores them
                  - You can change config settings for how often / how
                    thorough this process is, but it can really slow
                    things down
          - Tree
              - Directory structure, each leaf = a blob
          - Commit
              - Text file:
                  - commit metadata,
                      - eg parent info and commit message
                      - parent info = dead important - see “Commits as a
                        graph” below
                  - plus the hash of an associated tree
          - Tag
              - A bit like a commit
  - Commits as a graph
      - Commit metadata includes parent info
      - Each commit can have up to 2 (?) parents
          - Merges have two parents
      - Can look like a tree
          - Is a directed acyclic graph
          - …which means Starting at any individual node, you can’t get
            back to it
          - Ie the graph only goes in one direction
  - A branch is just a reference to a commit
      - …which will be the head of that branch
      - HEAD is just a reference to a branch, which is a reference to a
        commit
          - Unless you checkout a commit which is not a branch reference
          - In which case it is a **detached head**, and is not a
            reference to a branch
          - At this point you can create a new branch, and then it will
            no longer be a detached head
  - Merges
      - It looks for the last parent which is common to both branches
      - It does a diff between that parent
  - Reset
      - Just changes the head of the branch to point at a different
        commit
      - If this is an earlier commit, then any later ones become
        dangling commits and will eventually be cleared up by garbage
        collection
  - Git Reset vs git revert
      - Reset is a sledgehammer
      - You will lose any dangling commits
      - Revert is safer - creates new commits (see notes further down)
  - Remote branches
      - Because git is distriuted, it doesn’t actually differentiate
        between server and client branches
      - But it does have the concept of the remote repo, which has a
        different status
      - It tries to prevent changes being made to the remote repo
  - Rebasing
      - Makes a new branch from the source, then replays each diff from
        the common on top of it, and then makes that your new branch
      - Each of those replayed diffs gets a new commit id
      - Behind the scenes this means your old branch becomes a dangling
        commit (orphaned)
      - Your old commits will still be there
          - There are ways of recovering them, but they will disappear
            at the next garbage collection
          - Is there config to set when / how this happens?
      - You can reproduce the process with a series of git cherry-pick
        commands

## Useful Tips / Troubleshooting

### Useful links

  - My blog post full of useful git links:
    <https://insimpleterms.blog/want-to-learn-git-improve-your-git-knowledge>

### Staging bits of files or individual files:

- Like this: `git add –i`
  - More here:
  <https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging>
- `git add –p`
  - ... will show you each chunk of changes one at a time, so you can accept them one by one – “y” to accept, “n” to reject)

### GitHub searching

  - Press t while on GitHub home page for a particular repo

### Running a git command in a different folder

  - In gitBash (for the `git status` command):
      - `git –C /c/your/folder/frontend status`
  - In powershell (for the `git status` command):
      - `git –C c:/your/folder/frontend status`

### Setting up Git Command shortcuts (git alias)

  - This: `git config --global alias.cm 'commit -m'`
      - This will set up an alias so that instead of typing `git commit
        –m`, you can now just type `git cm`
  - This: `git config --list`
      - This will show you what aliases you already have set up
  - If you add something or create duplicates by accident, you can
    directly edit the config file:
      - This: `git config --global --edit`
      - This will put you in a VIM editor – see VIM instructions
        elsewhere in this doc

### Changing git text colours used at command prompt

  - You can change the colours git uses like this at the command prompt:
      - `git config --global color.status.changed "cyan normal bold"`
      - **More here:
        <http://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#Colors-in-Git>**
          - **…but \!\!\! it doesn’t give the necessary subsettings for
            each of the four categories (branch, diff, status,
            interactive)**
          - **Three of those are covered here:
            <https://nathanhoad.net/how-to-colours-in-git>**
  - **You can change the colours pohgit uses like this in the poshgit
    config file**
      - **File here:** your \<username\>\\My
        Documents\\WindowsPowerShell\\Microsoft.PowerShell\_profile.ps1
      - **This kind of thing:**
        `$global:GitPromptSettings.WorkingForegroundColor    =
        \[ConsoleColor\]::Yellow`
      - **You can also change** UntrackedForegroundColor (I think these
        might be the only two colour settings)
      - **More here: <http://codefoster.com/psprofile/>**
  - More here:
    <http://sedodream.com/2012/05/05/GitCustomizingColorsForWindowsIncludingPoshgit.aspx>

### Quick cloning

  - Use `git clone \[path\] --depth 1`
  - **(= shallow clone)**

### Reversing a bad / unintentional merge

  - Like this: `git reset --merge` (that’s two hyphens, not an
    mdash)

### Undoing all commits on your local copy of a shared branch 

  - to bring you back in line with the master
  - Like this: `git reset --hard origin/master`

### Checkout / Branch / Merge / Pull Confusions

  - “Checkout” means you are changing the working copies of your files
    to match either an individual commit, or a specific branch
      - Remember that branches can either be local or remote
      - For instance, you will have your own local ‘master’ branch which
        is a duplicate of origin/master
      - If you checkout the remote version, I think it will be read-only
      - You should only commit to your local branches
      - You should ideally only checkout local branches, I think
          - In GUI tools, you are always given the option of creating a
            local copy when you say you want to checkout a remote branch
      - But you can pull from remote branches, to get changes that
        others have made and get your local copy up to date. You will be
        informed if a merge is required.
      - You checkout your local copy of the branch, then do a pull to
        make sure you have all changes which have been pushed to the
        remote version.
          - This is the difference between checkout and pull – checkout
            just changes your working copies of files to be whatever
            state the branch was in the last time you pulled it – then
            you do a pull to get the latest version from the server (or
            the other way round, but it’s easier to pull a checked-out
            branch cos ‘git pull’ just works, without having to specify
            which branch you mean)
      - If you checkout a commit which is not the tip of a branch, you
        create a “detached head”
          - Because no branch has been created at this point, any
            commits you make will be lost and unmergable
          - If you want to make commits at this point, you need to
            create a branch at this point
      - Normally you would follow this pattern:
          - create a local copy of a remote branch
          - or just create a brand new local branch whose origin was the
            remote master (origin/master) – this will also have the
            effect of creating a remote branch which matches your local
            branch, and which gets updated whenever you do a push
          - Make changes and commit them
          - Push them too – they will then get copied to the remote
            version of the local branch
          - Pull from the remote version to get any latest code and
            merge with your local code
          - Push again after you have merged
          - If your local branch was a brand new branch created by you,
            do a pull request so that your branch can be merged back
            into master
          - Remember that if there are several devs working on the same
            branch, then when you push, you are effectively already
            merging back into the remote branch. Pull requests are about
            merging branches back into the master, not about merging
            local branches into their remote versions
              - This was a mistake I made early on when working at NICE,
                where they had a Support branch which all the devs were
                working on, and which was not being merged back into
                master – I did a pull request, thinking my local work
                would be pulled into the remote branch, then I got a
                message saying my work could be safely merged, so I
                clicked OK, next thing I knew I had inadvertently merged
                the support branch back into the master branch
                  - …but the support branch still existed, and did NOT
                    have the master code changes in it. Support was
                    merged into master, not the other way round.
  - 
### Getting Help with commands

- Enter ? at the command prompt

### Atlassian Git tutorial

- Here: <https://www.atlassian.com/git/tutorials/>

### Another git tutorial

- [Fracz tutorial](https://gitexercises.fracz.com/)

## Interactive tool to learn how to do git branching

- [https://learngitbranching.js.org](https://learngitbranching.js.org)

### Case Sensitivity

  - Git is case sensitive

### Vim Editor when no commit message

  - When you do a commit command and forget to add a message in Git
    Bash, you will end up in the VIM editor:
      - See “When you get stuck in a VIM editor” in this doc

### Changesets vs snapshots

  - I *think* snapshots are the same things as changesets in Mercurial

### Discarding uncommitted (but staged) changes to an individual file

  - (This will also apply to reverting a file which you had checked out
    from a particular commit)
  - This: `git reset \<fileName\>`
      - unstages the changes
      - or
          - git reset HEAD \<fileName\>
      - (not sure if you also need the “--” part?)
      - (\!\! be aware that `git reset` is dangerous if you have
        already pushed to the server - `git revert` is safer)
  - Then this: `git checkout -- \<fileName\>`
      - Or `git checkout .` (note the dot at the end)
          - Discards all changes to all files
          - (`.` means current folder, just as `..` means the folder
            above)
      - reverts the state of the file to the last commit
      - eg: `git checkout --
        src\\cprm\\plugins\\ot\\base\\specHelpers\\viewmodels\\questions\\questionsMocks.js`

### Changing the commit message

  - See git commit -- amend

### Adding files to gitignore after they’ve been committed

  - Two possibilities:
      - You can remove the files from source control, but not from disk:
          - See `git rm` below
      - Alternatively, if this is a brand new repo, just delete the
        whole lot and start again from scratch

### If stuff doesn’t all fit on the screen:

  - Space to scroll
  - Q to quit
      - But if you try other commands before you hit Q, you can get in a
        weird state where it will no longer respond to Q
      - I don’t know what to do in this circumstance - I had to restart
        Powershell\!
      - The moral is don’t bash the keyboard - hit Q before doing
        anything else

### Discard changes since the last commit that was pushed

  - This: git stash save –keep-index
  - This: git stash drop
  - This: git status (just to check it worked)

### Pull down a feature branch

  - Use Git Bash:
      - CD to root (see above for weird Git Bash cd syntax)
      - Laura said this:
          - “git fetch”
          - “git checkout feature/CFTP-1101” (for example)
              - Top tip\! It is case sensitive
              - Top tip\! Use tab to auto complete
          - “git pull origin”
              - Origin is the name of the remote repo
      - But I think it should be this:
          - “git fetch”
          - “git checkout master”
          - “git merge feature/CFTP-1101” (for example)

## All Repository Commands

### Wrapping / scrolling long lines

  - In Git Bash, if you have a long line, it disappears off the edge of
    the console. To get it to wrap long lines, run this:
      - This: `git config core.pager 'less -r'`

### File names and paths

  - Generally I think when specifying file names, you have to include
    the full path, and you have to precede it with “--” followed by a
    space
      - The path is always relative to the git root, so for instance…
          - Like this: “`--
            src/cprm/platform/services/formService.js`”
          - where src is a folder in C:\\Git\\cprm

### git init

  - Initialises an empty repository
  - To create a new git repo from command line : `git init` and then `git add .` (including the dot)

### git status

  - Shows you where you’re up to

### git add \<filename\>

  - Places a new file into the “staging area” (not committed yet)
      - Eg “git add myFile.js”
  - \!\! This is not just for adding new files
      - This command is also used to add new file *changes* into the
        staging area
  - \!\! You don’t have to do this.
      - You can use commit –a to add and commit all in one go.
  - To add all files in a subfolder:
      - This: `git add subFolder/`
  - To add all files with a particular extension:
      - This: `git add “\*.js”`
      - Eg: `git add
        src\\cprm\\plugins\\ot\\base\\specHelpers\\viewmodels\\questions\\questionsMocks.js`
      - (do you also need “--” before the file name?) (see “File names
        and paths”)
  - To add all new files:
      - This: `git add .`
  - To add all changes bit by bit:
      - This: `git add –p`
      - lets you choose portions of a file to add to the next commit.
        This will present you with a chunk of changes and prompt you for
        a command:
          - y to stage the chunk
          - n to ignore the chunk
          - s to split it into smaller chunks
          - e to manually edit the chunk
          - q to exit.
      - \!\! actually the above commands are not all always available.
        It will tell you which ones you can have.
  - To stage bits of files or individual files:
    - Like this: `git add –i`
    - More [here](https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging).

### git remote add

  - Creates a *connection* to a remote repository
  - This: `git remote add \<repo name\> \<url\>`
  - Eg: `git remote add remoteRepo
    https://github.com/try-git/try\_git.git`

### git remote

  - Either …
      - Create a connection to a remote repository (see `git remote
        add`, above)
  - Or…
      - List all remote repos which you have a connection to
      - Like this: `git remote`
      - Or like this:
          - `git remote -v`
          - (does the same, but includes urls)
  - Or…
      - Remove the connection to a remote repo
      - Like this: `git remote rm repositoryName`
  - Or…
      - Rename a remote connection from oldName to newName
      - Like this: `git remote rename oldName newName`
      - ? Is this actually renaming the remote repo or just renaming
        your connectio*n* to it? I suspect the latter?

### git commit

  - Normally…
      - Moves a file (or a *change* in a file) from the staging area
        into the repository
      - Like this: `git commit –m “CFTP-603: Refactored and removed
        commented code”`
      - \!\! You have to have the –m switch (followed by a commit
        message in quotes) – see troubleshooting for what to do if you
        forget, and get stuck in a VIM window
      - \!\! You have to run git add before running git commit, even if
        the file is only changed rather than added
          - BUT if you want to commit and add all in one go, use the –a
            switch:
          - Like this: `git commit –a –m "committing without having to
            stage first"`
          - Or this: `git commit –am "committing without having to
            stage first"`
  - Or…
      - Combine staged changes with the previous commit instead of
        committing it as an entirely new snapshot. It can also be used
        to simply edit the previous commit message without changing its
        snapshot.
      - \! Note that this actually creates a new commit, with a new Id –
        which then replaces the previous one
      - \!\! Never amend commits which have been pushed to a shared
        repository \!\!
      - Like this:
          - `git commit --amend --no-edit`
          - This adds new changes to the previous commit without
            changing the commit message
      - Or like this:
          - `git commit --amend –m "new commit message"`
          - This adds new changes to the previous commit AND changes the
            commit message
          - Note that if there have been no file changes since the last
            commit, then this just changes the commit message
      - Or if you just want to edit the prevous commit message:
          - `git commit --amend`
          - This will bring up a text editor
      - Or if you want to change a commit message that's further back in time:
          - use interactive rebase - [details here](https://www.educative.io/edpresso/how-to-change-a-git-commit-message-after-a-push)
      - Or if you want to change a commit message that's already been pushed to the server
          - Use the appropriate technique from above, then use `git push --force` to force the change up to the server.

### git rm

  - Removes a file / some files from the repo and also stages the
    removal for you
  - Like this: `git rm myFile.js`
      - (see “File names and paths”)
  - Or this: `git rm "\*.js"`
  - Can also be used for removing a file from the repo but NOT from
    disk, like this
      - (useful for when you have added files to gitignore after they’ve
        been committed)
      - `git rm --cached /path/to/file`
      - More here:
        <http://stackoverflow.com/questions/7527982/applying-gitignore-to-committed-files>

### git log (& search)

  - Show history of what you’ve done so far
  - \!\! To exit, type `q`
      - **To page down, hit spacebar**
      - **To see one more line of text, hit Enter**
  - This will give you a list of all the commit messages, with
    timestamps and snapshot Ids (not sure if this is what they’re
    officially called)
  - There are lots of switches that will change what you see – details
    here: <https://www.atlassian.com/git/tutorial/git-basics#!log>
      - Eg:
      - git log --oneline
          - each commit only takes up one line
      - git log --stat
          - gives more detail on what happened for each commit
      - git log –p
          - gives full detail of absolutely everything
      - git log \<file\>
          - Only display commits that include the specified file. This
            is an easy way to see the history of a particular file. 
          - (see “File names and paths”)
      - Find when a file was deleted: `git log --full-history --
        ./cookbooks/elasticsearch/recipes/develk\_nfs\_gce.rb`
  - To search by commit message:
      - This: `git log -g --grep=search\_for\_this`
  - To see details of an **individual commit,** use `git show` (see
    below)

### git show

  - Show details of an individual commit
      - Like this: git show d232f4d2a7f7f402c322046407b59fb8a7292327

### git push

  - Push all local commits to a remote repository
  - First one looks like this: `git push –u \<remote repo name\>
    \<branch name\>`
      - Eg: `git push –u origin master`
      - The –u switch will mean that Git will remember the parameters,
        so next time we can just run `git push`
      - The default branch name is always `master`
  - After that you can just run `git push`

### git pull

  - See “Checkout / Branch / Merge / Pull Confusions” above for full
    explanation of where `pull` fits into the process
  - Pulls down any changes that anyone else has made to the remote repo
  - Like this: `git pull remoteRepo master`
  - “master” represents the branch name
  - \! This is actually shorthand for git fetch followed by git merge –
    so what you are actually doing is fetching the new code from the
    server and then merging it into your current branch.
      - This means you need to be sure you are in the correct branch
        before you pull.
  - If there are any conflicts, the merge will be aborted and you will now have two copies of the branch on your machine - the local one and the remote one.
  - If you do `git pull --rebase` (this is what my alias `gup` does), if there are changes in both your
    local branch and the remote branch, git will attempt to play them on
    top of each other and create one smooth line, instead of splitting
    off and then coming back together again.
      - \!\! If conflicts are found during the rebase, you will end up
        partway through a rebase. You won’t be able to proceed until you
        finish the rebase.
      - To finish the rebase you must resolve the conflicts (but don’t
        commit the code, I think? The commands listed below will do that
        for you?) and then use one of the following:
          - `git rebase --continue`
          - `git rebase --abort`
          - `git rebase --skip`

### git fetch

  - Imports commits from a remote repository into your local repo.
  - Fetched content is represented as a remote branch, so doesn’t affect
    your local work
  - Also fetched repos don’t get listed when you run `git branch` (but
    they do when you run `git branch -r`)
  - If you run checkout against a fetched remote branch, it puts you in
    a detached HEAD state – it is not the same as switching to that
    branch
      - Well, that’s what it says here (), but actually that didn’t
        happen when I tried it – it seemed to just have the effect of
        converting it from a remote repo to a local repo
  - Remote branches are effectively read-only
      - To actually get the code, you can run `git merge` to merge it
        into your local branch
          - But this could mean you end up merging a remote branch with
            your current branch. You need to always run `git checkout
            master` before merging in a remote branch, unless you are
            sure that’s what you want to do
      - `git pull` is actually a shortcut version of `git fetch`
        followed by `git merge`

### git diff

  - This: `git diff HEAD`
      - Shows you all changes in your local repo since your last commit
      - Note that it does not distinguish between staged changes and
        non-staged changes
  - This: `git diff –staged`
      - Shows you all changes which have been staged (using git add) but
        not committed
  - This: `git diff \<commitId\> \<commitId\>`
      - Shows you all changes between the two commit Ids
      - Useful if you want to see all changes your made on your branch
        since you branched
          - (to find the relevant commit Ids, use git log and keep
            pressing space bar till you get back to the first ancestor
            on branch)
      - Example:
          - `git diff da3b613493e919301b58d6a8f4d665bebff3134f
            3d46bddb5645d16817602850a251684535b33507`
  - Options:
      - `--shortstat`
          - Gives a one-line summary of *all* changes
          - Example: `git diff HEAD --shortstat`
      - `--stat`
          - Gives a one-line summary of changes *per file*
          - The numbers at the end refer to numbers of lines changed.
          - The plusses and minuses refer to code added and removed
              - I *thought* it referred to chunks of code: For instance,
                two pluses and one minus = two new chunks of code added,
                and one chunk of code removed
              - Then I *thought* it was a ratio thing, like 2:1
              - Then after investigation, I decided it was completely
                arbitrary and wouldn’t even give consistent results when
                run twice in a row\!
      - `-- \<fileName\>`
          - Specify a file name if you want to view only a particular
            file
          - (note the space after “–“ - see “File names and paths”)
          - Example: `git diff da3b613493e919301b58d6a8f4d665bebff3134f
            38b127c01ee1d404be36144d37e3608c8ed5a500 --
            src/cprm/plugins/ot/base/viewmodels/patients/calendar/index.js`
      - `--numstat`
          - Like stat, but displays full paths of file names
          - The numbers refer to numbers of lines added and removed:
              - The first number is lines added
              - The second number is lines removed
  - Massive reference with all possible options here:
    <https://www.kernel.org/pub/software/scm/git/docs/git-diff.html>

### git rebase

  - Notes on how I used rebase when editing the Reconciliate refactor-branch commits during the writing on my Martin Fowler refactoring article are [here](https://github.com/claresudbery/RefactoringExamples/blob/master/github-markdown/notes/code-changes.md) (accessible to Clare only)
  - This is where you take a branch and define it is having started at a
    different point – ie you change the point which is its base
  - For instance:
      - you have branched from master and done some work
      - your work is unrelated to things which happened meanwhile in
        master
      - your merge is non-functional – ie you are just adding new code,
        and there are no conflicts
      - what you can do is redefine your branch as starting from the
        *current* state of master
      - then, when you merge, you can just do a fast-forward merge and
        keep a perfectly linear history
      - (a fast-forward merge is one where your branch just adds new
        functionality, and the previous tip can just be fast-forwarded
        to the tip of your branch – when looking at the tramlines after
        the merge, you will just see one continuous line)
  - More here:
    <https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase>
  - This is a good thing to do before merging a branch with master
  - It’s a way of merging master into your branch but with your commits
    as the most recent commits, played on top of the head of master,
    instead of hiding back in the commit history
  - It’s also easier to deal with conflicts than it is to deal with
    merge conflicts - you get step by step instructions on how to handle
    them and it plays everything action by action so it’s easier to back
    out of if you get stuck
  - Here’s the sequence of actions:
      - \[commit some new code in a branch based off master\]
      - `git rebase master`
          - (This takes all the master commits, applies them to your
            branch, then applies your branch commits at the head)
      - `git checkout master`
      - `git pull –rebase`
      - `git merge \[your branch name\]`

### git revert

  - Undoes a particular commit, and then does a new commit which
    corresponds to the change involved in undoing the previous commit
  - Like this: `git revert \<commitId\>`
      - To get the commit Id, use git log
      - Example: `git revert db3989e70879a02e4f857236d12945103e455031`
      - \!\! Remember this represents the commit that will be undone,
        NOT the commit that will become the new head
      - This only reverts one commit at a time. To safely revert
        multiple commits, do them one at a time, starting with the most
        recent… but that doesn’t have to result in several commits. You can use
        `git revert –no-commit \<commitId\>` for all the reverted
        commits, one at a time, then finally do `git commit –m “commit message”` to
        commit them all in one go. More here:
        <http://stackoverflow.com/questions/1463340/revert-multiple-git-commits>
  - `git revert --edit`
      - Will allow you to add a commit message to the revert
      - Like this: `git revert --edit
        db3989e70879a02e4f857236d12945103e455031`
  - \!\! This may result in a merge, if subsequent commits have altered
    the same part of the same file
  - If this happens, you get an error message, and the system stays in a
    stuck unmerged status until you sort it out like this:
      - git status
  - `git revert -m`
      - \!\! If you revert a merge, you have to choose which parent you
        are reverting to
      - Use the `-m` switch to choose a parent
      - Parents are numbered 1 and 2
      - To find out which parent is which, do this:
          - `git show db3989e70879a02e4f857236d12945103e455031`
          - This will list the two parents. The first one is number 1
      - Do it like this: `git revert
        db3989e70879a02e4f857236d12945103e455031 -m 1`
  - \!\! If you revert a merge, then try to re-merge further on down the
    line, you may get strange results.
      - Article here on how to handle this:
        <https://github.com/git/git/blob/master/Documentation/howto/revert-a-faulty-merge.txt>
      - tl;dr: Basically you want to make sure you know what you are
        doing when you revert a merge. The problem is that if you then
        try to re-merge, you will lose all changes made before the
        original merge
          - This is because when you reverted the merge, you only
            reverted the relevant commits – you didn’t revert the branch
            history. So as far as Git is concerned, the merge still
            happened, and the latest point of the relevant branch is
            AFTER the merge – it will ignore anything that happened
            before that
          - One answer is to revert the revert before re-merging…
          - …but it is safer (where practical) to discard the original
            branch and start again with a new branch, which contains all
            the commits you originally lost.
  - Note that using commit Ids, you are only reverting one commit at a
    time.
      - If you want to go back several commits, you could do it
        manually, starting with most recent and going back one by one…
      - Or you can use `git revert HEAD\~3`
          - **??? \!\!\! When Chen tried this, it didn’t work as
            expected\!**
          - **This would go back 3 commits, doing them one at a time**
  - If you get a merge conflict and you'd like to handle it by reverting
    - [Here is an example](https://github.com/claresudbery/Git-Playground/blob/master/Merging-examples.md) I manufactured when I was writing the O'Reilly trunk-based development (TBD) report
    - also references `git reflog`, `git cherry-pick`, `git diff`

### git reset

  - (\!\! be aware that `git reset` is dangerous if you have already
    pushed to the server - `git revert` is safer)
  - Can be used to …
      - Unstage any staged changes
      - Like this for a particular file: `git reset playground.js`
      - Like this for all staged changes: `git reset`
      - Note that the changes are still there in the files – they are
        just unstaged
  - Or…
      - Unstage AND REMOVE any staged changes since the last commit
      - Like this: `git reset --hard`
  - Or…
      - Undo all commits since the specified commit, but leave the lost
        changes in the working directory (but NOT staged)
      - Like this: `git reset \<commitId\>`
          - To get the commit Id, use git log
          - Example: `git reset
            db3989e70879a02e4f857236d12945103e455031`
          - \!\! Remember if you are trying to get rid of a particular
            commit, then you don’t use that commit Id - you want to
            reset to the *previous* commit Id
  - Or…
      - Undo all commits since the specified commit, AND reset the
        working directory
          - Like this: `git reset --hard \<commitId\>`
          - (see above re getting commitId)
      - \! This is dangerous\! There is no way to retrieve the original
        changes\! (if the commits are no longer referenced by any ref or
        the reflog)
          - It is safer to use `git revert`
          - It is even safer to use `git checkout` (see below)
  - Or…
      - Undo all commits on your local copy of a shared branch – to
        bring you back in line with the master
      - Like this: `git reset --hard origin/master` 
  - More here:
    <https://www.atlassian.com/git/tutorial/undoing-changes#!reset>

### git checkout

  - See “Checkout / Branch / Merge / Pull Confusions” above for full
    explanation of what checkout really means
  - Can be used to…
      - Go back to how things were at the last commit for a particular
        file (assuming any changes are unstaged)
      - Like this: `git checkout -- myCode.js`
      - **…**or just get rid of all unstaged changes: `git checkout .`
      - (`.` means current folder, just as `..` means the folder
        above)
  - Or…
      - Go back to how things were at a particular commit for all files
        committed at that commit
      - This will change the state of the files to match the changes at
        the commit, and then stage those changes
      - Like this: `git checkout \<commitId\>`
  - Or…
      - Go back to how things were at a particular commit for a
        particular file
      - This will change the state of the file to match the changes at
        the commit, and then stage those changes – so the new version of
        the file will be in the staging area
          - If you then want to go back to how things were at the most
            recent commit, do these two actions:
              - `git reset \<fileName\>`
              - `git checkout -- \<fileName\>`
              - (see “File names and paths”)
              - (\!\! be aware that `git reset` is dangerous if you
                have already pushed to the server - `git revert` is
                safer)
      - Like this: `git checkout \<commitId\> -- \<fileName\>`
          - Eg: `git checkout da3b613493e919301b58d6a8f4d665bebff3134f
            --src\\cprm\\plugins\\ot\\base\\specHelpers\\viewmodels\\questions\\questionsMocks.js`
          - \!\! Don’t forget the “--” part
          - (see “File names and paths”)
  - Or…
      - Pull back a previous version of a whole working directory
      - Like this: `git checkout \<commitId\>`
      - \!\! This then puts you into a “detached head” status, which
        means you have come away from the normal tramline of your branch
      - To get out of detached head status, run `git checkout master`
  - Or…
      - Checkout a particular branch
      - For master branch, it is just `git checkout master`
          - This puts everything back to the current state of the
            project
      - For a particular branch, it is `git checkout CFTP-1101`
  - Or…
      - Create a new branch and then check it out
      - Like this: `git checkout -b myNewBranch`
      - Or like this:
          - `git checkout -b myNewBranch myExistingBranch`
          - This creates a new branch *based on the specified existing
            branch* and then checks it out
          - **\!\!** If the branch in question exists on the server and
            you’ve already done `git fetch`, then just do this:
          - `git checkout myNewBranch`
              - Note that the auto-complete won’t work (cos you don’t
                have the branch yet), so you’ll have to copy it / type
                it out in full
      - Or like this: `git checkout –b myNewBranch
        058917745feaea1184fd67fda32ca08c27b5f0f2`
          - … creates a new branch starting from the specified commit
      - Or like this:
          - `git checkout \[remote branch name\] -b \[new local branch
            name\]`
          - Checks out a remote branch and also creates a new local
            branch which will be tracked to the remote branch
  - Or...
      - Pull a file into one branch from another branch: `git checkout
        \[other branch name\] -- \[path to file\]`

### git branch (inc renaming, creating and deleting)

  - See “Checkout / Branch / Merge / Pull Confusions” above for full
    explanation of where `branch` fits into the process
  - Either…
      - Create a new branch:
      - When given a name, creates a new branch
          - A branch is just a reference to a particular commit, which
            will be the last commit made in that branch, aka the “tip”
            of the branch
      - Like this: `git branch MyNewBranch`
  - Or…
      - Otherwise can be used to show what branches there are
      - Like this: `git branch`
          - Or like this: `git branch –r`
          - This shows remote branches too - ie those which you have
            “fetched” but which are still marked as remote
          - If you want to *see* all remote branches (whether fetched or
            not, I think), use `git branch -a`
      - This will list branches – the one with the star is the one your
        current working directory is using
  - Or…
      - If you want to checkout a remote branch and also create a new
        local branch which will be tracked to the remote branch:
          - **See under git checkout**
  - Or…
      - Remove a branch
      - Like this: `git branch –d myBranch`
      - \! This won’t work if you have unmerged changes.
          - In that case you would use `git branch –D myBranch`
          - This forces a delete even if there are unmerged changes
  - Or…
      - Rename a branch
      - Like this: `git branch -m oldBranchName newBranchName`
      - This will rename the current branch to newBranchName
  - (To switch branches, use `git checkout`)
  - There’s some useful stuff here about things like --setupstream-to:
    <http://stackoverflow.com/questions/21609781/why-call-git-branch-unset-upstream-to-fixup>

### git merge

- See also [strategies for avoiding tricky merges](#to-avoid-tricky-merges-when-merging-pull-requests) below
- See “Checkout / Branch / Merge / Pull Confusions” above for full
  explanation of where `merge` fits into the process
- Merge changes from one branch to another
- Like this: `git merge myBranch`
- This means you are not currently in the myBranch branch – you are in
  a different one. This will cause the myBranch changes to be merged
  into your current branch.
- If there are conflicts:
    - Git status will show you what’s waiting to be resolved
    - In SmartGit, the conflicted files have an exclamation mark on
      them
        - Right-click and select Conflict Solver
- If you get stuck in the middle of a merge and want to abandon
    - (You may get a message like this: “You have not concluded your
      merge (MERGE\_HEAD exists)”
    - Use this: `git merge abort`
        - If it says you need to commit changes first, you can just do
          `git stash` instead
        - Or if you get “merge is not possible because you have
          unmerged files.”, you can do `git add .` and then `git
          stash`
    - You can tell if it has worked in gitbash, because it will stop
      saying “MERGING” after the branch name
- If you get a merge conflict and you'd like to handle it by reverting
  - [Here is an example](https://github.com/claresudbery/Git-Playground/blob/master/Merging-examples.md) I manufactured when I was writing the O'Reilly trunk-based development (TBD) report

### To avoid tricky merges when merging pull requests

There are three strategies you can use to make merges easier:

#### 1. Small branches

Keep branches small, simple and short-lived. Restrict them to single items of change, and merge them as quickly and frequently as possible. If everyone on your team does this, then all merges will be small and therefore easier. Communicate with each other if you think you might have two people impacting the same area of code. Work together to avoid merge problems.

#### 2. Avoid branches altogether!

"Trunk-based development" refers to a strategy where everyone keeps merging with the main branch of the code ("the trunk"), very frequently indeed (at least once a day). This is an extreme version of the first approach and takes a bit of getting used to, but is actually the safest and most efficient appriach. you can read more about it [here](https://martinfowler.com/articles/continuousIntegration.html) and in my upcoming O'Reilly report on the topic.

#### 3. Merge and test locally before issuing a pull request.

Merge changes locally, and fix any resulting merge issues, BEFORE issuing a pull request.

When you have work ready to merge, do the following:

1. Pull the latest version of the main branch: `git checkout main` and then `git pull`
2. Merge the main branch in with your branch: `git checkout name-of-your-branch` and then `git merge main`
3. If there are any merge conflicts, fix them on your machine. If there are any problems, ask for help! Maybe you will need to get another team member to work through it with you.
4. Once you've fixed any merge conflicts, test the code locally. Is everything ok? Is anything broken?
5. Has the main branch changed again while you did the above? Just to make sure, run steps 1 and 2 again. Fix any issues. Test the code again.
6. Now you're finally ready to issue a pull request and merge your code back into main. At this point, it should be simple and easy and nothing should get broken.

### git clone

  - `git clone` \<repo url\> \<destination folder\>
  - Example: `git clone
    https://claresudbery@bitbucket.org/touch4/touch4.livsmarter.git
    C:\\Git\\LivSmarter\\Touch4.LivSmarter`
  - For shallow clone (= quicker):
      - `git clone \[path\] --depth 1`
      - More here:
        <http://learningbitsandbytes.blogspot.co.uk/2013/08/fast-git-clone-using-shallow-cloning.html>
  - **To get the url for cloning:**
      - Go to https://hhs.havaslynx.com/stash
      - Select your repository (eg cft then cprm)
      - Click Clone, top right – copy the uri
      - (Git Bash?) Command prompt:
      - `git clone` \[uri copied from Stash (eg
        ssh://git@hhs.havaslynx.com:7999/cft/cprm.git)\]

### git config

  - Allows you to change default settings, either on current branch
    (will then get stored in a config file in the .git folder) or
    locally (not sure where that’s stored\!)
  - For instance:
      - change the default so that git push only pushes the current
        branch:
      - global:
          - `git config --global push.default current`
      - or local:
          - `git config push.default current`
      - More here:
        <http://stackoverflow.com/questions/948354/default-behavior-of-git-push-without-a-branch-specified>

### git tag

  - To list tags: Just type git tag (with optional -l or --list):
  - To create an annotated tag: `git tag -a v1.4 -m "my version 1.4"`
  - To create a lightweight tag: `git tag v1.4-lw`
  - !! NB: Tags are not automatically pushed when you push branches.
    - To push a tag to the remote origin: `git push origin [tag name]`
      - eg `git push origin v1.0`
    - To push all tags: `git push origin --tags`

### git stash

  - More here: <http://git-scm.com/book/en/Git-Tools-Stashing>
  - `git stash`
      - will save all uncommitted changes in your working directory,
        ready to be recovered later
      - \!\! Watch out - if you have added new files, you need to do
        `git add .` first.
  - `git stash save` ‘stash name’
      - Same as `git stash` (see below), but you can name the stash
      - \!\! Watch out - if you have added new files, you need to do
        `git add .` first.
  - `git stash list`
      - will show you all your current stashes
      - \!\! Type q to get back to command prompt
  - `git stash show stash@{2}`
      - will show details of a particular stash
  - `git stash apply`
      - will apply the most recent stash
  - `git stash apply stash@{2}`
      - will apply a specific stash
  - `git stash apply --index`
      - will reapply the stashed changes AND restage any files which
        were staged but not committed
  - `git stash pop`
      - will apply the most recent stash AND remove it from the stack
        (or a named stash - `git stash pop stash@{2}`)
  - `git stash drop stash@{2}`
      - will remove the named stash from the stack
  - `git stash branch`
      - will create a new branch for you, check out the commit you were
        on when you stashed your work, reapply your work there, and then
        drop the stash if it applies successfully
  - Stuff about applying stashes:
      - If your working directory is not clean, it will attempt to merge
        changes, and let you know if any conflicts
      - You don’t have to apply the stash to the branch it was
        originally saved on

### gitk

* To see all changes file by file: `gitk`

## Git Playground

### These notes

  - …were originally written when I was at LateRooms, where I think I
    must have had another repo called Git Playground
  - There is now a repo in my Github account called Git-Playground,
    which I use for workshops – see TW
    Stuff\\Clients\\SMBC\\Workshops\\Git\\Git notes.docx

### Git flow init

  - Brand new repo, no commits, only has master branch
  - Run git flow init
  - Result:
      - Develop branch is created
          - There are apparently now three branches:
          - Master
          - Origin/master
          - Develop
      - All branches point at the same commit / same head
      - In C:\\\_git\\git-playground\\.git\\config, there are two
        gitflow settings - one for “branch” (setting up master and
        develop mappings), one for “prefix” (setting up prefixes like
        “feature”

### Tracking branches

  - At first (after running git flow init), there is only one branch
    element in C:\\\_git\\git-playground\\.git\\config
      - Has a branch section: `\[branch “master”\]`
          - 
          - Seems to be setting master up to track the remote master
            branch?
      - nothing doing the same for develop
      - develop branch exists locally
      - doesn’t appear to exist on server
      - Run this: `git push origin master`
          - Develop branch now exists on server
          - Still nothing in config for develop branch
  - Create a new branch (from develop) on server
      - Here’s how:
          - Select Project (on left)
          - Click menu icon (horizontal lines), top right
          - Select Git branch
      - Set up a new local branch to track the remote one (the
        longwinded way)
          - Like this: `git fetch` then `git checkout
            origin/feature/fluffy-kittens`
          - This creates a detached head, because you don’t have an
            actual branch locally which corresponds to that commit
              - So then you can do this: `git checkout -b
                feature/fluffy-kittens`
              - This creates a local branch which is the same as the
                remote branch
              - …but if you try and pull while in that branch…
              - You’ll get an error - because you are not yet tracking
                that remote branch
              - This means you now have to do this to set up remote
                tracking: `git branch
                --set-upstream-to=origin/feature/fluffy-kittens
                feature/fluffy-kittens`
              - *Now* you will have an entry in your config like this:
                `\[branch "feature/fluffy-kittens"\]`
      - To do all that the quicker way, just do this:
          - This: `git fetch`
          - Then this: `git checkout origin/evil-kittens -b
            evil-kittens`
          - Note that if you forget to do git fetch first, you will get
            the following error:
              - “fatal: Cannot update paths and switch to branch
                ‘feature/fluffy-kittens' at the same time. Did you
                intend to checkout 'feature/fluffy-kittens' which can
                not be resolved as commit?”
              - This is because the remote branch is not yet visible
                locally.
          - This will have the effect of creating a new local version of
            the branch, checking it out, and tracking it to the remote
            version (so, adding a new \[branch… entry to your git
            config).
      - Interestingly, you can do this:
          - This: `git fetch`
          - Then this: `git checkout -b anodyne-kittens
            origin/anodyne-kittens`
          - …which is exactly the same as doing `git checkout
            origin/anodyne-kittens -b anodyne-kittens`
          - …so the `-b anodyne-kittens` part and the
            `origin/anodyne-kittens` part can be swapped around.
          - Basically, the new branch name needs to go after the `-b`
            switch.

### Checking Out

  - Every time you fetch from remote, your FETCH\_HEAD file will be
    updated (C:\\\_git\\git-playground\\.git\\FETCH\_HEAD)
  - Every time you checkout, your HEAD files will be updated
    (C:\\\_git\\git-playground\\.git\\logs\\HEAD and
    C:\\\_git\\git-playground\\.git\\HEAD)

## Git hooks

- You can use git hooks for instance to prevent you from uploading sensitive data to GitHub.
- We did this at Samba - there's some very brief info (available to Clare only) in GitHub [here](https://github.com/claresudbery/samba), in `wiki-set-up-guide.txt` in the web-app sub-folder.

## API keys

- There are some brief setup instructions (available to Clare only) in GitHub [here](https://github.com/claresudbery/samba), in `wiki-set-up-guide.txt` in the web-app sub-folder.

## git reflog

[Here](https://www.w3docs.com/learn-git/git-reflog.html)