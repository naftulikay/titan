#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function

from titan.validator import VALIDATORS

import sys


def register(subparsers):
    """Register this module with the argparse parser."""
    parser = subparsers.add_parser('validate', help="Run the Titan integration test suite against the project.")
    parser.set_defaults(callback=main)


def main(*args, **kwargs):
    """Entrypoint for the validate command."""
    failures = []

    for ValidatorClass in VALIDATORS:
        validator = ValidatorClass()

        if not validator.validate():
            failures.append(validator.name)

    if len(failures) > 0:
        print("Failures were encountered during run.")
        sys.exit(1)
