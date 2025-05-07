# Installing MRtrix3 via Anaconda or Miniconda

A pre-compiled package generated using this recipe is already available
directly, using this command:
```
$ conda install -c MRtrix3 -c conda-forge mrtrix3 libstdcxx-ng
```

Note: it seems an up to date version of `libstdcxx-ng` is required to run on modern
systems. The version provided by `conda-forge` seems to work correctly for this
purpose, which is why it's included in the above.

This repo holds the recipe to generate this package, most users should't need
to interact with this repo. 

# How to use

```
git clone https://github.com/MRtrix3/conda-build.git
cd conda-build
./run.sh 3.0.4 mrtrix3 linux

anaconda upload <path_to_package>
```


