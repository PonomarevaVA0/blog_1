#!/bin/bash
find public -name "*.html" -exec sed -i '/_entry\.css/d' {} \;
