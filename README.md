# Perfecting Git styling

This project is going to be used to assist me in leveling up my git workflow.

## Formatting

### Type

- build    - modifies the build process or pipeline for the application
- chore    - is a catch-all for any change that doesn't fit into another category
- ci       - modifies the continuous integration pipeline
- db       - modifies the database
- docs     - adds or improves documentation
- feat     - adds new functionality
- fix      - fixes a bug
- touchup  - small improvement, too small for "feat" or "refactor"
- perf     - improves performance without functionality changes
- refactor - doesn't add functionality and doesn't fix a bug
- revert   - undoes a previous commit
- style    - does not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- test     - updates testing

### BRANCH

```text
<type>/<ticket-###>/<title>
```

### COMMIT

```text
[<ticket-###>] <type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Sources

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Magic Git Commit Message With Ticket Number for Awesome Team](https://medium.com/julotech/magic-git-commit-message-with-ticket-number-for-awesome-team-a0c602c79d1)
- [Naming conventions for Git Branches - a Cheatsheet](https://medium.com/@abhay.pixolo/naming-conventions-for-git-branches-a-cheatsheet-8549feca2534)
- [How to Naming Conventions for Git Branches](https://www.geeksforgeeks.org/how-to-naming-conventions-for-git-branches/)
- [Is there any downside to commit messages containing the ticket number](https://softwareengineering.stackexchange.com/questions/308084/is-there-any-downside-to-commit-messages-containing-the-ticket-number)
