### A Pluto.jl notebook ###
# v0.14.2

using Markdown
using InteractiveUtils

# ╔═╡ f85c6a11-3c29-431b-9016-7c02c8bc533a
# We first load libraries necessary for this excercise
begin
	using DifferentialEquations
	using Plots
end

# ╔═╡ 2e8ba40e-a759-11eb-10c8-eb85ce6d59a4
md"# Reproducing the vesicle recycling model from  [Sara et al 2005](https://doi.org/10.1016/j.neuron.2004.12.056)"

# ╔═╡ be5a053c-a2fb-456e-ba4c-830996bdb9a8
md"This notebook implements the differential equations for the model of spontaneous synaptic vesicle recycling. The model is based on single pool with four states and in the article fitted against experimental observation with tagged/dyed vesicles.
"


# ╔═╡ a58c1ee9-8274-4030-b2e2-247592f5d862
md"The original description can be found at [Sara et al 2005. An Isolated Pool of Vesicles Recycles at Rest and Drives Spontaneous Neurotransmission. Neuron 45/4](https://doi.org/10.1016/j.neuron.2004.12.056): Figure 5 and Experimental Procedures (\"Modeling Spontaneous Synaptic Vesicle Recycling\")."

# ╔═╡ 491066b3-600f-4a79-87d0-3e49ff648e41
md"
The model as in the article describes a single pool with four states:

- s0, dye-loaded vesicles
- s1, mobilized vesicles
- s2, empty vesicles
- s3, recycled and mixed empty vesicles

with parameters

- α rate of mobilization 
- β rate of recycling
- δ rate of dye loss; 

Note, that Julia is one (1) indexed, the equations in the article are 0 (zero) indexed:"

# ╔═╡ d129cc09-c4cd-471a-8a8c-0d092b105de3

function sara_spon_recycle!(ds, s, p, tspan)
# Note: Julia is 1 indexed, the formulas in the original publication are 0 indexed
    α, β, δ = p.α, p.β, p.δ 
    ds[1] = -α * s[1] * (s[1] / (s[1] + s[4]))
    ds[2] = -δ * s[2] + α * (s[1] / (s[1] + s[4])) * s[1]
    ds[3] = -β * s[3] + δ*s[2]
    ds[4] = β * s[3]
end


# ╔═╡ 6b242b10-bdec-4bb0-b681-6fd4ea9c62e7
md"Next we define the parameters and inital values for the model. Here we use given values in the model description at the Experimental procedures and Fig 5. 

**Note** that these values are in contradiction to the text:

α (rate of mobilization) is set to 0.0008 $s^{-1}$. The motivation given is that this is 1 vesicle release per 120 sec. This, however, would lead to an α of 1/120 = 0.0083 (Caption text of Figure 5 in the article). Also the updated release rate (for 8mM of extracellular Ca) - 1 vesicle every 60 sec (0.0166) - does not correspond to the given value of 0.0016


"

# ╔═╡ Cell order:
# ╟─2e8ba40e-a759-11eb-10c8-eb85ce6d59a4
# ╠═be5a053c-a2fb-456e-ba4c-830996bdb9a8
# ╠═a58c1ee9-8274-4030-b2e2-247592f5d862
# ╠═f85c6a11-3c29-431b-9016-7c02c8bc533a
# ╠═491066b3-600f-4a79-87d0-3e49ff648e41
# ╠═d129cc09-c4cd-471a-8a8c-0d092b105de3
# ╠═6b242b10-bdec-4bb0-b681-6fd4ea9c62e7
