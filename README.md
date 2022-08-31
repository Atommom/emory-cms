# README

This README would normally document whatever steps are necessary to get the
application up and running.

# Dev setup

## For a new computer

1. install homebrew. Got to https://brew.sh/ to find out how.
2. `brew install gnupg gnupg2`
3. `\curl -sSL https://get.rvm.io | bash`
4. Install ImageMagick: `brew install imagemagick`
5. Launch a new Terminal
6. `rvm install 2.7.1`
7. `brew tap petere/postgresql`
8. `brew install postgresql@9.5`
9. `brew install petere/postgresql/postgresql-common`
10. `pg_createcluster 9.5 main`
11. `alias pg_start="pg_ctlcluster 9.5 main start"`
12. Check out both the api and frontend repos. For this, you'll need the show laptops' GitLab account info, and links to the repos.

## CMS

1. `cd` into the CMS project directory
2. `rvm use 2.7.1@emory --create`
3. `bundle install`
4. `gem install rails`
5. `rails db:create db:migrate db:seed`
6. Now read all current pages from local JSON file in rails console:
7. `rails c`
8. `load "db/seeds/page_seeds.rb"`
9. `import_pages`

# Serve

On each restart, you will need to start postgresql. In Terminal, on the show laptops (iU Preso 03 and iU Preso 01), `pg_start` should do it.

If that doesn't work, try `pg_ctlcluster 9.5 main start`.

If that doesn't work, then you're on a work station that doesn't have the right stuff installed. Contact mgilbert@ideasunited.com and/or one of your managers.

To serve the site on a local IP address, run `rails s --binding=0.0.0.0`.

The admin interface will be available at localhost:3000/admin.
The admin login is:
email: admin@example.com
password: password
