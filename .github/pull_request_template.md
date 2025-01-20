<!-- markdownlint-disable-file MD041 -->

<!--

* Thank you for creating a Pull Request, and contributing to this repository. 💖

* We use OpenProject to manage this repo, so all changes, features and bugs must be tracked by a work package. If you
* do not have access to the OpenProject and are a contributor please contact me and i will sort this out.

* Requirements for all Push Requests:
- Each PR must have an associated issue that it closes
- Each PR's associated issue must be tracked via an OpenProject work package, and have an associated Work Package ID
- A PR should be categorised by one and only one [type of change](#types-of-changes)
- Every PR should contain the mandatory items listed below, failing to include them will cause the PR to be rejected
    - A mandatory item is one that is not marked by the an 'Optional' comment next to it

* Important PR information to read before submitting:
- This repository adheres to the [Code of Conduct](https://github.com/skyebreach/BreachedSpeak/blob/HEAD/CODE_OF_CONDUCT.md)
- Make sure you read the [contributing guidelines](https://github.com/skyebreach/BreachedSpeak/blob/HEAD/CONTRIBUTING.md)

- Keep your PR as small as possible, we are volunteers and cannot be expected to read large pull requests

* Please Note:
- Items that are marked with optional may be removed or marked with N/A, but only if they are not applicable to the PR
- A PR is not a feature request 
    - If you are requesting a new feature please open a a new "Feature Request Issue"
- A PR is not a change request
    - If you are requesting a change or enhancement to the repo please open a a new "Change Request Issue"
- A PR is not a bug report
    - If you are reporting a bug please open a "Bug Report Issue" 

--->

Issue Number: #<!-- Provide the ID number to the GitHub issue associated with this PR here -->
Work Package: #<!-- Provide the ID number to the OpenProject Work Package associated with this PR here -->

## Summary
<!-- Add a brief summary for this PR here -->
<!-- This summary should only be between one and two sentences -->

## Types of changes
<!-- What types of changes does your code introduce? Put an `x` in only one box, as a PR only be one type: -->
<!-- If multiple boxes are ticked then this PR will be rejected -->
- [ ] **Feature**                   : A change which adds functionality
- [ ] **Bug/Fix**                   : A change which fixes an issue
- [ ] **Documentation**             : Changes to documentation
- [ ] **Code Style**                : Changes that do not affect the meaning of the code
- [ ] **Code Refactoring**          : A code change that neither fixes a bug nor adds a feature
- [ ] **Performance Improvements**  : A change that improves the repo's performance
- [ ] **Testing Changes**           : Adds missing tests, or corrects existing tests
- [ ] **Build System**              : Changes that effect the build system or external dependencies
- [ ] **Continuous Integration**    : Changes that effect the CI config files or scripts
- [ ] **Chore**                     : Other changes that don't modify src or test files
- [ ] **Commit Revert**             : Reverts a previous commit

## Breaking Change
<!-- If this change breaks compatibility with previous major versions then type 'Yes', if not then 'No' -->
Is this a breaking change (Yes/No):

<!-- If it is a breaking change, then both of these sub headings are required to be filled out -->
### Impact to existing applications
<!-- Describe the impact to existing applications that this breaking change causes -->

### Migration path for existing applications
<!-- Describe the migration path existing applications should take to move past this breaking change -->

## Current Behaviour
<!-- Describe the current behaviour of the systems you are modifying -->

## New Behaviour
<!-- Describe the new behaviour or the changes that this PR adds -->

## Screenshots or Videos <!-- Optional -->
<!-- Add any screenshots or videos of this PR's changes here -->

## Checklist
<!-- Go over all the following points, and put an `x` in all the boxes that apply. -->
<!-- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->

### Developer Guidelines
<!-- This sections checklists focus on the guidelines you as the developer must have read/adhered to with this PR -->
<!-- Ticking a box in this section is you as the developer agreeing to these guidelines and codes -->
- [ ] I have read and agree to the [**Code of Conduct**](https://github.com/skyebreach/BreachedSpeak/blob/HEAD/CODE_OF_CONDUCT.md)
- [ ] I have read and agree to the  [**Contributing Guidelines**](https://github.com/skyebreach/BreachedSpeak/blob/HEAD/CONTRIBUTING.md)

### Code Standards, Formatting, and Style
<!-- This section ensures that you as the developer have adhered to the correct standards for this project -->
- [ ] I have adhered to the coding standards laid out for this repository
- [ ] All functions, objects, and variables have well defined types
- [ ] All new types pass the type-check
- [ ] I have **NOT** changed the linter and formatter configuration
- [ ] Both the linter, and the formatter have passed

### Documentation
<!-- This sections checklists ensure that you have properly documented the code -->
- [ ] All newly added code is properly documented with TSDoc comments
- [ ] All newly added types are properly documented with TSDoc comments
- [ ] I have added the relevant example documentation
- [ ] I have updated the documentation accordingly

### Testing
<!-- This section ensures that you have added the necessary tests, and these tests pass with the pre-existing tests -->
- [ ] I have added tests to cover my changes
- [ ] All newly added and pre-existing tests have passed
