# Installing MRtrix3 via Anaconda or Miniconda

A pre-compiled package generated using this recipe is already available
directly, using this command:
```
$ conda install -c jdtournier mrtrix3
```

This repo holds the recipe to generate this package, most users should't need
to interact with this repo. 

# How to use

```
git clone https://github.com/MRtrix3/conda-build.git mrtrix3
conda-build mrtrix3

anaconda upload <path_to_package>
```


