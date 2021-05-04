# Neuronal vesicle release model during LPA application

Differential Equation Models for pre-synaptic vesicle release during LPA application.

The models are developed in [Julia](https://julialang.org/) using the [DifferentialEquations](https://juliapackages.com/p/differentialequations) packages. Results are presented with [Pluto](https://github.com/fonsp/Pluto.jl) notebooks.

## Structure

In ./static_runs you find some precompiled runs of these notebooks

- ./notebook_sara2005_reproduce.jl

    Reproducing figure 5D from the [Sara 2005](https://www.sciencedirect.com/science/article/pii/S0896627305000693?via%3Dihub) publication.
    This is a differential equations based model of spontaneous synaptic vesicle recycling. 
    The model is based on single pool with four states and in the article fitted against experimental observation with tagged/dyed vesicles.

- **./notebook_three_states_model.jl**

    This is simplified version of the Sara 2005 model with three states, omitting the recycled but no longer dyed state. This should most closely match the observations in our paper.

- ./notebook_two_states_model.jl

    A even more simple model with a resting pool and a recycling rate. Seems too simple for our application.

- ./src/lpa_vesicle_model.jl - Scratchpad for code development and testing. Only coders go there.



## Installation

- [Download and install Julia](https://julialang.org/downloads/)
- download this repository (pressing the button 'Code' - either to git or just the Zip file - or [follow this link.](https://github.com/konstantinstadler/lpa-vesicle-model/archive/refs/heads/master.zip)) 
- go to the downloaded and extracted directory and start Julia (command line)
- activate the environment with 
    - press `]` (to get into the Julia package manager)
    - `activate lpa_vesicle_model`
    - press backspace to go back to the standard Julia prompt
    - enter `using Pluto; Pluto.run()`
    - in Pluto copy the file name (starting with notebook...) in the 'open from file' dialog
    - the first time it might take some minutes for installing/pre-compiling all packages, it is faster the second time


## Citations

- Christopher Rackauckas, Anshul Singhvi, Chris de Graaf, Yingbo Ma, Michael Hatherly, Scott P. Jones, … Maja Gwóźdź. (2020, December 26). SciML/DifferentialEquations.jl: v6.16.0 (Version v6.16.0). Zenodo. http://doi.org/10.5281/zenodo.4393746
- Julia Language: https://doi.org/10.1137/141000671


## Background Papers

- [Sara 2005](https://www.sciencedirect.com/science/article/pii/S0896627305000693?via%3Dihub) have a differential equation based model

- [Truckenbrodt and Rizzolo 2014](https://www.frontiersin.org/articles/10.3389/fncel.2014.00409/full) on the different observations from Sara 2005 and others

- around 200 vesicle in one hippocampal synapse [Fowler 2015](https://www.sciencedirect.com/science/article/pii/S0014482715000920?via%3Dihub) - in this paper also a good explanation of the sizes of the different pools. Also points again to different pools for spontaneous release  ... but the same vesicles are in both pools [Wilhelm et al 2010](https://www.nature.com/articles/nn.2690)

- [Kvalali 2015](https://www.nature.com/articles/nrn3875) - different pools based on their reliance on dynamin function. In their are also comprehensive schemata of synapses
