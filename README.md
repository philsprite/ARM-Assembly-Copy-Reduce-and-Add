# ARM Assembly String Manipulation Program

## Overview

This repository contains an ARM Assembly program designed for string manipulation tasks. The program performs the following operations:
- Copies a string from one memory location to another.
- Extracts numeric characters from the copied string and separates them with semicolons.
- Adds the numeric values extracted from the string.

## File Structure

- `aufgabe3.S`: The main source file containing the ARM Assembly code.
- `README.md`: This file, providing an overview and instructions for the program.

## Program Description

The program is divided into several functions:

- `main`: The entry point of the program. It calls the `kopieren`, `reduzieren`, and `addieren` functions in sequence and handles register management.
- `kopieren`: Copies a string from `StringA` to `StringB`.
- `reduzieren`: Extracts numbers from `StringB` and stores them in `StringC`, separated by semicolons.
- `addieren`: Adds up the numbers stored in `StringC`.

## Usage

To use this program, you need to have an ARM Assembly environment or simulator where you can compile and run ARM Assembly code.

1. Clone this repository or download the `aufgabe3.S` file.
2. Open the file in an ARM Assembly compatible editor or IDE.
3. Modify the `StringA` data in the `.data` section to the string you want to manipulate.
4. Compile and run the program in your ARM Assembly environment.
5. Observe the output in the registers and memory locations as specified in the program comments.

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check [issues page](https://github.com/your-github-username/your-repo-name/issues) if you want to contribute.

## License

This project is [MIT](https://opensource.org/licenses/MIT) licensed
