# Deep Learning for Neutron Transport

## Overview
This analysis looks at the use of neural networks in solving the neutron transport equation in a one-dimensional slab geometry.
The neural net solution is compared to traditional finite volume and Monte Carlo approaches.
The `PyTorch` framework is used for neural net implementation.

## Usage
### Environment
You must first have conda installed before the environment can be built. To install the environment, run

```
make env
```

This command will create a conda environment named `neutron_net` (specified in the file environment.yml) with all Python packages required to run the analyses.

### Running the analyses
All code can be ran and figures saved by running
```
make analysis
```
Alternatively, one can run all notebooks individually and explore intermediate results along the way.
