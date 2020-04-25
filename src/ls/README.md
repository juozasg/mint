# Language Server

This folder contains the code for the language server.

## Hover

Here are the nodes with only have type hover information:

- `Access`
- `ArrayAccess`
- `ArrayDestructuring`
- `ArrayLiteral`
- `BoolLiteral`
- `Call`
- `Case`
- `CaseBranch`

Here are the nodes which have additinonal hover information:

- `Argument`
- `Enum`
- `Function`
- `Property`
- `State`
- `Type`

Here are the nodes which reference an other hode on hover:

- `EnumId` -> `Enum`
- `ModuleAccess` -> `Function`
