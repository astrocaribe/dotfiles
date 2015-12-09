## Installing New Environment

### Software Setup

#### [Ureka](http://ssb.stsci.edu/ureka/) - Astronomy Software
Ureka is an all-in-one tool for installing Python and Python-related
tools (iPython, iPython Notebook, etc). It is available at the [Space Telescope Science Intitute](http://www.stsci.edu); the latest version
can be downloaded [here](http://ssb.stsci.edu/ureka/1.4.1.2/).

To set up a Ureka python environment (leaving the system install
intact), simply type:

`$> ur_setup`

Then to use the system software, type the following to 'forget' the
Ureka environment:

`$> ur_forget`

Note that a variant of Ureka can also be initialized, by creating a
new one:

`$> ur_setup -n new_variant`

and thereafter can be loaded using;

`$> ur_setup new_variant`

This creates a self-contained virtual environment, loaded initially
with the Ureka core libraries. All python-related scripts (python,
ipython, pip, etc.) will be run from this variant by default. All
modules installed with pip will be installed into this variant.
Available variants can be listed using:

`ur_setup --list`

with the actual location of the variant in
*Users/default/Ureka/variants*, assuming Ureka was installed in
*Users/default/*.

Refer to the documents
[here](http://ssb.stsci.edu/ureka/1.4.1.2/docs/usage.html) for more
usage information.

#### Setup
##### Python Addons
* [autoenv](https://github.com/kennethreitz/autoenv) w/ `Homebrew`. Load
    a virtual environment automatically (a Ureka variant); this assumes
    that a variant *variant_name* has been previously created. See a
    sample .env file below:

    ```bash
    \#!/bin/bash

    \# Setup a Ureka environment if not yet set
    if [[ ! $VIRTUAL_ENV ]]
      then
        export VAR=variant_name
        ur_setup $VAR

        export OLD_PS1=$PS1
        export PS1=($VAR)$PS1
    fi
    ```

Change the *variant_name* variable above to an appropriate name. Consequently,
a tag `(variant_name)` will be appended to the begining of the prompt to
indicate that a variant is activated.  

Currently, you still have to manually deactivate your Ureka environment using
`ur_forget`; this wil not remove the tag created by executing the *.env* file.
The tag can be removed by appending the following to the `Ureka/bin/ur-forget-real` file:

    # Removes variant tag on left of Ureka virtualenv
    env_set PS1 '$OLDPS1'
    env_unset OLDPS1

* [yanc](https://pypi.python.org/pypi/yanc/). Color the `nosetests` output.
    - Install using `$> pip install yanc`
    - Invoke using `$> nosetests --with-yanc`


#### [Homebrew](http://brew.sh/) - OS X Package Manager
Homebrew is "The missing package manager for OS X", and boy is it! It makes
installing packges for different development software easy and painless, and
you can also write your own!

To install packages (assuming there is an available recipe), just type:

`$> brew install recipe_name`

For command-line help, try:

`$> brew help`

Visit the main [website](http://brew.sh/) for information on how to
install and use.

#### [Git](http://git-scm.com/) - Versioning For The Masses
I couldn't advocate for this more; wether for science or web development,
versioning is a **MUST**!!! Git is my tool of choice; start by learning to
[cutomize](http://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration) your git environment. And once you've customized to your hearts content,
there's plenty [documentation](http://git-scm.com/doc) to wade through!



### Prefered Development Apps

#### Sublime Text
I currently use [Sublime Text 3](http://www.sublimetext.com/3) for my
development. It is a wonderful editor that supports multi-language syntax
coloring, and allows for a host of plugins. Below are a few of my favourite:

[Package Control](https://sublime.wbond.net/installation) - The first plugins
that you should install. This one will manages all other plugins found in the
wild. Once you get this one, activate and search for you packages to install:

`Command + Shift + P` Opens Command Pallete. Browse the [usage](https://sublime.wbond.net/docs/usage)
instructions for additional help.

[MarkdownEditing](https://sublime.wbond.net/packages/MarkdownEditing) - Allows
for the editing of markdown with syntax, as well as options to preview, among
others.
