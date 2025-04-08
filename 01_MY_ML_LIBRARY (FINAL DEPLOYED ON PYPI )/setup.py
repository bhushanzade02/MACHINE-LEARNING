from setuptools import setup, find_packages

setup(
    name='my_ml_library',
    version='0.1.1',
    packages=find_packages(),
    install_requires=[
        'numpy',
        'scipy',
    ],
    author='Bhushan Zade',
    author_email='bhushanzade02@gmail.com',
    description='A simple machine learning library with regression models and metrics.',
    url='https://github.com/bhushanzade02',
)
