# PDF Utils

## Prerequisites

Install [Brew](https://brew.sh/) package manager.

## Compression

### Installation

```shell
brew install gaarutyunov/pdfutils/pdfcompress
```

### Usage

For example, let's compress folder `docs` with resolution of `144` into folder `out`:
```shell
pdfcompress -d docs -r 144 -o out
```

For interactive mode use:
```shell
pdfcompress -i
```

For more details:
```shell
pdfcompress -h
```
