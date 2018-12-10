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

## ANNSlabSolver
The ANN code is implemented in a Python class called `ANNSlabSolver`, which is found in the file `ANNSlabSolver.py`.
The user defines the problem parameters when instantiating an `ANNSlabSolver` object (see the class docstrings for all arguments).

An example usage is:
```python
# Import the class
from ann.ANNSlabSolver import ANNSlabSolver

# Instantiate the class using default parameters
solver = ANNSlabSolver()

# Train the ANN
solver.train()

# Get an estimate of the scalar flux
flux = solver.predict()
```
