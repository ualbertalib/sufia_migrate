# SufiaMigrate

This is a first pass at exporting GenericFiles and Collections stored under a Sufia 6 implementation to a set of JSON files that can be used to import the data into a Sufia 7 implementation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sufia_migrate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sufia_migrate

To use the import or export rake tasks in your Sufia projects add the import or export rake file to your Rakefile:

```
spec = Gem::Specification.find_by_name 'sufia_migrate'
load "#{spec.gem_dir}/lib/tasks/export.rake"
load "#{spec.gem_dir}/lib/tasks/import.rake"
```

With the import, you'll need to create and configure ```config/sufia_migrate.yml``` to contain the ```user```, ```password```, and ```uri_root``` of the Sufia6 Fedora instance.

## Usage

To export Generic Files the idea is to run two rake tasks. One to export the IDs of all the files to export and another to actually export them to JSON files (one per Generic File). I suspect we could combine these tasks but for a final release.

```
rake gf_ids > gf_ids.txt
rake export_gf[gf_ids.txt]
```

Similar rake tasks can be used to export Collections.

You can see a sample of the JSON files generated when exporting a file and a collection here: https://gist.github.com/hectorcorrea/619c13fa540341be14cb01c762d9f2cc

The JSON file generated for Generic Files only includes the metadata (including metadata for versions and permissions) but not the actual binary. The idea is to fetch the binary (for the current and previous versions) directly from Fedora 4 at the time the data is imported to a Sufia 7 application.

To import Sufia 6 GenericFiles into Sufia 7 GenericWorks you must have some gf_*.json files in the current directory.
```
rake import
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ualbertalib/sufia_migrate.

