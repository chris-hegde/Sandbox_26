# Set up - Link VS code to R

## Find R path
```bash
which R #get R install path
```

## Configure VS codeto use R
- Cmd+shift+P --> type preferences:open user settings
- search r.rterm.mac
- set to /usr/local/bin/R (found in which R above)
- close tab

## Test R in a new file test.R (colour change indicates syntax highlighting for R)

```r

x <- 1:10
mean(x)

```
