# Cookiecutter-Repo

[Cookiecutter](https://github.com/audreyr/cookiecutter) is a cross-platform software tool that generates [**boilerplate**](https://en.wikipedia.org/wiki/Boilerplate_code) for [**software projects**](https://en.wikipedia.org/wiki/Software_project_management) from templates.  These templates, called **cookiecutters**, can be used to define:

* How a project's directories and files are named and organized;
* The content of a project's files.

They can also facilitate, both manually and automatically, the run-time customization of the generated names and content.

The cookiecutter presented here, Cookiecutter-Repo, defines a boilerplate template for creating [**software repositories**](https://en.wikipedia.org/wiki/Software_repository) ("repos") &mdash; collections of one or more software projects.  The generated boilerplate is a basic directory tree and a starter set of files, which can then be used to begin building software targeting a particular software platform (e.g., Python or Swift).  Included in these files are:

* Makefiles defining build automation rules for software projects;
* Skeletal source code targeting a particular software project platform;
* Rules for code and codeless contributions;
* Other supporting artifacts (`README.md`, software license, references, etc.).

It should be noted that, colloquially speaking in the context of software project management, "repository" and "project" are interchangeable.  In contrast, Cookiecutter-Repo treats these terms as technically distinct.  The reasons why are twofold:

1. To align with [GitHub's definition](https://help.github.com/en/articles/github-glossary#repository) of what a repository is: its "most basic element" for containing "all of the project files (including documentation)" and storing "each file's revision history";
help.github.com/en/articles/github-glossary#repository)
2. To reinforce that a single repository may contain both deliverables (e.g., source code) and supporting artifacts (e.g., documentation) for multiple software projects.

## Usage

Boilerplate from Cookiecutter-Repo can be generated by running shell or Python scripts.  Furthermore, during boilerplate generation, Cookiecutter-Repo itself can be sourced remotely via a direct download or locally via a cached copy from a prior download.  The subsections that follow show the syntactic differences for each aforementioned approach.

### Shell

The command `cookiecutter` generates boilerplate from a shell's command-line interface (CLI).  The argument following `cookiecutter` specifies both the cookiecutter (which, in this case, references Cookiecutter-Repo) and whether its source is remote or local.

* Remote source:

    ```sh
    # The following syntax options are semantically equivalent.
    
    # Option 1: URL
    $ cookiecutter https://github.com/djrlj694/cookiecutter-repo.git
    
    # Option 2: 'gh" prefix
    $ cookiecutter gh:djrlj694/cookiecutter-repo
    
    # Option 3: 'git+ssh' prefix
    $ cookiecutter git+ssh://git@github.com/djrlj694/cookiecutter-repo.git
    ```

* Local source:

    ```sh
    $ cookiecutter cookiecutter-repo/
    ```

### Python

The Python library `cookiecutter.main` provides an application programming interface (API) for calling Cookiecutter functions to generate boilerplate.

* Remote source:

    ```python
    from cookiecutter.main import cookiecutter
       
    cookiecutter('https://github.com/djrlj694/cookiecutter-repo.git')
    ```
    
* Local source:

    ```python
    from cookiecutter.main import cookiecutter
       
    cookiecutter('cookiecutter-repo/')
    ```
    
## Options

The `cookiecutter.json` file, located in the root directory of a cookiecutter repository (i.e., in the same directory as the cookiecutter itself), specifies run-time customization options for generating a new repository.  These options are encoded as JSON key/value pairs.  Each key denotes a template variable (e.g., `{{cookiecutter.`*`JSON_KEY`*`}}`), whereas each value denotes either a default value or an array of legal values for its respective key.  Together with [Jinja2](http://jinja.pocoo.org/docs/2.10/) as a template language, `cookiecutter.json` can be used to customize the names of directories and files as well as the content within files.

Customization options defined in Cookiecutter-Repo's `cookiecutter.json` are as follows:

| Key | Description | Value(s) | Default Value |
| --- | ----------- | ------ | ------------- |
| `repo_name` | The repository's name as it would appear in documents (e.g., with spaces and mixed-case) | N/A | `REPO_NAME` |
| `repo_dir` | The URL-conforming (i.e., hyphens replace spaces) name of the repository's root directory | N/A | A lower-case, hyphenated version of the value of `repo_name` |
| `repo_license` | The repository's optional (but highly recommended) open-source software licence | `Not open source`, `Apache Software License 2.0`, `BSD-3`, `GNU GPL v3.0`, `MIT`  | `Not open source` |
| `repo_platform` | The repo's primary software platform/product | `Cookiecutter template`, `Python data science project`, `Python module`, `Python package`, `Swift executable package`, `Swift library package`, `Xcode project` | `Cookiecutter template` |
| `add_github` | A boolean specifying whether to add a `.github` directory tree with Markdown files documenting rules on how to contribute | `True`, `False` | `True` |
| `add_make` | A boolean specifying whether to add a `.make` directory tree with makefile files defining build automation rules for software projects | `True`, `False` | `True` 
| `lead_name` | The name of the repository's lead author | N/A | `USER@DOMAIN.TLD` |
| `lead_email` | The email address of the repository's lead author | N/A | `USER@DOMAIN.TLD` |
| `github_user` | The repository's GitHub account | N/A | `GITHUB_USER` |
| `travis_user` | The repository's Travis CI account | N/A | `TRAVIS_USER` |
| `package_name` | The Xcode-conforming name of the project's subdirectory for its primary software package | N/A | A de-hyphenated version of the value of `repo_dir` |

By default, the user is prompted to assign a value for each key.  This cookiecutter feature may also be silenced.  The subsections that follow show how.

### Shell

```sh
$ cookiecutter --no-input ...
```

### Python

```python
cookiecutter(..., no_input=True)
```

## System Requirements

Cookiecutter-Repo supports the 3 major operating systems:

* Linux
* macOS
* Windows

To use Cookiecutter-Repo, the following software must first be installed on your system:

* [Python](https://www.python.org/downloads/) 2.7, 3.4, 3.5, 3.3, or PyPy
* [Cookiecutter](https://github.com/audreyr/cookiecutter) Python package 1.6.0 or higher

## Installation

For info on installing any of the prerequisite software, refer to the [official](https://cookiecutter.readthedocs.io/en/latest/installation.html) installation document.

## Known Issues

Currently, there are no known issues.  If you discover any, please kindly submit a [pull request](CONTRIBUTING.md).

## Contributing

Code and codeless (e.g., documentation) contributions toward improving Cookiecutter-Repo are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for more information on how to become a contributor.

## License

Cookiecutter-Repo is released under the [MIT License](LICENSE.md).
