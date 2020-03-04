# Automation-DevOps
Automating the redundant and tedious things and building systems.

## Good to know:
- [Difference between sh and bash](https://stackoverflow.com/questions/5725296/difference-between-sh-and-bash) - Stack Overflow
- [How to grep to include an optional word?](https://stackoverflow.com/questions/10142314/how-to-grep-to-include-an-optional-word) - Stack Overflow
  - `\?`
    - looks like ALL metacharacters need to be escaped in grep
- [Pattern matching digits does not work in egrep?](https://stackoverflow.com/questions/3185457/pattern-matching-digits-does-not-work-in-egrep) - Stack Overflow
  - just use `[0-9]` instead of trying to do  `[\d]` or `[[:digits:]]` or `[[:alnum:]]`
  - [3.2 Character Classes and Bracket Expressions](https://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html) - [GNU Operating System](https://www.gnu.org/) > [grep](https://www.gnu.org/software/grep/) > [manual](https://www.gnu.org/software/grep/manual/)
- [How to concatenate string variables in Bash](https://stackoverflow.com/questions/4181703/how-to-concatenate-string-variables-in-bash) - Stack Overflow
  - `"some text ${VARIABLE_NAME} some more text`
  - `"some text $(VARIABLE_NAME) some more text` results in the shell trying to interpret `VARIABLE_NAME` as a command instead of interpolating `VARIABLE_NAME` into a string
- [How do I split a string on a delimiter in Bash?](https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash) - Stack Overflow
