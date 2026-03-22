#!/usr/bin/env python3
"""Setup script for LCX DSL Compiler CLI"""

from setuptools import setup, find_packages

setup(
    name='lcx-cli',
    version='1.0.0',
    description='LCX DSL Compiler - Command Line Interface',
    author='LCX Team',
    license='MIT',
    packages=find_packages(),
    py_modules=['cli.lcx_cli'],
    entry_points={
        'console_scripts': [
            'lcx-cli=cli.lcx_cli:main',
        ],
    },
    python_requires='>=3.7',
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: 3.10',
        'Programming Language :: Python :: 3.11',
    ],
)
