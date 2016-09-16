# Authentication demo

This is the example web application for demonstrating a simple authentication system. Most of ideas are adopted from
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

---

## Minitest memo

#### Running tests

```bash
$ bundle exec rake test             # Run all the tests.
$ bundle exec rake test:models      # Run only the model tests.
$ bundle exec rake test:integration # Run only the integration tests.
```

```bash
# Run a specific test within a test file
$ bundle exec rake test\           
  TEST=test/integration/users_login_test.rb\
  TESTOPTS="--name test_login_with_valid_information"
```

#### Generating a test

```bash
$ rails generate integration_test site_layout
```


#### Logging

```bash
$ tail -f log/test.log
```

---

### The method for authenticating users
By comparing hashed values instead of raw passwords, we will be able to authenticate users without storing the passwords themselves. This means that, even if our database is compromised, our users’ passwords will still be secure.

1. Take a submitted password
2. Hash it
3. Compare the result to the hashed value stored in the database
4. If the two match, then the submitted password is correct and the user is authenticated.

https://www.railstutorial.org/book/modeling_users#sec-adding_a_secure_password
