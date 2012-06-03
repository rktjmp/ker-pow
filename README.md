# Ker-Pow!

## What is Ker-Pow?

`Ker-Pow` creates an index of your [Pow](http://pow.cx/) apps.

`Ker-Pow` will notice any symlinks and folders inside `~/.pow/` except for itself.

`Ker-Pow` is a [sinatra](http://www.sinatrarb.com/) app and requires the sinatra gem to be installed. Details are provided below.

## What does it look like?

`Ker-Pow` probably looks close to this:

![Ker-Pow preview](https://github.com/rktjmp/ker-pow/raw/master/preview.png "Ker-Pow preview")

## How do I get it?

	cd ~/.pow
	git clone git@github.com:rktjmp/ker-pow.git default
	cd default
	bundle install
	open http://localhost.dev

`Pow` will run any app placed inside `~/.pow/default/` when you navigate to `http://localhost.dev/`, which is why you check out to the folder `default`.

## Hey! Something's broken!

Bug fixes are welcomed. 

First, fork `Ker-Pow` then create a new branch with your fix in it. Submit a pull request for your branch.