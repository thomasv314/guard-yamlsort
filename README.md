# Guard::Yamlsort
Guard::Yamlsort alphabetically sorts keys in yaml files when a modification is detected.

![Preview of guard-yamlsort](https://raw.githubusercontent.com/thomasv314/guard-yamlsort/master/preview.gif "Preview of Guard yamlsort")

## Requirements
* The [Guard](https://github.com/guard/guard) rubygem.
* Ruby 1.9.2 or higher.

## Install

Add guard-yamlsort to your Gemfile (inside development group):

```bash
gem 'guard-yamlsort'
```

Install or update your bundle:

```bash
bundle install
```

Add the default guard-yard definition to your Guardfile:

```bash
  guard init yamlsort
```

## Guardfile

```ruby
guard 'yamlsort' do
  watch(%r{^config/locales/.+\.yml})
end
```
