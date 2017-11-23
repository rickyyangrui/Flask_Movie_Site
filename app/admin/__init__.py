#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
# @Version  : 1.0
# @Author   : Ricky.YangRui

from flask import Blueprint

admin = Blueprint("admin", __name__)

import app.admin.views