---
layout: page
location: pages/coding/infra/cloud/aws/leaf
permalink: /pages/coding/infra/cloud/aws/CloudFront
---
## Historic Notes

  - These notes were originally written 2018

## CloudFront Overview

  - Two things to consider: origin and behaviour
  - These are two tabs that you will see on each cloudfront distribution
  - Origins: these map to what you see in S3 – these are the buckets
  - Behaviours: maps urls to buckets, so for instance, if a url has
    \*.pdf on the end, it might go to a particular bucket – which you
    can see under origins
  - If some of your caches have a long life, when you do a deployment it
    might take time to refresh the caches across all regions, so you can
    force a refresh by going to CloudFront | Invalidations, then Create
    Invalidation, then just enter “/\*”
  - To find urls of actual sites:
      - In Cloudfront there is a list of all sites
      - Under the list of distributions, the domain name column contains
        what you need

## Cloudfront distributions:

  - These are CDNs, which hold content in edge locations so that it can
    minimise latency by being closest to the original request.
  - You can actually host your website in Cloudfront, with dynamic EC2
    instances proxying requests straight through to the CDN
  - Each Cloudfront distribution can have S3 buckets set up as origins:
    e.g. one for the site assets and one for static files such as pdfs.

## Finding the Right S3 bucket for CloudFront origins

  - Visit CloudFront and order by Comment column to find the environment
    you want
  - Click through to the distribution and check the Origins tab
  - Check the name of the origin, eg “my-bucket.s3.amazonaws.com”
  - This tells you the name of the S3 bucket is my-bucket

## Configure Cloudfront to go to a bucket in particular circumstances (eg for pdfs) 

  - You can configure CloudFront with a behaviour so that it will go to
    the S3 bucket when the url ends in, for instance, \*.pdf
  - Set up the Cloudfront distribution with an S3 buckets as its origin
    for static files such as pdfs.
  - The front end will not know the pdf cloudfront url – instead the
    Cloudfront behaviour is set up for all urls ending in \*.pdf, so
    that the correct origin is used in that circumstance.
  - Content creators can then upload pdfs into folders in the relevant
    S3 bucket
