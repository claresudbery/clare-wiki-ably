---
layout: page
location: pages/coding/data/leaf
permalink: /pages/coding/data/Timeflux
---

## DevBreak '21, Timeflux workshop

### Preparation before workshop

- [Installation (had to install miniconda first)](https://doc.timeflux.io/en/stable/usage/getting_started.html)
- What I did:
    - Installed Miniconda on MacBook using pkg 8fa371ae97218c3c005cd5f04b1f40156d1506a9bd1d5c078f89d563fd416816, which was the latest on 8 Sept 2021. [Here is the link for the latest one](https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.pkg).
    - Installed Timeflux using these commands:  

```bash
conda create --name timeflux python=3.9 pytables bottleneck
conda activate timeflux
pip install timeflux
pip install timeflux_example
```

    - Downloaded and ran a sample simple app:

```bash
curl -O https://raw.githubusercontent.com/timeflux/timeflux/master/examples/test.yaml
conda activate timeflux
timeflux -d test.yaml
```

### What timeflux is

- 

### Other workshop notes

- 

## Questions

- What does `conda activate` do?
