# Independent Review Report, Reviewer 1

The article proposes a design pattern, Clinical Deployment Environments (CDE) with 05 principles (pillars). A design pattern is a general repeatable and implementable solution which is well demonstrated through the datasheet attached. My overall impression apart from a few specific comments is, that for each of the five principles (pillars), the problem description that they address may be clearly stated in the introduction section. The implementation example in the datasheet describes the first 02 pillars very clearly, however, an implementation example for the rest of the 03 pillars is missing. They should be included to prove the implementation. I would think that the Implementation science is a result of the first two pillars (i.e. RW-Dev and ML-Ops) and not essentially one of the pillars here. The explanation of 'Implementation Science' in the article also does not provide clear requirements for this pillar.
  
Other specific comments -
- The language style preferred for Frontiers in Digital Health Articles is US English while the article uses the GB English style. A revision is needed to match the editorial requirements

Thank you. We have converted converted the article to Word, and applies the US American spell check and grammar, and then converted back to Latex.

- A review of the state-of-the-art in the area may be included to highlight the gaps

Thank you. We have added several new references. 

General 

1. Feng J, Phillips RV, Malenica I, Bishara A, Hubbard AE, Celi LA, et al. Clinical artificial intelligence quality improvement: towards continual monitoring and updating of AI algorithms in healthcare. npj Digit Med. 2022 Dec;5(1):66. 
2. Eaneff S, Obermeyer Z, Butte AJ. The Case for Algorithmic Stewardship for Artificial Intelligence and Machine Learning Technologies. JAMA. 2020 Oct 13;324(14):1397–8. 
3. Lee CS, Lee AY. Clinical applications of continual learning machine learning. The Lancet Digital Health. 2020 Jun 1;2(6):e279–81. 


Specific
<!-- TODO -->





- A thorough check for sentences, the flow of the information, and grammar will help increase the readability of the article. A few of the comments and errors are highlighted in the attached file.

Thank you. We have corrected as follows
1. Highlight [page 3]:* and aims to answer for ML4H the same challenge that translational medicine brought to bear for drug discovery *and Note [page 3]:* The sentence looks grammatically incomplete

**Re-written**:

> Just as bio-medicine identified translational roadblocks in the bench-to-bedside journey, ML4H also requires a translational infrastructure supporting real-world development not just real-world data.

2. *Highlight [page 7]:* (T2)*and Note [page 7]:* There is no mention or explanation of T2/T1 in the whole article

**Note**

This was defined in paragraph 1 of Section 4.

> This corresponds to the second (T2) arm of translational medicine: implementation science.[@woolf2008b] 

3. *Highlight [page 8]:* does not have to relevant in the next *and Note [page 8]:* does not have to be relevant in the next

 **Thank you. Amended.**

 4.  *Highlight [page 8]:* Excellent and senior patient*and Note [page 8]:* Do you mean excellent patient and public involvement? 

 **Yes. Thank you. Amended.**

 5. *Highlight [page 8]:* At our own institution, *and Note [page 8]:* Would you like to move this part as part of Data Sheet (as implementation example)? 

 We would be keen to keep this brief paragraph in the body of the main text. Our original draft had the full explanation. This short note was meant to provide enough detail to trigger a reader's interest without distracting from the broader emphasis of the article.

 6.  *Highlight [page 9]:* such binding*and Note [page 9]:* such as binding...

 **Thank you. Amended.**


7. Highlight [page 10]:* where software is (not as) a medical device *and Note [page 10]:* Do you mean Software as Medical Device?

No. We were attempting to point out that where software is within a medical device (e.g. a cardiac pacemaker) then we already have a good regulatory framework. But because ML4H will be deployed in less controlled and varying environment (the EHR) then we need a new approach.

8. *Strikeout [page 10]:* create

 **Thank you. Amended.**

- The diagram in Figure 1. does not match with the attached Image 1

I'm not sure if I understand. We have uploaded 2 copies of each diagram, and in our version I think they are numbered correctly (I have double checked). Could you please have another look. Thanks.

- Suggest moving the figures as part of the datasheet where EMAP and FlowEHR are explained instead of keeping them in the main article
- An overall depiction of CDE and its pillars may be useful

We're happy to take editorial guidance on this. Our inclination is to include the detailed diagrams in the main text and to leave the textual and more technical descriptions of Pillars 1 and 2 in the ESM. We think this keeps the main article readable as an overall 'sketch' but allows the interested reader to obtain further detail. To this end (as per Reviewer 3), we have added extended captions rather than extend the body text.

- Datasheet, Page 2, Section 1.4.2, "... aggregation. (201, 2018) Flat (bulk) FHIR is not mature, nor designed for live interactions.(202, 2021)..." : Please update the references. They are not numbered in the bibliography and full information is missing.

Thank you. These were internet (web) references, and we have corrected the missing details.

