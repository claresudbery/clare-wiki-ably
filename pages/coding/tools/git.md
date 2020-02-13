---
layout: page
location: "pages/coding/tools/leaf"
permalink: /pages/coding/tools/Git
---

## GitHub Repos 

Sadly by necessity some of my repos are private. Those that are private are clearly marked. For those that are, please don't ask me to share the code, because I can't. They're listed here purely for my reference.

- [Git-Playground](https://github.com/claresudbery/Git-Playground)

## Git autostash

  - **git autostash**
    
      - You use it to stop you having to do git stash, git pull rebase,
        git stash pop
    
      - Although it’s not that hard, because you can pipe all three
        commands like this: **git stash && git pull --rebase && git
        stash pop**
        
          - It won’t do each following command unless the previous one
            completed successfully
    
      - We get the wrong version of git in our machines (for git
        autostash), so you might have to download a version of git and
        build it on their machine - which wasn’t too hard
    
      - But there’s an alternative which is to have git running in a
        docker container

## Git submodules

  - This command allows you to loop through all submodules: **git
    submodule foreach git pull**
    
      - We have submodules in the Chef repo.
    
      - I tried that command ^^ and it didn’t work.
        
          - To manually clone into the sensitive submodule instead:
        
          - This: **cd \~/development/chef/cookbooks/sensitive**
    
      - This one sort of did (apart from the permissions errors, which
        are to do with ssh vs https - see below): **git clone
        --recursive**
        
          - \! NB When it suggests **git clone --recursive
            <git@github.xxx.com:Sysops/chef.git>**, you might get an
            HTTP error or a public key permission error, in which case
            use **git clone --recursive
            https://github.xxx.com/Sysops/chef.git** instead
        
          - No, that doesn’t help. I think basically you have to set
            yourself up to use ssh instead of https, otherwise the only
            way to get it working is to manually clone each submodule
            repo into each folder using https.
        
          - You can fiddle around with editing **.gitmodules** file and
            calling **git remote set-url origin
            https://github.xxx.com/Sysops/xxx.git**, but this didn’t
            work for me (maybe because I didn’t call **git submodule
            sync**?) but should probably be using ssh (see below).

## Use ssh to Access Repos (instead of https)

  - Ssh stuff:
    [<span class="underline">https://help.github.com/en/articles/connecting-to-github-with-ssh</span>](https://help.github.com/en/articles/connecting-to-github-with-ssh)

  - This is what I did to get ssh up and running in the Chef repo - I
    did this twice, for both VM and local laptop:
    
      - This: **cd \~/development/chef/**
    
      - This to check remote url: **git remote -v**
    
      - This (if remote url does not match this one): **git remote
        set-url origin <git@xxx.git>**
        
          - To change it back again: **git remote set-url origin
            <https://github.xxx.com/xxx.git>**
    
      - This to check if you have any ssh keys already: **ls -al
        \~/.ssh**
    
      - This to create a new ssh public-private key pair: **ssh-keygen
        -C [<span class="underline">\[email
        address\]</span>](mailto:csudbery@etsy.com)**
    
      - This to start the ssh-agent: **eval "$(ssh-agent -s)"**
    
      - This to edit your ssh config file to automatically load keys
        into the ssh-agent and store passphrases in your keychain: **vim
        \~/.ssh/config**
        
          - Now add these lines (note the indentation should be a single
            space):
        
          - Host \*
        
          - IgnoreUnknown AddKeysToAgent,UseKeychain
        
          - AddKeysToAgent yes
        
          - UseKeychain yes
        
          - IdentityFile \~/.ssh/id\_rsa
    
      - This to add your SSH private key to the ssh-agent and store your
        passphrase in the keychain: **ssh-add -K \~/.ssh/id\_rsa**
        
          - \! The -K option is only for Mac: It only works on local machine
        and not VM (because that’s Linux and not Mac), so remove it for
        VM
    
      - Add the key to GitHub:
        
          - This to display key, so you can then copy to clipboard:
            **cat \~/.ssh/id\_rsa.pub**
        
          - Click your user icon, top right in GitHub, and select
            settings:
            [<span class="underline">https://github.com/settings/profile</span>](https://github.com/settings/profile)
        
          - click SSH and GPG keys on the left
        
          - Click New SSH key (top right) and give it an appropriate
            name
