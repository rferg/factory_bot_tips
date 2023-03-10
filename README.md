# A Few FactoryBot Tips

## 1. Minimum valid base factory

- For the base factory of a model, populate only the attributes necessary to pass validations.
- Add attributes through overrides, traits, and nested factories.
- Avoids unnecessary attribute setting and allows you to always "build up" factories for test scenarios.

### Example

- [Model](app/models/author.rb)
- [Schema](db/schema.rb)
- [Factory](spec/factories/authors.rb)

## 2. Transient attributes

- Values that are available in a factory, but are not attributes on the resulting object.
- Can act sort of like parameters for factories with complex logic.
- Can be useful when creating a root object with associations that you want to change attributes on.

### Example

- [Code](app/models/copy.rb)
- [Factory](spec/factories/copies.rb)
- [Tests](spec/models/copy_spec.rb)

## 3. Not just for `ActiveRecord`s

- You can use factories to create any object, not just `ActiveRecord` models.
- This can be useful for any complex objects whose creation logic needs to be re-used or would clutter test files.
- Use transient attributes and the `skip_create` and `initialize_with` methods.
- Examples: API responses, reading from a file

### Example

- [Code](app/services/fetch_book_description.rb)
- [Factory](spec/factories/books_api_response_bodies.rb)
- [Tests](spec/services/fetch_book_description_spec.rb)

## 4. Avoid unnecessary uses of `create`.  Use `build_stubbed` or `build` instead

- DB operations make tests slow.  Avoid these if they are not necessary for tests.
- `build_stubbed` creates a stub of the object; calling attribute and association methods will return supplied values.  No DB calls.
- `build` creates an instance of object in-memory only.  Associations are also only built, not persisted, by default as of FactoryBot v5.
- These are especially useful when testing code that just consumes a model and calls methods on it, e.g., presenters, service objects.  Or when testing methods on a model that don't need the DB once instance is created.

### Example (create vs. build)

- [Code](app/models/loan.rb)
- [Tests](spec/models/loan_spec.rb)

### Example (build_stubbed)

- [Code](app/presenters/loan_presenter.rb)
- [Tests](spec/presenters/loan_presenter_spec.rb)
