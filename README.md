# Betterls

*Betterls is ls, but better.* :sparkles:

[![Actions Status](https://github.com/mark-gutenberger/betterls/workflows/MacOS/badge.svg)](https://github.com/mark-gutenberger/betterls/actions)
[![Actions Status](https://github.com/mark-gutenberger/betterls/workflows/Windows/badge.svg)](https://github.com/mark-gutenberger/betterls/actions)
[![Actions Status](https://github.com/mark-gutenberger/betterls/workflows/Ubuntu/badge.svg)](https://github.com/mark-gutenberger/betterls/actions)
[![codecov](https://codecov.io/gh/mark-gutenberger/betterls/branch/master/graph/badge.svg)](https://codecov.io/gh/mark-gutenberger/betterls)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/mark-gutenberger/betterls)](https://github.com/mark-gutenberger/betterls/releases)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=shields)](http://makeapullrequest.com)
[![c++20](https://img.shields.io/badge/C%2B%2B-20-magenta.svg)](https://en.m.wikipedia.org/wiki/C%2B%2B20)


Betterls is largely inspired by [colorls](https://github.com/athityakumar/colorls/) (written in ruby :gem:). betterls is entirely written in C and C++, in as bare metal code as possible. development is platform driven and *Yes, yes it does work on Windows.* betterls takes GNU coreutil `ls` and supercharges :superhero: it, giving it *configurable* colored output, and configurable icons via a [nerdfont](https://www.nerdfonts.com/).

`TODO: add image here`

## Table of Contents

- [Overview](#Overview)

- [Usage](#Usage)

- [installation](#Installation)

- [Recommended configurations](#recommended-configurations)

- [Custom configurations](#custom-configurations)

- [Updating](#updating)

- [Uninstallation](#uninstallation)

- [Contributing](#contributing)

  - [Prereqs](#Prereqs)

- [License](#license)

## Overview

[(Back to top)](#table-of-contents)

`TODO: Blather on about your application here.`

## Usage

[(Back to top)](#table-of-contents)

## Installation

[(Back to top)](#table-of-contents)

As of right now there is no official installation method. It is highly discouraged to compile the binary and name it `ls` (or `ls.exe`). If there is anything wrong with the build you have potential to break your system (oops). The recommended installation method, *FOR NOW*, is to clone the repository

```bash
git clone https://github.com/mark-gutenberger/betterls.git
```

build it

```bash
cd betterls
mkdir build -p
cmake ..
cmake --build .
```

```bash
TODO
```

## Recommended configurations

[(Back to top)](#table-of-contents)

## Custom configurations

[(Back to top)](#table-of-contents)

## Updating

[(Back to top)](#table-of-contents)

## Uninstallation

[(Back to top)](#table-of-contents)

## Contributing

[(Back to top)](#table-of-contents)

### Prereqs

To get started with development, here are some basic requirements for a suitable development environment

| Requirement:                                                               | *nix                                         | OSX                                          | Windows                                                                                                                                                 |
|:--------------------------------------------------------------------------:|:--------------------------------------------:|:--------------------------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------:|
| CMake                                                                      | version 3.15 or later                        | version 3.15 or later                        | version 3.15 or later                                                                                                                                   |
| >=c++17 compatible compiler (hopefully you have this if you have CMake...) | clang++ v4 or later ***or*** g++ v8 or later | clang++ v4 or later ***or*** g++ v8 or later | MSYS2/MinGW with g++ >v8 or clang++ >v4 toolchain ***or*** MSVC 19.15 or later (in practice you can use WSL, but this is a native driven tool... so...) |
| [trunk.io](https://trunk.io) linter/formatter                              | (installed in repo)                          | (installed in repo)                          | You will need WSL2 for this (yay)                                                                                                                       |

Aside from you favorite code editor, that's all you should need.

## License

[(Back to top)](#table-of-contents)

Betterls is fully licensed under the [GNU GPLv3.0](http://www.gnu.org/licenses/gpl-3.0.html) license (2022). Please refer to [LICENSE.md](https://github.com/mark-gutenberger/betterls/blob/main/LICENSE.md) for more information about licensing.
