# Independent Review Report, Reviewer 3

> Summary: I congratulate the authors on writing a wonderful overview on how hospitals can reach the digital maturity to deploy machine learning algorithms to support clinical decision making. The authors describe 5 major pillars that form a Clinical Deployment Environment. The figures also provide readers an idea of the major (and many) components that are necessary to erect a real-world CDEs. Finally, the paper discusses phased trials for testing ML algorithms.  

Thank you for these comments. This was exactly our aim: to provide an schematic overview of the steps that will be required to reach digital maturity given our own experience.
  
## Major:
  
1. I am confused what the terminology "code-to-data" means exactly. The authors never really provide a definition of what it means to reverse the typical setup of "data-to-code". My first impression was that it meant the ML team would write code that would generate data. However, this does not seem to be the message of the first pillar. Instead, the message seems to be that there should be infrastructure for accessing live clinical data without harming the live clinical system. Please remove/replace this terminology to avoid reader confusion.  

*We have edited the text to make this clearer. In brief, Guinney et al coined the phrase 'model to data' (ref below) to describe an inversion of the concept of data sharing to improve confidentiality. Here the model (code) is imported to the source data environment rather than source data being shared with external teams. Confidentialty and privacy improves because data is not copied and shared. We take this further and argue that 'data-to-code' ('data to modeler' in their parlance) is flawed because of the separation it imposes between the modellers and the end users.*

*Concretely under Section 1 (Real World Development) we have replaced paragaphs 2-4 with*

> Given the sensitive nature of health data, these initiatives depend on expanding investment into Trusted Research Environments (TRE). [@2021c] These are 'data-to-modeler' (DTM) designs where data flows from source (primary, secondary, social care and elsewhere) to a single secure landing zone where research teams write the code to link, clean and analyse the data. The insights return to the bedside through clinical guidelines and policy. The DTM is also the dominant design pattern in ML4H projects but is fundamentally flawed.

> It is flawed because it imposes a separation between the modeller and the end-user. ML4H is not concerned with better guidelines or policy but with better operational and clinical decision making. This requires the practitioner to work alongside the end-user because excellent offline model performance provides no guarantee of bedside efficacy. Algorithms with inferior technical performance may even provide greater bedside utility.[@the2021; @shah2019] An inverted 'modeler-to-data' (MTD) paradigm was initially proposed to reduce privacy concerns (data are no longer copied and shared[@guinney2018]), but we see important additional value in that it forces 'real-world development' (RW-Dev) and enables the end-user to work with the modeler in rapid-cycle build-test-learn loops.

> ML4H interventions are virtual not physical, and must act by altering the behaviour of clinicians by providing insights for better decisions. As such, perfect information provided to the wrong person, or at the wrong moment, cannot be impactful. This first pillar of the CDE is the equivalent of an *internal* TRE *within* the healthcare institution.[@guinney2018] 


Reference: Guinney J, Saez-Rodriguez J. Alternative models for sharing confidential biomedical data. Nat Biotechnol. 2018 May;36(5):391-2. 

  
2. The second pillar describes a team in the hospital for ML-Ops. This idea has been described in a number of papers, including Cosgrif 2020, Eaneff 2020, and Feng 2022. These papers have drawn parallels to existing infrastructure in the hospital to show that the idea of MLOps is not foreign and to bring urgency and relevance. For instance, Feng 2022 describes interesting parallels between hospital Quality Improvement units and ML-Ops team (they called this an AI-QI team). Eaneff 2020 refers to such teams as "algorithm stewards" to draw links to the concept of "hospital stewards" that is well-understood in the clinical space. I think the case for Pillar 2 would be stronger if the authors mention these connections.  

Thank you. These references were enormously helpful, and we have included them in the text for Section 2.

> Others have made similar proposals and labelled this as "algorithmic stewardship" or "AI-QI".[@eaneff2020;@feng2022] 

3. Recent work have questioned the value of model explainability, particularly because many explainability methods exhibit flaws. See Ghassemi, Oakden-Rayner, and Beam 2021 and [https://arxiv.org/abs/2202.01602](https://arxiv.org/abs/2202.01602), as well as references within. I think the recommendation for model explainability should be qualified with this fact that the current explainability methods leave much to be desired.  

- [ ] TODO:https://github.com/docsteveharris/2022-adversarial-penguin/issues/2
  
4. There is a quickly growing literature on fail-safes in clinical ML and the authors should point readers to it. This idea has been referred to as selective prediction (Chow, 1970; Tortorella,2000; Bartlett and Wegkamp, 2008; El-Yaniv and Wiener, 2010; Feng, Sondhi, Perry, and Simon 2021). The idea of deploying ensembles with fail-safes is promising as well, and has also been previously described in Feng 2021.  

- [ ] TODO: https://github.com/docsteveharris/2022-adversarial-penguin/issues/3
  
5. While I agree that dynamic model calibration is an important tool to maintain the reliability of ML systems, the first motivating example provided in Section 3.3 seem appropriate. The example states that an ML model can influence shifts in its input data, which can lead to performance deterioration. However, the authors also cite Liley, which shows an example where there are shifts induced by the model but the model itself should not be updated. The second motivating example (models trained on a bad dataset and therefore should be updated) is a good reason for model updating, though dynamic model calibration may not be sufficient in this case; instead larger model revisions may be required. Perhaps a better motivating example for dynamic model calibration is provided in Davis, Lasko, Chen, Siew, and Matheny 2017: They show how a ML model for acute kidney injury decays in model calibration.  

- [ ] TODO: https://github.com/docsteveharris/2022-adversarial-penguin/issues/4
  
6. The authors do not provide references for how to perform dynamic model calibration. The following papers have proposed methods for doing so, and should be included in the manuscript: Davis, Greevy, Lasko, Walsh, Matheny 2020 and Feng, Gossmann, Sahiner, and Pirracchio 2022.  

- [ ] TODO: https://github.com/docsteveharris/2022-adversarial-penguin/issues/4
<!-- same issue as above -->
  
7. It is very interesting that the authors were able to implement continuous model evaluation using encouragement-based randomization within their hospital infrastructure. It would be useful for the authors to provide additional explanations on the ethical considerations and why randomization without consent is justified. The authors should also highlight the complexity of estimating the ML model's impact in encouragement designs due to selection bias and noncompliance: see e.g. Barnard 2011 and Frangakis et al 2002.  

Thank you. We have added the following sentence that signposts some of the literature in this field. The argument is best expressed by the following quote from the Nuffield Trust Seminar (Scobie et al), but is clearly complex and not likely to always prevail (Meyer et al)

> When there is genuine equipoise between two commonly used treatments, not doing a point of care trial to find out which has a better risk/benefit profile seems unethical. Pragmatic RCTs could enable clinically important questions that can be answered fast based on studies carried out in routine care settings on a full range of participants.
- Learning Health Care Systems in the NHS. Nuffield Trust Seminar, January 2019 [10]

We have inserted the following sentence (Paragraph 4, Section 5: Continuous clinical evaluation).

> While this is supported by a growing literature on opt-out consent in Learning Healthcare Systems (LHS)[@halpern2018; @london2018a; @scobie2020], progress require careful attention to a range of concerns.[@meyer2019]

8. The idea of phased trials to test prediction models in medicine is not new. Similar ideas have been previously described in Pepe et.al. 2001 and Pepe 2005. That said, there are still some differences in the definition of the phases described in the Pepe papers versus those described in the paper, because the former was focused on models that did not rely on EHR data. The authors should provide additional context by comparing their ideas to those previously described in these papers.

Thank you. I have pointed the reader to this literature at the beginning of Section: Drug Discovery Parallels.

> We have described a template for a Clinical Deployment Environment that supports the translation of ML4H algorithms from bench to bedside. Although the requirements differ, the objective is similar to that for drug development. *A similar approach to phasing has previously been proposed for (biomarker) prediction models.*[@pepe2001]

9. It is not clear to me how the phased trials for testing algorithms relate to the Clinical Deployment Environment. How is the CDE used in each of the phases (if at all)? Which of the pillars are relevant in each of the phases? For instance, there is debate on which phase of model development we should investigate issues of AI safety and fairness (Wawira et al 2021). Please connect this section with the rest of the manuscript. Finally, continuous model evaluation (Pillar 5) could also be viewed as a Phase IV trial, which is common in drug regulation for monitoring adverse events after drug approval is granted.

This section was is not meant to be correlated in a 1:1 manner with the five pillars. We hoped to use this section to convince the reader that algorithm deployment would require the similar effort and infrastructure to that for drug discovery, and that the 'get rich quick' approach which fills the popular and even the scientific press is shortsighted[@bunz2022a], and more thoughtful and careful work is often overlooked.[@sendak2020]

We have added a final paragraph that we hope makes this clear, and similar word of caution in the conclusion.

Section: Drug Discovery Parallels

> The phases of drug development are not meant to be matched 1:1 to the pillars of the CDE described here, but the parallel is drawn to hightlight the effort necessary to see ML4H have an impact on the clinical and operatational decision making in the workplace.

Conclusion Paragraph 4

> They fundamentally are an argument for a professionalisation of ML4H, and a caution against the 'get-rich quick' headlines in the popular and scientific press.[@bunz2022a]
  
10. Figure 1 has a lot of components, and it is not clear what all of the components do. Please expand the caption to explain the major components in the figure. For instance, what is the "immutable data store" versus the "user data store"? What is the "message queue" vs the "message reader"? Also, what value add does the reporting DB offer over the live EHR?  

Thank you. We have added a substantial paragraph (below) to the caption and leverage the small numbers (1-5) to explain the process. We'd appreciate your and other reviewers advice whether this should remain in the main text or move to the ESM where we have also further expaned the description of data flows in EMAP.

Additional paragraph extending the Figure 1 caption:


> Rather than multiple pairwise connections between different hospital electronic systems, an integration engine acts as a single hub that routes HL7 messages, and where necessary translates to ensure compatibility. EMAP copies each message passing through the integration engine to a PostgreSQL database, the *Immutable Data Store (IDS)* (see Figure 1 and the \[numbers\] in the following sentences that refer to objects in the figure). A *message reader*\[2\] processes each live message to an interchange format so that downstream processing is insulated from local HL7 implementation. Separately, the *table reader*\[5\] processes historical data (e.g. from the reporting database) to the same interchange format. Live messages take priority over historical messages in a queue that feeds the *event processor*\[3\]. This links each message to a patient and a hospital visit, makes appropriate updates for out of order messages, and merges when separate identifiers are recognised to represent the same patient. A full audit trail is maintained. Each event updates a second live PostgreSQL database, the *User Data Store (UDS)*\[4\].
> The hospital hosts Jupyter and RStudio servers, and a Linux development environment is provided that allows docker deployment, installation of analysis libraries and frameworks, exposes SSH and HTTPS services, and allows user verification against the hospital active directory.\[5\]\
> A typical workflow might include investigation and experimentation in a Jupyter Notebook with data from the UDS, then using a small network of docker containers to run the development script, log outputs to a testing database, and report to users via email or a locally hosted web application or dashboard.
> A fuller explanation is available in the Electronic Supplementary Material [Section 2: EMAP data flows]().
  
## Minor:

1. Please remove the use of undefined acronyms in the figures (e.g. HL7 and HDR-UK) or provide definitions/citations.

Thanks for this careful proof read. The figures are now updated and these acronyms have been removed.