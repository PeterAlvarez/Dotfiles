#!/bin/sh
echo `acpi | awk '{print $4-0}'%{u-}`
