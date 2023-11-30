## pycudwt-multitarget

`pycudwt-multitarget` is a python module for parallel Discrete Wavelet Transform. This is a fork of the wrapper of [PDWT](https://github.com/pierrepaleo/PDWT).

**Note:** this project is much the same as `pycudwt`, but it has the ability to compile for multiple different GPUs to obviate the need to have separate containers (Docker or enroot) for different instance types having different GPUs (ie: one image for both A100s and H100s).

When these changes are merged back into `pycudwt`, I will no point there and make a note in the new description.

## Installation

### Requirements

You need cython and nvcc (the Nvidia CUDA compiler, available in the [NVIDIA CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit)).

For the tests, you need pywavelets. `python-pywt` is packaged for Debian-like distributions, more recent changes are available on [the new repository](https://github.com/PyWavelets/pywt).

### Stable version (from pypi)

```bash
pip install pycudwt-multitarget
```

### From conda recipe

Conda build for a specific *cudatoolkit* version that matches one in your conda environment, e.g.:

```
export CUDA_VERSION="10.1.243"
conda build conda-recipe/
```


### Development version (from github)

```bash
git clone https://github.com/pierrepaleo/pypwt
cd pypwt
pip install .
```

You can specify the compute capability when building the library:  

```bash
PYCUDWT_CC=86 pip install .

# or to target multiple specific GPUs
PYCUDWT_CC=80,90

# or to let nvcc target your current GPU(s)
PYCUDWT_CC=all
```

Learn more [here](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#options-for-steering-gpu-code-generation).

### Testing

If `pywavelet` is available, you can check if pycudwt gives consistent results :

```bash
cd test
python test_all.py
```

the results are stored in `results.log`.


## Getting started

Computing a Wavelet Transform wity pycudwt is simple. In `ipython`:

```python
from pycudwt import Wavelets
from scipy.misc import lena
l = lena()
W = Wavelets(l, "db2", 3)
W
------------- Wavelet transform infos ------------
Wavelet name : db2
Number of levels : 3
Stationary WT : no
Cycle spinning : no
Separable transform : yes
Estimated memory footprint : 5.2 MB
Running on device : GeForce GTX TITAN X
--------------------------------------------------
W.forward()
W.soft_threshold(10)
W.inverse()
imshow(W.image)
```
