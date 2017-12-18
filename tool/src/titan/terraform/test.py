#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function

from titan.terraform import Output, Parser, Resource, Variable

import os
import unittest


class OutputTestCase(unittest.TestCase):
    """Test case for Terraform Output representations."""

    def test_hash(self):
        """Tests that hash representations work properly."""
        self.assertEqual(1, len(set([
            Output("name", "string"),
            Output("name", "list")
        ])))


class ParserTestcase(unittest.TestCase):
    """Test case for the Terraform parser."""

    def test_mixed(self):
        """Test parsing a mixed file."""
        r = Parser.load(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'data', 'mixed.tf'))

        self.assertEqual(3, len(r))
        self.assertIn(Resource("default", "aws_instance"), r)
        self.assertIn(Output("rear"), r)
        self.assertIn(Variable("thing"), r)


    def test_outputs(self):
        """Test parsing a file with only outputs."""
        r = Parser.load(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'data', 'output-only.tf'))

        self.assertEqual(2, len(r))
        self.assertIn(Output("dango"), r)
        self.assertIn(Output("brango"), r)

    def test_resources(self):
        """Test parsing a file with only resources."""
        r = Parser.load(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'data', 'resource-only.tf'))

        self.assertEqual(2, len(r))
        self.assertIn(Resource("default", "aws_sns_topic"), r)
        self.assertIn(Resource("default", "aws_instance"), r)

    def test_variables(self):
        """Test parsing a file with only variables."""
        r = Parser.load(os.path.join(os.path.dirname(os.path.realpath(__file__)), 'data', 'variable-only.tf'))

        self.assertEqual(2, len(r))
        self.assertIn(Variable("one"), r)
        self.assertIn(Variable("two"), r)


class ResourceTestCase(unittest.TestCase):
    """Test case for Terraform Resource representations."""

    def test_hash(self):
        """Tests that hash representations work properly."""
        self.assertEqual(1, len(set([
            Resource("aws_instance", "default"),
            Resource("aws_instance", "default")
        ])))

        self.assertEqual(2, len(set([
            Resource("aws_instance", "default"),
            Resource("aws_instance", "default"),
            Resource("aws_instance", "differ")
        ])))


class VariableTestCase(unittest.TestCase):
    """Test case for Terraform Variable representations."""

    def test_hash(self):
        """Tests that hash representations work properly."""
        self.assertEqual(1, len(set([
            Variable("name", "string"),
            Variable("name", "list"),
            Variable("name", "different", default="yass")
        ])))

        self.assertEqual(1, len(set([
            Variable("name", "string", default=None),
            Variable("name", "different", default="nuts!")
        ])))
