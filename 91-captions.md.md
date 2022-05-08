# Figures

## Figure 1: Real-world development
![](assets/emap.png)
Our real-world development is performed on the  Experimental Medicine Application Platform (EMAP). EMAP is a clinical laboratory within which ML4H researchers can iteratively build, test and gather feedback from the bedside. It unifies the data and the tools for off-line and online development of ML4H models. In brief, EMAP builds a patient orientated SQL database from HL7 version 2 (HL7v2) messages that are being exchanged between hospital systems. HL7v2 messages are ubiquitous in health care, and the \textit{de facto} standard for internal communication.


## Figure 2: ML-Ops
![](assets/flowehr.png)

## Vignette 1: Electroyte optimisation strategy to prevent new onset atrial fibrillation

Consider the following worked example. We train an algorithm to optimise electrolyte supplementation in critically ill patients at risk of new onset atrial fibrillation (NOAF). We have already observed significant variation in the propensity of the clinical team to administer supplemental magnesium and potassium. Our algorithm evaluates the risk of NOAF in real-time based on existing electrolyte levels, medications, disease type, and the patient's co-morbidities. We have evidence that such supplementation is impactful for cardiac surgery patients[@gu2012] but no evidence that either our algorithm works nor that the existing evidence generalises to other patient populations. Our model is now used to drive a CDSS that operates in two layers. Firstly, where electrolytes are outside existing (evidence based guidelines) the CDSS makes a strong deterministic recommendation. Secondly, where electrolytes are within the window of the broader guideline but could be optimised, the CDSS makes a nudged randomised recommendation based on the model's prediction.

During the pilot phase the study might run with pre-emptive consent, but if the pilot demonstrates safety and acceptability (for the methodology rather than the intervention) then it justifiable to transition to opt-out consent. This allows the trial to scale, and treatment effects to be estimated as per any RCT with imperfect compliance.[@wilson2022]

Here the nudge is directly linked to the treatment allocation via the CDSS, but randomised indirect nudges without CDSS are also possible.[@chen2022] These might alter how information and choice is presented within the EHR by altering the ordering of investigations in a pick list. Such approaches have already demonstrated efficacy for diagnostic, screening and monitoring test orders.[@main2010; @santanna2021a]

