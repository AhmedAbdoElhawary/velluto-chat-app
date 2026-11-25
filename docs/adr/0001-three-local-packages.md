# Three local packages, use cases only for real rules

The app is split into three local Swift packages beside the app target: VellutoDomain (entities and repository protocols, Foundation only), VellutoData (mock repositories, depends on Domain) and VellutoKit (the design system, depends on nothing of ours). A package can only import what it declares, so the compiler holds the layer rule, and setting that up costs little while the app is a few files but a lot after 45 screens. A UseCase is written only where a real rule lives (trim, validate). Everywhere else the ViewModel calls the repository protocol directly, because a use case that only forwards a call is boilerplate.

## Considered options

- The course's full version: a UseCase for every action. Rejected for the forwarding boilerplate.
- Only the app target until the backend arrives. Rejected because splitting 45 screens into packages later is the expensive move.

## Consequences

- Every package type the app uses has to be `public`.
- Only `AppContainer` imports VellutoData. That one is a review rule, not a compiler rule, because the app links all three packages.
