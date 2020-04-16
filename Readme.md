Jarmalavicius.lt static LT blog
===============================

![Production Deployment](https://github.com/ReekenX/www.jarmalavicius.lt/workflows/Production%20Deployment/badge.svg)

Static website www.jarmalavicius.lt source code. Along with articles, media files, source code examples and more.

With a custom-built theme.

Tech Stack
----------

Jekyll 4 with plugins.

Docker - to launch the project locally and in production.

TailwindCSS - to have close to zero CSS code.

PostCSS - to drop unused CSS from TailwindCSS framework.

Vue - not really used, but I have implemented ability to use it later on-demand.

Installation
------------

Launch project locally:

    docker-compose up --build

And navigate to your browser, URL: http://localhost:8000

Configuration
-------------

No configuration is needed. With just Docker command (section above) you should
get a clear mirror of the production site.
