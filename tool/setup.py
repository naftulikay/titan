#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

setup(
    name = "titan",
    version = "1.0.0",
    packages = find_packages('src'),
    package_dir = { '': 'src'},
    author = "Naftuli Kay",
    author_email = "me@naftuli.wtf",
    url = "https://github.com/naftulikay/titan",
    install_requires = [
        'setuptools',
    ],
    dependency_links = [],
    entry_points = {
        'console_scripts': [
            'titan = titan:main'
        ]
    }
)
