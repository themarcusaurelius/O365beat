# Welcome to O365beat 7.5.1

Shipper for Office 365 logs from Management Activities API.

## Getting Started

To get started with O365beat, you need to set up Elasticsearch on
your localhost first. After that, start O365beat with:

     ./o365beat -c o365beat.yml -e

This will start O365beat and send the data to your Elasticsearch
instance. To load the dashboards for O365beat into Kibana, run:

    ./o365beat setup -e

For further steps visit the
[Getting started](https://www.elastic.co/guide/en/beats/o365beat/7.5/o365beat-getting-started.html) guide.

## Documentation

Visit [Elastic.co Docs](https://www.elastic.co/guide/en/beats/o365beat/7.5/index.html)
for the full O365beat documentation.

## Release notes

https://www.elastic.co/guide/en/beats/libbeat/7.5/release-notes-7.5.1.html
