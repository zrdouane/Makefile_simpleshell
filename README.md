Here's a possible README.md file for the provided makefile:

# Makefile for Simple_shell project

This makefile provides rules to compile, link, and clean up the hsh project. The project is a simple shell program implemented in C language.

## Usage

To compile the project and create the `hsh` executable, run the following command:

```
make
```

To run the `betty` style checker on all C source files, run the following command:

```
make betty
```

To run the `valgrind` memory checker on the `hsh` executable, run the following command:

```
make valgrind
```

To remove all object files and the `hsh` executable, run the following command:

```
make clean
```

## Dependencies

- `gcc` compiler
- `valgrind` memory checker (optional)
- `betty` style checker (optional)

## Author

This makefile was written by zrdouane.