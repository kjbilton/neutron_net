## env		: Create a conda environment required for the analysis
CONDA_REQUIREMENTS=environment.yml
CONDA_ROOT=$(shell conda info -s | grep CONDA_ROOT | cut -f2 -d ' ')
ENV=$(shell head -n 1 $(CONDA_REQUIREMENTS) | cut -f2 -d ' ')
env : $(CONDA_REQUIREMENTS)
	@echo "Installing conda environment '$(ENV)'."
	@if [ -d "$(CONDA_ROOT)/envs/$(ENV)" ]; then \
		echo "\nConda environment '$(ENV)' exists. Reinstalling now."; \
		conda env remove -n $(ENV); \
	fi
	conda env create -f $(CONDA_REQUIREMENTS)

## analysis	: Automate running the analysis code
NOTEBOOKDIR=notebooks/
NOTEBOOKS=$(wildcard $(NOTEBOOKDIR)*.ipynb)
NBS=$(patsubst $(NOTEBOOKDIR)%.ipynb, %nb, $(NOTEBOOKS))
analysis : $(NBS)

# Run a notebook
TIMEOUT=600
.PHONY : %nb
%nb: $(NOTEBOOKDIR)%.ipynb
	jupyter nbconvert \
		--ExecutePreprocessor.timeout=$(TIMEOUT) \
		--ExecutePreprocessor.kernel_name=python3 \
		--to notebook \
		--execute $< \
		--output $(patsubst $(NOTEBOOKDIR)%.ipynb, %.ipynb, $<)

## uninstall	: Uninstall the conda environment
uninstall :
	conda env remove -n $(ENV) -y

clean :
	rm -f src/*.pyc

help : Makefile
	@sed -n 's/^##//p' $<

# Make keyword for commands that don't have dependencies
.PHONY : env test analysis uninstall clean help
