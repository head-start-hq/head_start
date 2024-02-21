# Head start

The most basic Rails starter template for your next project.

## Features

- Lints ruby files with [standard](https://github.com/standardrb/standard)
- Lints js/ts files with Prettier and ESLint
- Typescript
- [Tailwind CSS](https://tailwindcss.com/), [devise](https://rubygems.org/gems/devise), [rails_heroicon](https://rubygems.org/gems/rails_heroicon) are setup by default.

## Getting started

1. Clone the repository
    ```bash
    git clone git@github.com:head-start-hq/head_start.git my_app
    ```

2. Enter the project directory
    ```bash
    cd my_app
    ```

3. Run these scripts
    ```bash
    ./bin/configure
    ./bin/setup
    ```

4. Set up version control
    ```bash
    rm -rf .git
    git init
    git add .
    git add -m "Initialize project"
    ```

5. Start your application
    ```bash
    ./bin/dev
    ```

6. Visit `http://localhost:3000`

## License

This project is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
