#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function

import os
import re

BEGIN_COMMENT = re.compile(r'^\s*\#.*$', re.I)
BEGIN_RESOURCE = re.compile(r'^resource\s+\"(?P<type>[^\"]+)\"\s+\"(?P<name>[^\"]+)\"\s+\{?.*$')
BEGIN_VARIABLE = re.compile(r'^variable\s+\"(?P<name>[^\"]+)\"\s+\{?.*$')
BEGIN_OUTPUT = re.compile(r'^output\s+\"(?P<name>[^\"]+)\"\s+\{?.*$')


class Parser(object):
    """A simplified Terraform parser."""

    @classmethod
    def load(cls, path):
        """Loads all Terraform definitions for a given file path."""
        return Parser(path).parse()

    def __init__(self, path):
        """Constructor."""
        self.path = path

    def parse(self):
        """Parse the given file and return a set of Terraform resources."""
        if not os.path.isfile(self.path):
            raise Exception("File not found: {}".format(self.path))

        entities = []

        with open(self.path, 'r') as f:
            for line in f.readlines():
                if BEGIN_COMMENT.search(line):
                    continue
                elif BEGIN_RESOURCE.search(line):
                    m = BEGIN_RESOURCE.search(line)
                    entities.append(Resource(m.group('name'), m.group('type')))
                elif BEGIN_OUTPUT.search(line):
                    m = BEGIN_OUTPUT.search(line)
                    entities.append(Output(m.group('name')))
                elif BEGIN_VARIABLE.search(line):
                    m = BEGIN_VARIABLE.search(line)
                    entities.append(Variable(m.group('name')))

        return set(entities)


class Output(object):
    """Representation of a Terraform output."""

    def __init__(self, output_name, output_type="string"):
        """Constructor."""
        self.name = output_name
        self.type = output_type

    def __eq__(self, other):
        """Compare for equality."""
        return isinstance(other, Output) and self.name == other.name

    def __hash__(self):
        """Compute a unique hash for this object."""
        return hash(self.name)

    def __repr__(self):
        return "Output<{}>".format(self.name)


class Variable(object):
    """Representation of a Terraform variable."""

    def __init__(self, variable_name, variable_type="string", default=None):
        """Constructor."""
        self.name = variable_name
        self.type = variable_type
        self.default = default

    def __eq__(self, other):
        """Compare for equality."""
        return isinstance(other, Variable) and self.name == other.name

    def __hash__(self):
        """Compute a unique hash for this object."""
        return hash(self.name)

    def __repr__(self):
        return "Variable<{}>".format(self.name)


class Resource(object):
    """Representation of a Terraform resource."""

    def __init__(self, resource_name, resource_type):
        """Constructor."""
        self.name = resource_name
        self.type = resource_type

    def __eq__(self, other):
        """Compare for equality."""
        return isinstance(other, Resource) and self.name == other.name and self.type == other.type

    def __hash__(self):
        """Compute a unique hash for this object."""
        return hash(self.name) ^ hash(self.type)

    def __repr__(self):
        return "Resource<{}.{}>".format(self.type, self.name)
