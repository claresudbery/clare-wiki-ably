---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/PostgreSQL-and-PSQL
---

## PSQL

Useful links:

  - [Cheatsheet](https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546)
  - [Useful overview](http://postgresguide.com/utilities/psql.html)
  - [Official
    documentation](https://www.postgresql.org/docs/9.2/app-psql.html)

PSQL is an interactive command-line tool, like a REPL, really useful for
running PostgreSQL queries on the command line.

You can feed scripts into it using standard Unix stdin syntax (the \<
character), like this: `psql -U postgres -d database-name \< sqlfile.sql`.

You can pass individual SQL queries straight into psql using the `-c`
flag, and that will run up the psql terminal then immediately exit: `psql
-U postgres -d database-name -c "select \* from schema.table-name"`. You
can find more on the `-c` flag
[here](https://www.postgresql.org/docs/9.2/app-psql.html).

You can just run it up and then type queries in manually, like this:
`psql -U postgres`. Each query must be terminated with a semi-colon. They
can run across several lines - they won’t be executed until a semi-colon
is reached. Once you have the interactive terminal running you can use
meta-commands like `\c` to connect to a database, or `\du` to list all
users. More on those meta-commands [here
(cheatsheet)](https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546),
[here (useful overview)](http://postgresguide.com/utilities/psql.html)
and [here (official
documentation)](https://www.postgresql.org/docs/9.2/app-psql.html).

You can output query results to a file by running the following command:
`\o out.txt`. After that all query output will go to your file.

## AWS databases

### Access AWS databases via command line

  - Use [ssm to connect to the server](/pages/coding/data/AWS-And-SSM)
  - Once connected to the server
      - Run `sudo su postgres -c "psql -d \[database name\]"` to get a
        psql prompt for a specific database
      - Use `sudo su postgres -c psql -d \[database name\] -f
        your-script.sql` to run a script on a specific database
      - To get a script (or any other file) uploaded to an EC2 instance
        and you don’t have ssh enabled:
          - Upload files to a bucket either via AWS console or using aws
            `s3 cp filename s3://bucketname`
              - To upload all files from a folder: `aws s3 cp /your/path s3://bucket-name --recursive`
          - [SSM into](/pages/coding/data/AWS-And-SSM)
            the instance and download your files from the AWS bucket to
            the instance, using `aws s3 cp s3://bucketname/yourfile /yourfolder`
              - If you need to install `aws-cli` on an EC2 instance
                remember to do it as root user.
      - More on psql above in this doc, or [here
        (cheatsheet)](https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546) and [here
        (simple
        guide)](http://postgresguide.com/utilities/psql.html) and [here
        (full docs)](https://www.postgresql.org/docs/9.2/app-psql.html)

### Access AWS databases using pgAdmin

  - First [start a session via ssm](/pages/coding/data/AWS-And-SSM
  - In pgAdmin, right-click on Servers (top left) and choose Create |
    Server
  - Give it whatever name you like
  - On the Connection tab, fill in the following:
      - **Host**: \[ip address of db server\] 
      - **Port**: 5432
      - **Maintenance database**: database-name
      - **User name**: \[your db user name\] (follow instructions
        [here](#create-yourself-a-database-user)
        if needed)
      - **Password**: \[your db password\] (follow instructions
        [here](#create-yourself-a-database-user)
        if needed)
  - On the SSL tab:
      - load up your client certificate (xxx.crt), client certificate
        key (xxx.key) and root certificate (xxx.crt).
      - Set SSL Compression to Yes
  - Click Save

### Create yourself a database user 

  - Start a session to access the remote server
      - On command line:
          - `aws ssm start-session --target '\[EC2 instance id\]' `
          - Don't forget the quotes around instance id - the resulting
            error if you forget is non-obvious
      - ... or via AWS management console:
          - Use the Systems Manager service
          - Select Session Manager on left
          - Click Start Session, top right
          - Select the correct instance and click Start Session
      - Create yourself a database user:
          - `sudo su ec2-user`
          - `sudo su postgres -c "psql -d database-name"`
          - `create user \[yourname\] with password '\[your password\]';`
          - `GRANT ALL PRIVILEGES ON DATABASE database-name TO
            \[yourname\];`
          - `grant "Role\_Name" to \[yourname\];`

## Databases hosted in GovPaaS

See [Gov Paas / Cloud Foundry Access](/pages/coding/data/GovPaaS-And-Cloud-Foundry).

### Access GovPaaS databases using pgAdmin

  - If this is is your first time, see [section on getting started](#your-first-time)
    .
  - Run `cf conduit database-name` - where `database-name` is the database
    you're connecting to
      - ! Every time you log in you get a different username
      - you can take name, password, port, username from the output and
        use to connect via pgAdmin
  - Then, in pgAdmin
      - Servers | right-click | Create | Server to create yourself a
        production server (if you haven't already)
      - then on connection tab
      - host is just 127.0.0.1 as shown from `cf conduit` output
      - maintenance database is "name" from `cf conduit` output
      - password, port and username are all shown in `cf conduit` output
  - To run queries against the database using a nice UI (easier to parse
    than command line results), right-click on your database and select
    "Query Tool".

### Access GovPaaS databases via command line

  - !! Log in before doing anything else: `cf login`
      - See below if setting up for the first time
      - Your creds for cloudfoundry login are your GovPaaS creds
  - List services (eg databases currently running): cf services

<!-- end list -->

  - You can run psql commands directly as part of the cf conduit command
    like this:
      - `cf conduit database-name -- psql -c "select * from table-name"`
  - ...or you can run scripts directly as part of the cf conduit command
    like this:
      - `cf conduit database-name -- psql < sqlfile.sql`
      - ! In Powershell, you’ll get an error about < being a reserved
        symbol. To get around it, use this:
          - `cmd /c "cf conduit database-name -- psql < sqlfile.sql"`
  - ...or you can just bring up a psql prompt like this:
      - `cf conduit database-name -- psql`
  - More on psql above in this doc, or [here
    (cheatsheet)](https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546) and [here
    (simple
    guide)](http://postgresguide.com/utilities/psql.html) and [here
    (full docs)](https://www.postgresql.org/docs/9.2/app-psql.html)

### Your first time

  - First [install CloudFoundry cli](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html)
  - Run `cf login`
      - Your creds for cloudfoundry login are your GovPaaS creds
      - Note - when running `cf login` for the first  time, you may have
        to provide the `-a` parameter
        with `api.cloud.service.gov.uk`
  - Run `cf services` to see databases currently running
  - Run `cf conduit database-name` - where `database-name` is the database
    you're connecting to
      - You'll need to install conduit: `cf install-plugin conduit`

## Backing up and Restoring Individual Tables

### Backing up an individual table locally in pgAdmin

  - You can just do right-click | Backup and save the \*.dmp file
    somewhere.
      - It’s a good idea to also do right-click | Count Rows and make a
        note of how many rows there are so you can check later results
  - If you want to have the backed-up table sit side by side with the
    original for any reason:
      - Right-click => Scripts => CREATE Script
          - Keep a separate copy of this script in its original form so
            you can track any changes you make, if you have any plans to
            drop the original table
      - Right-click => Properties => give your table a new name (eg
        tablename-backup)
      - Edit the CREATE script:
          - Give any constraints or indexes new names (because it won’t
            allow duplicates)
      - Run the CREATE script
      - Check all the constraints and indexes in the CREATE script are
        visible in pgadmin:
          - Right-click => Properties => Constraints - check all tabs
          - If you can't see what you're looking for in Properties (eg
            indexes), do right-click | Scripts | CREATE Script instead,
            and compare with original
          - If not, add manually like this (more complex example below):
          - ALTER TABLE table-name ADD CONSTRAINT constraint-name UNIQUE
            (columnid);
      - Tables => Right-click => Refresh (to see your newly-created table)
      - Select new table | right-click | Restore using the backup you
        created at the start
      - Check it worked\! Right-click | Count Rows to see there is
        something there.
          - Sometimes it can silently fail - for instance you can’t
            restore the backup of a table into a table that has a
            different name (which is why you renamed the original table
            above).
      - If there are any other tables that reference your table, be
        aware that they will now be referencing the renamed backup
        version you started with. You might want to rename both tables
        to reflect this (ie make the new one the backup).

### Restoring an individual table from a local backup in pgAdmin

  - If you want to completely overwrite the current version of a table
    so that it's restored to its former glory:
  - Ideally you’ll just restore the rows using a backup you created
    earlier:
      - right-click => Restore
      - select backup file
      - On the Restore options tab:
          - Select No to Only data (if you can)
          - Select Yes to Clean before restore
          - Click Restore
          - Problems:
              - Only data might be greyed out - see below.
              - You might get errors like “duplicate key value violates
                unique constraint” - see below
  - If you get errors like “duplicate key value violates unique
    constraint”:
      - This is probably because you haven’t selected Clean before
        restore, which is the equivalent of right-click | Truncate |
        Truncate
      - \! Be very wary of Truncate cascade, which is the advice given.
        That will delete referencing data as well as the data in your
        table.
  - If you can’t select Only data because it’s greyed out, this will
    probably be because there are other tables that have foreign key
    constraints referencing your table. To find out more, and to fix:
      - Run up a `psql` interactive terminal on the command line: `psql -U
        postgres` and enter the pw for Postgres superuser
      - Run this command: `\d+ schema."yourtablename"` (where schema is
        the relevant schema)
      - At the bottom of the output is a Referenced by section which
        tells you what you need.
      - The other way to find out is right-click | Delete/drop, which
        will give you an error telling you where it’s referenced. This
        is a bit drastic though - what if you don’t get an error??
      - Now you can go to the referencing table(s) and remove the
        references (storing a copy first):
          - Find the relevant table
          - Right-click => Scripts => CREATE Script (keep a copy of this)
          - Right-click => Properties => Constraints => Foreign Key
          - Make a note of the name of the constraint
          - Delete the constraint
          - Go back and have another go at doing the Restore with Only
            data turned off and Clean before restore turned on. Don’t
            forget to restore the constraint(s) afterwards:
              - Create a new constraint matching the old one:
                  - Either do it manually, or (for instance if it won't
                    let you reference tables in other schemas) use the
                    details in the CREATE script you created earlier to
                    create an ADD CONSTRAINT statement
                  - It will look something like this:
                  - `ALTER TABLE cqccurrent."Establishment" ADD CONSTRAINT estloc\_fk FOREIGN KEY ("LocationID")`
                  - `REFERENCES cqcref."location" (locationid) MATCHSIMPLE`
                  - `ON UPDATE NO ACTION`
                  - `ON DELETE NO ACTION;`

### Restoring an individual table locally from a remote backup

I found this quite tricky. This is what worked in the end:

  - If you want to keep a backup before overwriting with a restore:
      - Rename your existing table (Right-click => Properties in pgAdmin)
      - Create an empty copy (pgAdmin: right-click => Scripts => CREATE
        Script, then run the resulting script)
  - If you’re happy to just replace the old data with the new data:
      - in pgAdmin: right-click => Truncate => Truncate
  - Log onto the database: `cf login`
  - Backup the table: `cf conduit database-name -- pg_dump -t schema."table-name" > table-name-backup.dmp`
      - This creates a SQL script that relies on the COPY command.
      - WARNING: THIS MIGHT BE SLOW FOR A BIG TABLE.
  - Edit the resulting script - I found vim was the quickest and easiest
    way to open it - it takes a few seconds for a big one to open so be
    patient:
      - Remove the CREATE TABLE command at the top
      - Remove the command near the top changing the owner
      - Remove the CREATE INDEX command at the bottom
  - Start up a local psql terminal: `psql -U postgres `and use pw for
    Postgres superuser
  - Connect to your database: `\c database-name`
  - Run this: `\i 'path/to/table-name-backup.dmp'`
      - It’s amazingly quick compared to the backup
      - (for gotchas see below)

#### Gotchas

  - If you’re on Windows and you get an error from line 1 syntax error
    at or near "ÿ\_", it’s caused by Unicode discrepancies. You can do
    the following:
      - In a Linux terminal (using WSL):
      - `sudo apt-get install dos2unix`
      - `dos2unix path/to/table-name-backup.dmp`
  - If you’re on Windows and you get "C:: Permission denied", this could
    be because you used backslashes instead of forward slashes in your
    `\i` command. You also need the single quotes.
  - The `pg_dump` command above creates a backup type that's not
    compatible with `pg_restore`:
      - If you try to restore it using `pg_restore` or right-click |
        Restore in pgadmin, you'll get an error "input file does not
        appear to be a valid archive".
      - The `-Fc` flag is supposed to fix this, but I couldn’t get it to
        work:
          - `cf conduit database-name -- pg_dump -Fc -t schema."table-name" > table-name-backup-for-pg\_restore.dmp`
          - `pg_restore -Fc -t schema."table-name" -d database-name path/to/table-name-backup-for-pg_restore.dmp`
  - The `\i` command at the psql prompt is supposed to be equivalent to
    the following:
      - `cmd /c "psql \[databasename\] \< path/to/table-name-backup.dmp"`
          - You need the `cmd /c` and the quotes on Windows because
            otherwise there’s an error about "the < operator is
            reserved for future use"
          - You’ll also find if you run it like that it will asks for pw
            for user \[yourname\], which confused me because I couldn’t
            find a pw that worked.
              - This was because I tried to log into postgres with a
                user called \[yourname\]. I should have used `psql -U postgres` instead and used the pw for Postgres superuser.
  - In Git Bash, the equivalent: `psql.exe [databasename] < path/to/table-name-backup.dmp`
      - (you need the .exe because of the error "stdin is not a tty")
  - In Windows Terminal, you may get errors like character with byte
    sequence 0x81 in encoding "WIN1252" has no equivalent in encoding
    "UTF8"
      - There are suggestions for actions you can try
        [here](https://stackoverflow.com/questions/38481829/postgresql-character-with-byte-sequence-0xc2-0x81-in-encoding-utf8-has-no-equ)
        and
        [here](https://stackoverflow.com/questions/20794035/postgresql-warning-console-code-page-437-differs-from-windows-code-page-125)
        - the main one seems to be run `cmd.exe /c chcp 1252` before
        opening `psq`l - but I couldn’t get this error to go away. In the
        end I just ran it in Unix instead (it happened when I tried to
        import a csv into a temp table - there was one line
        in the csv that seemed to have rogue characters - but weirdly
        the first time I imported it there was no problem).
  - If you get permissions errors about your target file when trying to
    use `pg_dump` on AWS:
      - You need to place your dump file in a folder that the `postgres`
        user has access to.
      - Make sure you are using the `postgres` user. As soon as you log in
        to the AWS instance, run `sudo su postgres`. Don’t run `sudo` again.
        If you are asked for the `postgres` password after running a `sudo`
        command, it’s probably because you ran a `sudo` command after
        running `sudo su`.
