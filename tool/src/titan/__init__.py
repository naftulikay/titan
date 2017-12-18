#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function

from titan import cli

import argparse


def main():
    """Main entrypoint for the application."""
    parser = argparse.ArgumentParser(prog='titan', description="The TITAN Network Tool.")
    subparsers = parser.add_subparsers()

    # register commands
    cli.validate.register(subparsers)

    # send callback
    args = parser.parse_args()
    args.callback(**args.__dict__)


if __name__ == "__main__":
    main()
