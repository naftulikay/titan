#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function

from titan.git import Git
from titan.terraform import Parser, Output, Variable

import os
import re
import subprocess
import sys


ALL_NEWLINES = re.compile(r'(?:\\n|\n)')


def get_module_entities(path):
    """Return all entities for a given module existing at a given path."""
    if not os.path.isdir(path):
        raise Exception("Unable to load path {}, not a directory".format(path))

    entities = set()

    for tffile in [f for f in os.listdir(path) if f.endswith('.tf')]:
        entities.update(Parser.load(os.path.join(path, tffile)))

    return entities


class BindingValidator(object):
    """Validates that all variables are exported as outputs."""

    def __init__(self):
        """Constructor."""

    @property
    def name(self):
        return "Variable/Output Binding Validator"

    def validate(self):
        """Validates that all variables are exported as outputs."""
        base = os.path.join(Git.root(), 'modules', 'aws', 'v1')
        modules = [d for d in os.listdir(base) if os.path.isdir(os.path.join(base, d))]

        success = True

        for module in sorted(modules):
            entities = get_module_entities(os.path.join(base, module))
            outputs = set(filter(lambda i: isinstance(i, Output), entities))
            variables = set(filter(lambda i: isinstance(i, Variable), entities))

            for variable in sorted(variables, key=lambda v: v.name):
                if not Output(variable.name) in outputs:
                    render_failure(module, "Variable {} not found in outputs.".format(variable.name))
                    success = False

            render_success(module, "All variables bound as outputs.")

        return success


class ExportValidator(object):
    """Validates that exports are included as template files."""

    def __init__(self):
        """Constructor."""
        pass

    @property
    def name(self):
        return "Output Export Validator"

    def validate(self):
        """Validate that modules export their outputs in a template file adjacent to the source code."""
        base = os.path.join(Git.root(), 'modules', 'aws', 'v1')
        modules = [d for d in os.listdir(base) if os.path.isdir(os.path.join(base, d))]

        success = True

        for module in sorted(modules):
            module_success = True

            if not os.path.isdir(os.path.join(base, module, 'exports')):
                render_failure(module, "Module does not provide template exports.")
                success = False
                continue

            mod_outputs = set(
                filter(
                    lambda e: isinstance(e, Output), get_module_entities(os.path.join(base, module))
                )
            )

            export_outputs = set(
                filter(
                    lambda e: isinstance(e, Output), get_module_entities(os.path.join(base, module, 'exports'))
                )
            )

            for mod_output in sorted(mod_outputs, key=lambda o: o.name):
                if not mod_output in export_outputs:
                    render_failure(module, "Exports do not include {}".format(mod_output.name))
                    success, module_success = False, False

            if module_success:
                render_success(module, "All outputs exported to the template file.")

        return success


class InheritanceValidator(object):
    """Validates that child modules inherit all variables and outputs of their parent module."""

    def __init__(self):
        """Constructor."""
        pass

    @property
    def name(self):
        return "Inheritance Validator"

    def validate(self):
        """Validate that child modules contain parent variables and outputs."""

        base = os.path.join(Git.root(), 'modules', 'aws', 'v1')

        success = True

        # entities from the parent module
        parent_entities = get_module_entities(os.path.join(base, 'titan_network'))
        parent_outputs = set(filter(lambda i: isinstance(i, Output), parent_entities))
        parent_variables = set(filter(lambda i: isinstance(i, Variable), parent_entities))

        for module in sorted(['titan_environment', 'titan_hub']):
            child_entities = get_module_entities(os.path.join(base, module))

            module_success = True

            for output in sorted(parent_outputs, key=lambda o: o.name):
                if not output in child_entities:
                    render_failure(module, "Output {} is not present in child module.".format(output.name))
                    success, module_success = False, False

            for variable in sorted(parent_variables, key=lambda v: v.name):
                if not variable in child_entities:
                    render_failure(module, "Variable {} is not present in child module.".format(variable.name))
                    success, module_success = False, False

            if module_success:
                render_success(module, "All parent variables and outputs found in child module.")

        return success


class TerraformPlanValidator(object):
    """Validator that uses the Terraform plan command on example projects."""

    def __init__(self):
        """Constructor."""
        pass

    @property
    def name(self):
        """Return the name of this validator."""
        return "Terraform Plan Validator"

    def validate(self):
        """Execute validation."""
        base = os.path.join(Git.root(), 'examples', 'aws', 'v1')

        success = True

        for example in [d for d in os.listdir(base) if os.path.isdir(os.path.join(base, d))]:
            example_path = os.path.join(base, example)
            example_success = True

            # init
            p = subprocess.Popen(['terraform', 'init', '-no-color'], cwd=example_path, stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT)
            stdout, _ = p.communicate()

            if p.returncode != 0:
                render_failure(example, "Terraform initialization failed:", stdout)
                success, example_success = False, False
                continue

            # validate
            p = subprocess.Popen(['terraform', 'plan', '-no-color', '-parallelism=300'], cwd=example_path, stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT)
            stdout, _ = p.communicate()

            if p.returncode != 0:
                render_failure(example, "Terraform validate failed:", stdout)
                success, example_success = False, False
                continue

            if example_success:
                render_success(example, "Terraform plan executed successfully.")

        return success


class TerraformValidateValidator(object):
    """Validator that uses the Terraform validate command on example projects."""

    def __init__(self):
        """Constructor."""
        pass

    @property
    def name(self):
        """Return the name of this validator."""
        return "Terraform Validate Validator"

    def validate(self):
        """Execute validation."""
        base = os.path.join(Git.root(), 'examples', 'aws', 'v1')

        success = True

        for example in [d for d in os.listdir(base) if os.path.isdir(os.path.join(base, d))]:
            example_path = os.path.join(base, example)
            example_success = True

            # init
            p = subprocess.Popen(['terraform', 'init', '-no-color'], cwd=example_path, stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT)
            stdout, _ = p.communicate()

            if p.returncode != 0:
                render_failure(example, "Terraform initialization failed:", stdout)
                success, example_success = False, False
                continue

            # validate
            p = subprocess.Popen(['terraform', 'validate', '-no-color'], cwd=example_path, stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT)
            stdout, _ = p.communicate()

            if p.returncode > 0:
                render_failure(example, "Terraform validate failed:", stdout)
                success, example_success = False, False
                continue

            if example_success:
                render_success(example, "Terraform validate executed successfully.")

        return success


def render_success(test_name, message):
    """Render the given test success to output."""
    if os.isatty(1):
        sys.stdout.write('\033[1;32m')

    print("PASS [{:<17}] {}".format(test_name, message))

    if os.isatty(1):
        sys.stdout.write('\033[0m')


def render_failure(test_name, message, output=None):
    """Render the given test failure to output."""
    if os.isatty(1):
        sys.stdout.write('\033[1;31m')

    print("FAIL [{:<17}] {}".format(test_name, message))

    if os.isatty(1):
        sys.stdout.write("\033[0m")

    if output:
        print()
        print((os.linesep + ">" + "  ").join(ALL_NEWLINES.split(output.decode('utf-8'))))
        print()



VALIDATORS = (
    BindingValidator,
    ExportValidator,
    InheritanceValidator,
    TerraformPlanValidator,
    TerraformValidateValidator,
)
