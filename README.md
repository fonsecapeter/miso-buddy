# Miso

Your best bud in the terminal!

## Installation

### Build from source
Don't worry it's super quick/easy, I promise :grimacing:.

[Install crystal](https://crystal-lang.org/docs/installation/) if you don't have it yet

> TL;DR: `brew install` or add ppa and `sudo apt install` `crystal-lang`

Clone the repo
```
git clone https://github.com/fonsecapeter/miso-buddy
```
Get in there
```
cd miso-buddy
```
Build your very own miso
```
make
```
Introduce him to your computer by symlinking somewhere on your path
```
sudo ln -s $(realpath ./bin/miso) /usr/local/bin/miso
```

## Usage

Just call `miso` from your terminal to wake him up. He can help out from there.

## Development

Write code in `src/` and tests in `spec/`.

Run tests with `make test`.

Fast compile and run with `make run`.

Build executable with release-worth optimization in `bin/miso` with `make`

When updating the version, add a git tag with `make tag`. Will tag the last commit, so add separate version bump commit and push it then tag.

As for the actual code, miso uses a sort of mini internal MVC framework from `src/miso/mvc`. Adding a new `route` is pretty straightforward -- just check out the others.

## Contributing

1. Fork it ( https://github.com/fonsecapeter/miso-buddy/fork )
2. Create your feature branch (git checkout -b enhance/ISSUE-short-description)
3. Commit your changes (git commit -am 'Resolve #ISSUE some feature')
4. Push to the branch (git push origin enhance/ISSUE-short-description)
5. Create a new Pull Request

## Contributors

- [fonsecapeter](https://github.com/fonsecapeter) Peter Fonseca - creator, maintainer, all-around cool guy


> Made in the best language ever: [crystal](https://crystal-lang.org/)
