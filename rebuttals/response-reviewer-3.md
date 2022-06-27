*************************  
Independent Review Report, Reviewer 3  
EVALUATION  
Please list your revision requests for the authors and provide your detailed comments, including highlighting limitations and strengths of the review. If you have additional comments based on Q2 and Q3 you can add them as well.  
Summary: I congratulate the authors on writing a wonderful overview on how hospitals can reach the digital maturity to deploy machine learning algorithms to support clinical decision making. The authors describe 5 major pillars that form a Clinical Deployment Environment. The figures also provide readers an idea of the major (and many) components that are necessary to erect a real-world CDEs. Finally, the paper discusses phased trials for testing ML algorithms.  
  
Major:  
  
1. I am confused what the terminology “code-to-data” means exactly. The authors never really provide a definition of what it means to reverse the typical setup of “data-to-code”. My first impression was that it meant the ML team would write code that would generate data. However, this does not seem to be the message of the first pillar. Instead, the message seems to be that there should be infrastructure for accessing live clinical data without harming the live clinical system. Please remove/replace this terminology to avoid reader confusion.  
  
2. The second pillar describes a team in the hospital for ML-Ops. This idea has been described in a number of papers, including Cosgrif 2020, Eaneff 2020, and Feng 2022. These papers have drawn parallels to existing infrastructure in the hospital to show that the idea of MLOps is not foreign and to bring urgency and relevance. For instance, Feng 2022 describes interesting parallels between hospital Quality Improvement units and ML-Ops team (they called this an AI-QI team). Eaneff 2020 refers to such teams as “algorithm stewards” to draw links to the concept of “hospital stewards” that is well-understood in the clinical space. I think the case for Pillar 2 would be stronger if the authors mention these connections.  
  
3. Recent work have questioned the value of model explainability, particularly because many explainability methods exhibit flaws. See Ghassemi, Oakden-Rayner, and Beam 2021 and [https://arxiv.org/abs/2202.01602](https://arxiv.org/abs/2202.01602), as well as references within. I think the recommendation for model explainability should be qualified with this fact that the current explainability methods leave much to be desired.  
  
4. There is a quickly growing literature on fail-safes in clinical ML and the authors should point readers to it. This idea has been referred to as selective prediction (Chow, 1970; Tortorella,2000; Bartlett and Wegkamp, 2008; El-Yaniv and Wiener, 2010; Feng, Sondhi, Perry, and Simon 2021). The idea of deploying ensembles with fail-safes is promising as well, and has also been previously described in Feng 2021.  
  
5. While I agree that dynamic model calibration is an important tool to maintain the reliability of ML systems, the first motivating example provided in Section 3.3 seem appropriate. The example states that an ML model can influence shifts in its input data, which can lead to performance deterioration. However, the authors also cite Liley, which shows an example where there are shifts induced by the model but the model itself should not be updated. The second motivating example (models trained on a bad dataset and therefore should be updated) is a good reason for model updating, though dynamic model calibration may not be sufficient in this case; instead larger model revisions may be required. Perhaps a better motivating example for dynamic model calibration is provided in Davis, Lasko, Chen, Siew, and Matheny 2017: They show how a ML model for acute kidney injury decays in model calibration.  
  
6. The authors do not provide references for how to perform dynamic model calibration. The following papers have proposed methods for doing so, and should be included in the manuscript: Davis, Greevy, Lasko, Walsh, Matheny 2020 and Feng, Gossmann, Sahiner, and Pirracchio 2022.  
  
7. It is very interesting that the authors were able to implement continuous model evaluation using encouragement-based randomization within their hospital infrastructure. It would be useful for the authors to provide additional explanations on the ethical considerations and why randomization without consent is justified. The authors should also highlight the complexity of estimating the ML model’s impact in encouragement designs due to selection bias and noncompliance: see e.g. Barnard 2011 and Frangakis et al 2002.  
  
8. The idea of phased trials to test prediction models in medicine is not new. Similar ideas have been previously described in Pepe et.al. 2001 and Pepe 2005. That said, there are still some differences in the definition of the phases described in the Pepe papers versus those described in the paper, because the former was focused on models that did not rely on EHR data. The authors should provide additional context by comparing their ideas to those previously described in these papers.  
  
9. It is not clear to me how the phased trials for testing algorithms relate to the Clinical Deployment Environment. How is the CDE used in each of the phases (if at all)? Which of the pillars are relevant in each of the phases? For instance, there is debate on which phase of model development we should investigate issues of AI safety and fairness (Wawira et al 2021). Please connect this section with the rest of the manuscript. Finally, continuous model evaluation (Pillar 5) could also be viewed as a Phase IV trial, which is common in drug regulation for monitoring adverse events after drug approval is granted.  
  
10. Figure 1 has a lot of components, and it is not clear what all of the components do. Please expand the caption to explain the major components in the figure. For instance, what is the “immutable data store” versus the “user data store”? What is the “message queue” vs the “message reader”? Also, what value add does the reporting DB offer over the live EHR?  
  
Minor:  
1. Please remove the use of undefined acronyms in the figures (e.g. HL7 and HDR-UK) or provide definitions/citations.  
Check List  
a. Is the quality of the figures and tables satisfactory?  
Yes  
b. Does the reference list cover the relevant literature adequately and in an unbiased manner?  
Yes  
c. Does this manuscript refer only to published data? (unpublished or original data is not allowed for this article type)  
No  
d. Does the review include a balanced, comprehensive, and critical view of the research area?  
Yes  
QUALITY ASSESSMENT:  
Rigor  
3  
Quality of the writing  
5  
Overall quality of the content  
5  
Interest to a general audience  
5