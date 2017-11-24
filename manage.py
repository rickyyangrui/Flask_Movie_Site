#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Version  : 1.0
# @Author   : Ricky.YangRui

from app import app
from flask_script import Manager

manage = Manager(app)

if __name__ == "__main__":
    manage.run()
