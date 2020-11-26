# FLIX Rails Backend API

**FLIX** is a movie database query that allows users to like and dislike films. 

This is the Rails Backend API for **FLIX**. 

You can access the FLIX Frontend [here](https://github.com/PeaWarrior/flix-frontend).


## Prerequisites

1. Install [Homebrew](https://brew.sh/)

    ```console
   $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ```

2. Install [Ruby](https://www.ruby-lang.org/en/)

    ```console
    $ brew install ruby
    ```

3. Install [Ruby on Rails](https://rubyonrails.org/)

    ```console
    $ gem install rails
    ```

4. Install [PostgreSQL](https://www.postgresql.org/)

    ```console
    $ brew install postgresql
    ```

## Getting Started

1. Clone this repository and `cd` into the directory

2. Install dependencies

    ```console
    $ bundle install
    ```
    
3. Initiate the database and migrate

    ```console
    $ rails db:create db:migrate
    ```

## Initial Configuration
**FLIX** is uses an external API for querying data and will NOT work without the following steps. 

1. Obtain a key for The Movie Database API:
    * https://developers.themoviedb.org/3/

2. Create a new `.env` file in the root directory of this project API.

    ```console
    $ touch .env
    ```

3. Add the API keys to your `.env` file by copying the following and replacing the `<...>` with the correct corresponding key.

    ```env
    TMDB_API_KEY=<TMDB API KEY HERE>
    ```
4. Remember to add the `.env` file to your `.gitignore`.

## Starting the Server

```console
$ rails s -p 3001
```

This will start the server on port 3001 which can be accessed at http://localhost:3001.

If you want to use a different port, make sure you change the `src/utilities/constants.js` file in the [Frontend](https://github.com/PeaWarrior/flix-frontend) to fetch from the right port.

FLIX is released under the [MIT License](https://opensource.org/licenses/MIT).
