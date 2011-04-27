# hexadecimal

An easier way to deal with hexadecimal strings.

# Example

Byte:


Data:

    data = Hexadecimal::Data.from_s("car")
    p data.to_ascii # => "car"
    data[0] = 11   # set as dec
    p data.to_ascii # => "bar"
    data[0] = "74" # set as hex
    p data.to_ascii # => "tar"

## Contributing to meta_tools
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Ryan Scott Lewis. See LICENSE.txt for
further details.

