*************************  
Independent Review Report, Reviewer 2  
EVALUATION  
Please list your revision requests for the authors and provide your detailed comments, including highlighting limitations and strengths of the review. If you have additional comments based on Q2 and Q3 you can add them as well.  
Thank you for the opportunity to review this manuscript from Harris, Bonnici, and colleagues regarding the concept of clinical deployment environments. The authors propose this concept as having potential to align development, deployment, and evaluation of electronic health record-based machine learning tools in the healthcare setting.  
  
## Major Strengths
1. The pillars proposed by the authors have face validity and lend important terminology around important considerations within a relatively underdescribed area.  
2. The figures are very nicely done and quite informative.   
  
## Major Limitations
1. The analogy to drug discovery is not a great fit, in my opinion, and its shortcomings reveal an opportunity to better-describe the relationships between ML4H tools and the problems they seek to solve.  

- [ ] decide how to play this; see for other examples of using the same analogy "algorithmic stewardship"[@eaneff2020] esp b/c also talks about the team who should advice again making the argument for pillar 1; they also use the drug parallel (trials/hospital formulary/evaluations/stewardship)
> clinicians who are familiar with the language of data, patients, bioethicists, scientists, and safety and regulatory organizations.   

2. Some areas of the prose could benefit from increased specificity and/or clarity.  

- [ ] idea was to keep the main text narrative and then allow the interested reader to hit the ESM for details with the figures providing the bridge; possible compromise is to expand the captions for each so the flow of the text remains roughly the same??

3. Much of the supplemental content would be better served in the main text.  

- [ ] ditto; decide how to play this
  
## Major Comments
1. The analogy to drug discovery is a poor fit for this essay. One key premise underlying drug discovery activities is that potentially-actionable targets have already been identified through prior research. For example, the decision to seek JAK2-interacting molecules emerged from the understanding that JAK2 regulates important cytokines in a number of disease states. The algorithmic equivalent of this kind of prior knowledge is not apparent to me. Without a clear understanding of (a) a well-articulated problem to be solved and (b) a reasonable mechanism/logic model in which an ML tool – provided it performs well – might affect stakeholder behavior, translational failure seems essentially guaranteed. Said differently, the bake-off between different ML approaches can really only be held once the model (“ligand”)’s “receptor” has been mapped/described, which I would argue happens infrequently at present. As I read the authors’ proposed pillars, I found myself reflecting on the need for this kind of formative work, informed by stakeholders, to ensure that the CDE can be used for properly-specified development, operations, and evaluation.    
  
I might suggest omitting or significantly abbreviating this section, which could open space to insert valuable information from the supplement. I also think a paragraph commenting on the relationship of the CDE to the organization’s “problem identification and specification” apparatus would be a very helpful “bookend” to the implementation and continuous evaluation portions of the essay.  

- [ ] ask Tim to think how he wants to play this?
https://github.com/docsteveharris/2022-adversarial-penguin/issues/5
  
2. Some areas of the prose could benefit from increased specificity and/or clarity. One of the challenges in the healthcare data science space is striking the right balance of technical language to meet a readership with different levels of familiarity to clinical medicine, coding/development, and operations. Some areas of the prose – e.g., lines 63-67 – skew a bit heavy into the data science jargon and might benefit from additional explanations or a bit less jargon. It may be worth the authors having a colleague with less technical familiarity provide some informal copy-editing to help with readability for an audience of varying levels of expertise.  
  
3. The supplement – especially items 1 and 2 – are very nice and highly practical. Some elements of these items could serve to address issue 2 above. Further, the ML-Ops design principles are particularly helpful explicating how code-to-data can address the limitations of data-to-code. I think it would be great if these could be a bit more prominent, ideally in the main manuscript.   
  
Minor Comments   
1. The manuscript has a number of instances with unspecified pronouns, e.g., sentences starting with “This” or “That,” which do not specify what “This” or “That” actually are.  
2. Supplement page 2, typo in the ML-0PS header (zero instead of O)  

Thanks for this careful proofread. I double checked. I think this is a quirk of the font that Overleaf is using for the online submission and I can confirm the source document uses `O` not `0`.

i.e.

```markdown
# ML-Ops (for health)
```

not
  
```markdown
# ML-0ps (for health)
```

