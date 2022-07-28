## Adversarial Penguin

Adversarial penguin review/article

Do use ....

- https://github.com/docsteveharris/2022-adversarial-penguin
- https://www.overleaf.com/read/hympzkpnhnst

I'll send links via Overleaf so you can all edit.

Don't use ...

- Original google doc is [here](https://docs.google.com/document/d/1eBoYbHN3HjaLgSEu4k8mvxBlPDS6yiMLN_gwvbNWWY4/edit?usp=sharing) but please don't use.
- Original dropbox word doc is [here](https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.dropbox.com%2Fscl%2Ffi%2Fxqlqs56vhhsjyulrdmkvy%2F2022-01-31-five-pillars-of-translational-digital-medicine.docx%3Fdl%3D0%26rlkey%3Drg8kyrn6jdishuvr2ihl6x78t&data=04%7C01%7Cwatjana.lilaonitkul.16%40ucl.ac.uk%7Caac2f1c7e34042fbee1f08d9e4eda22d%7C1faf88fea9984c5b93c9210a11d9a5c2%7C0%7C0%7C637792533036700213%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=rRKxy47DaUgDgwqzonzxCV93PIHLW9fG2j7tSKah3E8%3D&reserved=0)

## Useful links

- [Submission](https://www.frontiersin.org/submission/submit?st=1&tid=28021&domainid=2&fieldid=129&specialtyid=1380&entitytype=2&entityid=1637)    
- [Acceptance notes](https://www.frontiersin.org/my-frontiers/inbox)
- [Frontiers Article Types](https://www.frontiersin.org/journals/digital-health/sections/health-informatics#article-types) 
- [Author instructions](https://www.frontiersin.org/about/author-guidelines)

## Log

### 2022-07-28
compiling to word for manuscript submission

1. copy paste all markdown files into single body.md
2. then `pandoc body.md -o body.tex -C --bibliography refs.bib --natbib` to convert to .tex
3. then with new `main-allin1.tex` that uses `\include{body.tex` use pandoc one more time ` pandoc main-allin1.tex -C --bibliography refs.bib -o main-allin1-refs.docx --csl frontiers-medical-journals.csl`

then hand edit because the shared first authorship and corresponding author details don't work
so the final file becomes `main-allin1+refs+authors.docx`