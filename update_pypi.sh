# you may also need to reload CUDA or find nvcc on your path just to
# make a source distribution ("sdist"), though of course just
# uploading the source doesn't require a functioning CUDA install...

# TODO: change setup.py so that sdists don't require CUDA

# install packages
pip install Cython setuptools twine wheel

# remove any old builds
rm -rf dist

# create new build and upload
python setup.py sdist
twine check dist/*
twine upload dist/*