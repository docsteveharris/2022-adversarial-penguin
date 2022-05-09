
# Continuous clinical evaluation
Our analogy with translational medicine breaks down at the evaluation stage. For drug discovery, evaluation is via a randomised controlled trial (RCT). Randomisation handles unanticipated bias and ML4H should hold itself to the same standard but of 350,000 studies registered on [ClinicalTrials.gov](ClinicalTrials.gov) in 2020, just 358 evaluated ML4H, and only 66 were randomised.[@zippel2021] As usual for ML4H, those RCTs were not interacting with EHR data. They were evaluations of algorithms supporting imaging, cataract screening, colonoscopy, cardiotocographs and more.[@infant2017; @titano2018; @wang2019; @wu2019; @lin2019a; @turakhia2019a; @long2017]

Where the ML4H intervention delivers a novel biological treatment strategy, then it is appropriate to reach for the full paraphenalia used in Clinical Trials of Investigational Medicinal Products (CTIMPs).[@komorowski2018] But in many cases, algorithms will be used to optimise operational workflows and clinical pathways. These pathways may be specific and contextual rather than generalisable. Poor external validity is not a critique: the algorithm that is useful or important in one institution does not have to relevant in the next (the 'myth of generalisability').[@futoma2020] Moreover, the algorithm is not the same as the patented and fixed active ingredient in a medicinal product. This is no single point in time nor single host environment at which it can be declared enduringly effective. This means that institutions deploying and relying on these tools need a strategy for rapid continuous clinical and operational evaluation.

This time the EHR may provide an advantage instead of just additional complexity. Since ML4H algorithms must be implemented through some form of direct or indirect CDSS, then the next logical step is to randomise the deployment of those alerts. This in itself is not novel. Randomised deterministic alerts from CDSS are part of the standard evaluation toolkit for quality improvement initiatives in at NYU Langone[@Horwitz2019], and for research elsewhere.[@Wilson2021] At NYU Langone, such tooling permitted a small team to deliver 10 randomised trials within a single year.[@Horwitz2019]

The final pillar in our CDE uses the same approach for the probabilistic insights derived from ML4H. Excellent and senior patient and public involvement, and ethical guidance, will be required to distinguish those algorithms that require per patient point-of-care consent from those that can use opt-out or cluster methods. But we think that latter group is large for two reasons. Firstly, patients are exposed to varying treatment regimes by dint of their random interaction with different clinicians based on geography (the healthcare provider they access) and time (staff holidays and shift patterns etc.). This routine variation in practice is summarised as the 60-30-10 problem: 60\% of care follows best practice; 30\% is wasteful or ineffective and 10\% is harmful.[@braithwaite2020] Secondly, because the intervention is informational, there is ethical precedent for patient level randomisation without consent (e.g. Acute Kidney Injury alerts).[@Wilson2021] 

At our own institution, we have extended this ethical and safety case one step further, and we are piloting a study design where the randomisation is non-mandatory: a nudge not an order.[@wilson2022] The clinician is explicitly invited to only comply with the randomisation where they have equipoise themselves. Where they have a preference, they overrule the alert (see Vignette 1 in the Electronic Supplemental Material).

Embedded randomised digital evaluation should permit rapid evidence generation, and build the trust needed to support the implementation described under Pillar 4.






