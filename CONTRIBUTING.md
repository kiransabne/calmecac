# How to contribute to this project

## Reporting bugs and issues

Did you find a bug?

* **Ensure the bug was not already reported** by searching on GitHub under [Issues](https://github.com/IcaliaLabs/epick/issues).

* If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/IcaliaLabs/epick/issues/new). Be sure to include a **title
and clear description**, as much relevant information as possible, and a **code sample** or an
**executable test case** demonstrating the expected behavior that is not occurring. Also add a `bug`
tag to it.

## Understanding the source code

Do you have questions about the source code?

* Ask any question related to the project, you can ask any of the members listed in the
[README](./README.md#da-team).


## Making Changes

* Create a topic branch from where you want to base your work:
	* The base is usually either the `master` branch (the current release), or an `epic/*` branch.
	* Use the following format for the new branch name:
		* `feature/name-of-your-feature` for new features
		* `fix/name-of-your-fix` for fixes
		* `epic/name-of-the-epic` for epics - i.e. long running efforts that should be released at once
	* To quickly create a topic branch based on master; `git checkout -b fix/name-of-your-fix master`.
	  Please avoid working directly on the `master` branch.
* Make commits of **logical units**.
* Check for unnecessary whitespace with `git diff --check` before committing.
* Make sure your commit messages are in the proper format:
	* First line must be a capitalized, short (50 chars or less) summary.
	* Add a detailed explanatory text, if necessary, after the first line. You can use paragraphs,
	  bullets, etc for this. Wrap your lines at 80 characters.

````
    Fixed SessionSerializer#unmarshal [Fixes #89685]

    The session serializer `unmarshal` method was treating values as strings instead of hashes. This
		commit includes fixes on this method, as well as some code style fixes.
````
	* [This is a good guideline](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
	  to follow for commit messages.

* Make sure you have added the necessary tests for your changes.
* Run _all_ the tests to assure nothing else was accidentally broken.

## Making Trivial Changes: Whitespaces, code formatting and purely cosmetic patches

For changes that are cosmetic in nature and do not add anything substantial to the stability,
functionality, or testability of rts-hawkeye-services, just add the `cosmetic` tag and assign the
code reviewer.

## Placing a Pull Request

Are you ready to place a pull request?

* Open a new GitHub pull request with the patch.
* We use a pull request template so that you don't have to worry about the format, but make sure you
	include the following:
	* Make sure to list the problems you are addressing
	* Include the relevant issue numbers if applicable
	* Follow the checklist
* When submitting a pull request you can make use of two tag titles, which helps the code reviewers
	to notice about the status of the pull request, for example if you need the pull request to be
	checked right away you can add into de title something like - `[URGENT] This is the pull request
	title` - but there are some other times you hace work pending on the pull request, in that case the
	tag would be - `[WIP] This is the pull request title`
* Whenever you are ready to request a review, just remove any title tag (WIP or URGENT) and assign
	the code reviewer, otherwise it won't be reviewed.

Thanks! :heart: :heart: :heart:
