#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function

import subprocess


class Git(object):
    """Wrapper for Git functions."""

    @classmethod
    def root(cls):
        p = subprocess.Popen(['git', 'rev-parse', '--show-toplevel'], stdout=subprocess.PIPE)
        stdout, stderr = p.communicate()

        if p.returncode != 0:
            raise Exception("Unable to get Git base directory, (return {})".format(p.returncode))

        return stdout.strip().decode('utf-8')
