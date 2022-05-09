# Introduction

Extrapolating from the impacts on other industries such as hospitality and transportation,[@mcrae2015] many experts predict that machine learning (ML) will transform healthcare.[@bunz2021] (ref: https://qualitysafety.bmj.com/content/28/3/231) Thus far the ML models that have reached the market are embedded in medical devices or isolated digital workflows, typically involving processing of medical images.[@muehlematter2021] However, when it comes to ML models operating on data held in an electronic health record system (EHRS), few models have progressed beyond academic prototypes and none have found widespread adoption, despite significant investment from government bodies [@nhsx2022] and commercial companies [@2021f] in the field.

The fundamental problem is that learning requires experience. Previous work on barriers to progress has cited issues such as restricted access to data (ref), data quality (ref), AI ethics (ref), evaluation methodology (ref) and workforce training (ref Topol) [@ghassemi2021; @2020]. These are all important issues but in the absence of algorithms operating in the real world the impetus to solve these issues within healthcare is likely to be limited. The key first step is to build the infrastructure to make it feasible to develop and deploy ML algorithms in a healthcare setting at scale.

Some progress has been made towards developing appropriate infrastructure in the form of Trusted Research Environments (TREs). TREs comprise of a secure environment for the storage and merging of healthcare datasets in a manner that is compliant with information governance and ethical standards and an analytics environment which provides modern data science tools supported by appropriate computing resources. While there are multiple examples of where TREs have delivered useful insights to population health researchers [Sentinel programme] [OpenSafely] [@williamson2020], they do not have the full complement of features required to take a machine learning algorithm operating on EHRS data from bench to bedside.

In this paper we define five key components which need to be added to TREs to transform them into Trusted Development Environments (TDEs), infrastructure designed to support the development and deployment of ML operating on data from the EHRS. We progress to demonstrate the importance of these components by describing the development process of an ML-based Clinical Decision Support System (CDSS). Finally we report our experiences implementing an early-stage prototype TDE, the Experimental Medicine Application Platform (EMAP).

#Section 1: The Five Pillars of Machine Learning For Healthcare

We propose the five unique features which distinguish a TDE from a TRE are:

1. A live data pipeline connected to an EHRS

2. Production grade infrastructure for the deployment and execution of ML algorithms

3. AI safety monitoring systems

4. Infrastructure to support the embedding of algorithm outputs within the end-user workflow.

5. Systems to support continuous clinical evaluation

## Live Data Pipeline

In order for a decision support algorithm to be effective it must operate on data that is up to date at the time the decision is being made. Although some decisions can be made on yesterday’s data, for many applications relevant new data is generated throughout the working day. Serving these use cases necessitates a live data feed.

The difficulty of easily accessing all data within the EHRS via a live feed remains problematic. With the notable exception of the SepsisWatch application, where Sendak et al (ref Sendak), used a combination of custom-developed and vendor-provided Web APIs to create a live data feed from their Epic EHRS, most researchers implementing a live data feed have relied on parsing of HL7 v2 messages to gather data on patient Admission Discharge and Transfer (ADT) events, laboratory test results and vital signs. (ref Dahella) (ref Real-Time Risk Prediction on the Wards: A Feasibility Study) (Ref: Health care and precision medicine research: analysis of a scalable data science platform). Use of HL7 as the foundation of a live data pipeline enables a vendor neutral approach, and therefore easy deployment in multiple institutions, but comes at the expense of limiting the variety of variables that can be obtained as not all fields within an EHRS can be exposed via an HL7 v2 interface.

FHIR is gaining traction as an standard for healthcare information exchange but using FHIR to access all items in an EHRS would require an extensive and costly mapping exercise (ref: [https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2760438](https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2760438)). Furthermore  the bulk data access specification is not designed for live interactions.[@2021b]

## Deployment and Execution Infrastructure

There is increasing recognition of the value of applying modern software engineering, “DevOps” practices such as continuous integration and continuous deployment to ML pipelines to enable rapid iteration. (ref Who Needs MLOps: What Data Scientists Seek to Accomplish and How Can MLOps Help?) Best practice architectural patterns remain a subject of debate (ref: A software engineering perspective on engineering machine learning

systems: State of the art and challenges) but a typical ML-Ops system monitors raw input data, checks for distribution drift, provides a feature store to avoid train/serve skew and facilitate collaboration between teams, and maintains an auditable and monitored model repository.[@john2021]

## AI Safety

Hendricks et al (ref: https://arxiv.org/pdf/2109.13916.pdf) cite three unsolved AI safety issues.

1.     ML models need to be robust to adversarial attack, unusual data and “black swan” events (“Robustness”)

2.     ML model usage and predictions need to be monitored to identify unexpected behaviour (“Monitoring”)

3.     ML models need to be built with human ethical values in mind  (“Alignment”)

In terms of TDE design addressing these issues necessitates providing systems for monitoring both data and model behaviour. These monitoring systems should track system performance at prediction time to identify anomalies as well as changes over the long term to identify drift, either in the data or in model calibration or robustness.

In addition to tracking summary metrics of model and dataset properties, AI safety systems must also track diagnostic metrics which allow explanation of model predictions. ‘Black-box models’ are unsuitable for mission-critical domains, such as in healthcare, because they pose risk scenarios where problems that occur can remain masked and therefore undetectable and unfixable. Explainable AI research [@gunning2019],[@mueller2019],[@vilone2020],[@Linardatos2020] on methods to highlight decision-relevant parts of AI representations and for measuring and benchmarking interpretability [@Doshi-Velez2017],[@Hoffman2018] are particularly promising for risk management as they can be used to structure a systematic interrogation of the trade-off between interpretability, model accuracy and the risk of model misbehaviour.

Another important aspect to consider is the inclusion of fail-safe support systems to pre-empt and mitigate model misbehaviour. The European Commission High-Level Expert Group on AI presented the Ethics Guidelines for Trustworthy Artificial Intelligence in April 2019 with recommendations for AI-support systems that continue to maintain human-agency via a human-in-the-loop oversight. Prediction models that map patient data to medically meaningful classes are forced to predict within the predetermined set of classes without the option to flag users when the model is unsure of an answer. To address this problem, there is good evidence that methods such as Bayesian deep learning and various uncertainty estimates [@abdar2021] can provide promising ways to detect and refer data samples with high probability of misprediction for human expert review [@Leibig2017],[@Filos2019],[@Ghoshal2020]. With this , when fully interpretable models are unavailable, less interpretable models may become acceptable options when implemented in conjunction with an effective fail-safe system.

## Embedded Outputs

Multiple systematic reviews have highlighted that the key determinant of CDSS success is whether the decision support is embedded within the clinical workflow. (ref: [https://www.bmj.com/content/330/7494/765.short](https://www.bmj.com/content/330/7494/765.short) , [https://www.nature.com/articles/s41746-020-0221-y](https://www.nature.com/articles/s41746-020-0221-y)) Two principle mechanisms are commonly used to achieve this. The first is to develop an inbound interface to the EHRS to deliver model outputs and use the native alerting features of the EHRS to prompt the user. Ugwuowo et al (ref Real-Time Prediction of Acute Kidney Injury in Hospitalized Adults: Implementation and Proof of Concept) used this approach to develop a system to highlight patients at risk of developing Acute Kidney Injury.

The second approach is to develop a bespoke web-based interface or app. This can either be operated as a standalone system, such as with the HAVEN ICU admission risk prediction system (ref HAVEN) or it can be embedded within the EHRS interface. The latter approach requires the development of a wrapper application to pass user details and patient context from the EHRS to the bespoke app. Beyond simply providing EHRS integration, more advanced wrapper applications can provide features to aid user testing, such as embedded forms for end-users to report issues and user interface monitoring.  (ref: https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7779159)

## Continuous Evaluation

Models that influence the evolution of their own future input data are at risk of performance deterioration over time due to input data shifts. On the other hand, models can generate biased decisions as a result of the inherent biases found within the dataset that the model was built from. In both cases, continual learning via model recalibration is required. However, continual learning remains a challenging paradigm in AI; Recalibration with  non-stationary incremental data can lead to catastrophic forgetting when the new data negatively interferes with what the model has already learned [@Parisi2019]. A potential solution is to fully retrain the model instead of recalibrating whenever new batches of data become available. However, with information healthcare governance constantly evolving, there are serious barriers to the adoption of this approach [@Lee2020].

In addition to changing model performance over time, end user behaviour is likely to also change. Continual re-evaluation of user behaviour would be advantageous. One solution that we have piloted is a technique called nudge-randomisation. [@wilson2022a] This is specifically designed to generate learning opportunities for treatment pathways with existing variation in practice. The ethical justification is two-fold: firstly, that patients are exposed to varying treatment regimes by dint of their random interaction with different clinicians based on geography (the healthcare provider they access) and time (staff holidays and shift patterns etc.). This routine variation in practice is summarised as the 60-30-10 problem: 60% of care follows best practice; 30% is wasteful or ineffective and 10% is harmful.[@braithwaite2020] The second ethical justification is that the randomisation is non-mandatory: a nudge not an order. The clinician complies with the randomisation only where they have equipoise themselves, but overrules the randomisation where they have a preference.

During a pilot phase a nudge trial might run with pre-emptive consent, but if the pilot demonstrates safety and acceptability (for the methodology rather than the intervention) then it justifiable to transition to opt-out consent. This allows the trial to scale, and treatment effects to be estimated as per any RCT with imperfect compliance.[@wilson2022] The feasibility of conducting such trials will be greatly increased by the incorporation of tools to aid randomisation and recruitment into the system which integrates model outputs into the user workflow.

## Discussion

In this section we have described five key features that need to be provided in order to run ML algorithms in production. In the next section we describe the process of ML-based CDSS development by comparing and contrasting with the process of drug development. We use this framework to help demonstrate why a TDE is required.

# Section 2: ML-based Clinical Decision Support System (CDSS) development process

## Pre-Clinical Phase

In pre-clinical phase of drug development the objective is to identify candidate molecules which might make effective drugs. Evaluation is conducted in vitro. Metrics used to evaluate candidates, such binding affinity or other pharmacokinetic properties, describe the properties of the molecule. (ref: [https://www.sciencedirect.com/science/article/pii/S1359644617304695](https://www.sciencedirect.com/science/article/pii/S1359644617304695) ).

In the pre-clinical phase of CDSS development the objective is to identify candidate algorithms, comprising of input variables and model structures, which might make the core of an effective CDSS. Evaluation is conducted offline on de-identified datasets. Metrics used to evaluate candidates, such Area Under the Receiver Operator Curve (AUROC), the F1 score and calibration, describe the properties of the algorithm.(ref TRIPOD) Model robustness should also be tested at this time.

In addition to investigating model performance the development dataset must also be evaluated to identify biases within the dataset which may affect model output. Beyond conducting statistical analyses of the dataset, researchers need to be aware of the processes by which the data are generated. Understanding the process of data generation may lead to identification of issues that are not readily apparent from analysis of the data alone. (Ref: [https://www.nature.com/articles/s41591-019-0548-6](https://www.nature.com/articles/s41591-019-0548-6)) In our experience, this process is greatly facilitated by having the research located within the hospital, thereby lowering the barrier to visiting the wards where data are collected to observe data entry and discuss the real-world documentation practices with clinical staff.

## Phase 1 Trials

Phase 1 drug trials are the first time a drug candidate is tested in humans. They are conducted in small numbers of healthy volunteers. The aim of the trial is to determine the feasibility of progressing to trials in patients by determining drug safety and appropriate dosage. Drug formulation, the processes by which substances are combined with the active pharmaceutical ingredient to optimise the acceptability and effective delivery of the drug, is also considered at this stage.

Phase 1 CDSS trials are the first time an algorithm candidate is tested within the hospital environment. The aim of the trial is to determine the feasibility of progressing to trials in the clinical environment by ensuring the algorithm implementation is safe, reliable and able to cope with real-world data quality issues. The development of a mechanism to deliver of algorithm outputs embedded in the clinical workflow is also be considered at this stage.

In the absence of a TDE researchers must develop a live data pipeline delivering data from the hospital EHRS, de-identification of data on the fly to protect patient privacy, a user-interface for displaying algorithm outputs which can be embedded within the clinical workflow and MLOps systems to ensure the safe, consistent and reliable execution of the algorithm and monitoring of input data quality.

In addition to the technical complexity of implementation [^2], real-world implementation is commonly impeded by the need to obtain buy-in from hospital IT teams and comply with the change-control processes designing to minimise risk to the IT infrastructure. In practice these challenges mean that few research teams manage to successfully complete Phase 1 CDSS trials and those that do often have identified a use case where data are updated infrequently so use of the hospital data warehouse as the source of data is acceptable.

## Phase 2 Trials

Phase 2 drug trials involve recruitment of small numbers patients with the disease of interest, typically 50 – 200. [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6609997/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6609997/) The aim is to determine drug efficacy at treating the disease. Treating clinicians are involved in so far as they must agree to prescribe the drug for their patients. The trials are often too short to determine long term outcomes, therefore surrogate measures such biomarker status or change in tumour size are used as endpoints. (ref: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6609997/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6609997/))

Phase 2 ML4H trials involve recruitment of small numbers of clinicians making the decision of interest, typically 5 – 10. (ref usability man) The aim is to determine the efficacy of the algorithm in improving their decisions. Patients are involved in so far as they must agree to be on the receiving end of these supported decisions and identifiable data is required. Endpoints are markers of successful task completion in all cases. 50-68% of studies additionally report patient outcomes. ([https://jamanetwork.com/journals/jama/fullarticle/200503](https://jamanetwork.com/journals/jama/fullarticle/200503))

In addition to reporting user performance and patient outcomes, investigations to determine ways in which the system could be more successful in influencing user behaviour are carried out at this stage. These include usability analyses, considerations of how well the CDSS is integrated into the overall system and implementation studies to identify how best to optimise end-user adoption and engagement. (ref [https://www.nature.com/articles/s41746-020-0221-y](https://www.nature.com/articles/s41746-020-0221-y) ) The existence of a wrapper app allows embedding of the CDSS within the EHRS, thus allowing testing of the CDSS app in context.

## Phase 3 Studies

Phase 3 drug trials involve the recruitment of large numbers of patients to determine whether a drug is effective in improving patient outcomes. The gold standard of trial design is a double-blinded randomised controlled trial (RCT).

The optimal approach to generate evidence for CDSS tool is a matter of ongoing debate. Of more than 350,000 studies registered on [ClinicalTrials.gov](#) in 2020, just 358 evaluated ML4H, and only 66 were randomised.[@zippel2021] The majority of algorithms which make it to this stage are not interacting with EHR data but rather imaging or sensor data.[@infant2017; @titano2018; @wang2019; @wu2019; @lin2019a; @turakhia2019a; @long2017]

Rigorous evaluation including randomisation is essential but the RCT paradigm assumes a controlled intervention deployed in a stable, widely generalised context. This applies to ML algorithms operating on imaging, sensor or laboratory test data [@muehlematter2021] but does not apply to data generated as a by-product of operational workflows and clinical pathways, which are often institution specific. An algorithm that is useful or important in one hospital does not have to be relevant or useful in another: the 'myth of generalisability'.[@futoma2020] It does mean however that institutions deploying and relying on these tools will need to integrate an approach to evaluation of local clinical and operational endpoints into the deployment process. They will not be able to rely on external evidence, continuous evaluation will be needed.

## Discussion

As we have shown, there are considerable parallels between the intellectual complexity scientific concerns of the drug and algorithm development. However, ML-based CDSS development is further complicated by the fact that at each stage not only does the performance of the algorithm need to be monitored but also the properties of the input data.

The process of conducting drug trials is supported by a investment in infrastructure embedded within hospitals, including clinical research facilities, pharmacy services for trial drug handling, clinical trials units and well understood approvals processes. Despite this drug development takes 10-15 years (ref: [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6113160/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6113160/) ).  By contrast, even in the most advanced centres (ref Yale, Sendak)  only a fraction of the equivalent infrastructure exists to support ML4H trials.

We estimate the code for an ML model and user interface to be at most 5% of the total code required for its live deployment. In the absence of a shared development environment research groups operating independently within an academic health centre have to bear the cost of developing the other 95% of the code. Not only is this wasteful but the majority of research groups will not have the expertise to do so effectively. Until this problem is addressed the potential of ML4H is unlikely to be realised at scale.

While the similarities with drug development are useful to highlight some aspects of the development process, we do not advocate that the same method of development, whereby each phase of development must be completed before proceeding to the next one, be applied for the development of CDSSs. For software development, incremental or iterative approaches have been found to result in greater developer productivity and lower costs than a sequential “waterfall” approach (Ref: [https://www.cin.ufpe.br/~in1037/AllFinal/SE52%20Mitchell%202009.pdf](https://www.cin.ufpe.br/~in1037/AllFinal/SE52%20Mitchell%202009.pdf)) and result in lower quality software. [@2022b] Additionally, excellent offline model performance provides no guarantee of bedside efficacy. Algorithms with inferior technical performance may even provide greater bedside utility.[@the2021; @shah2019] This motivates early deployment of candidate ML algorithms to evaluate their impact of user behaviour to guide further refinements. A key enabler of rapid-cycle build-test-learn loops is the situation of the TDE _within_ the healthcare institution rather than externally in an academic facility.[@guinney2018]

# Section 3: The Experimental Medicine Application Platform (EMAP)

Having described the process of CDSS development, and the key features of a TDE, we describe the design of our local implementation, the Experimental Medicine Application Platform (EMAP). EMAP is an early stage TDE and, as such, does not currently implement all the features described above. It is hosted within the hospital and provides a live data pipeline to our hospital’s Epic EHRS, inline deidentification of patient data, an MLOps features and a both development and analytics environments. The architecture diagram is shown in (Fig 1)

## Live data pipeline

We opted to use HL7v2 as the core of our live data pipeline on the basis that HL7 messaging is implemented by all EHR vendors and this would aid the generalisation of our design to other institutions. Within our institution HL7 messages are routinely used to share patient demographics, admission, discharge and transfer events, radiology reports, laboratory test results, blood transfusion orders, and outpatient appointment scheduling. A copy of these messages is sent to an HL7 message log, the Immutable Data Store, implemented as a table in a Postgres database. The raw message text is stored alongside simple metadata to aid searching and filtering of messages. New messages in the IDS are parsed and the resulting information is stored in a second Postgres database, the User Data Store. Providing access to live data via a SQL database allows data scientists who are not software developers to rapidly develop application prototypes using tools which are familiar to them, such as Tableau, R Shiny or Plotly Dash.

The HL7 message interfaces described above are supplemented custom interface to access “flowsheet” data live. Flowsheets are used for the majority of recurrently charted data as well as some fields of structured clerking documents. The flowsheets data sent is determined by adjusting the interface configuration. Rather than attempting to transmit all flowsheet data, we have opted to incrementally add flowsheets to the interface based on end-user request.

In order to make other important data live, most notably medications, Epic’s inbuilt live reporting function, Reporting Workbench, is used to poll the live system every 15 minutes and retrieve any newly updated data. This approach has the advantage of being generalisable to any data held within Epic. The trade-off is that each query increases load on the live system and data latency is increased to 15 minutes.

In addition to the HL7 and Reporting Workbench pipelines, a ETL pipeline is used to bring in data which changes infrequently from the trust data warehouse, Caboodle, and other non-Epic systems. We plan to investigate how the Epic FHIR interface and Web APIs might be used to supplement or replace the existing pipelines in the future.

## MLOps

The ML-Ops subsystem, FlowEHR, supports the deployment and maintenance of a handful of local operational models.[@King2022.03.07.22271999] Input data from the EMAP datastore or externally loaded datasets are automatically monitored and compared against expected distributions to defend against data drift and ensure first line data quality.

FlowEHR also implements an emerging ML architectural pattern known as a _feature store_. The feature store provides three important capabilities:

1. **Feature generation**: our researchers and developers collaborate in a deliberate 'pairing' to implement code to transform data into usable features in a consistent and testable manner for both training and prediction. We argue that it is crucial for data used in training and prediction to have undergone the identical processing steps to avoid difficult to diagnose performance issues (e.g. train/serve skew).[@breck2019] Generated features are also monitored which provides a second line data quality defence.

2. **Feature storage**: the platform persists the current state of features as well as a record of historical point-in-time correct versions of all features. This is alongside an auditable repository of metadata such as feature versions, data lineage, and usage tracking. These attributes ensure reproducibility, facilitate reuse of common features between teams, and improve safety by providing a mechanism for audit.[@falco2021]

3. **Feature serving**: the platform exposes a consistent API with separate interfaces for serving large batches of historical data for offline training, and vectors of the latest feature values needed for prediction. Providing separate read pathways enables dynamic de-identification of offline training data used by our researchers while ensuring the live data (containing PII) has undergone the exact same feature transformations.

In addition to the feature store, FlowEHR provides an auditable model store for those models that graduate to production. These models are deployed in a decoupled manner using modern container technology and web APIs to allow outputs to be consumed by different services. Once again continuous monitoring guards against model drift and guides retraining decisions.[@davis2019]

## Development environment

Users can interact with data stored in the EMAP datastores using standard analytical tools provided on a virtual Windows desktop. This provides an welcoming environment for less technically able users.

In addition to the Windows desktop, users can request access to a Linux based virtual machines, configured to support the deployment of applications hosted within docker containers.  Network access, filtered by an HTTP proxy, permits the build and orchestration of docker containers. Version control is available locally through a git server, and appropriately certified users are able to use external version control tools.  Filters automatically exclude files identified as likely to contain data, and private repositories are preferred by default. Applications are able to verify user identity against the hospital's active directory so that web applications can be authenticated using existing credentials.[^1]

FlowEHR extends the emphasis on developer ergonomics by providing an access-controlled notebook-style data science environment based on industry standard open-source tooling for the ML modelling lifecycle. The environment provides a simple and easy way to log experiment runs and artefacts alongside hyper parameter strategies and model versions. A structured workflow provides users with sufficient guidance to ensure reproducibility and avoid 'spaghetti code' common in research teams but dangerous for deployment. [@pizka2004]

# Limitations

In this paper we have focused on the architecture of the data pipeline and the analytics environment. A key component of the pipeline which we have not discussed in detail is privacy-preserving technologies to allow widespread data sharing and minimisation of the need for the use of patient identifying data in the early stages of development. The use of such technologies needs to be supported by local and national information governance and research ethics policies. (ref goldacre) This is a rapidly evolving area and we anticipate that a consensus on best practices will emerge in the next few years.

A further aspect of TDE design that we have not discussed is infrastructure design to facilitate a route to market. In order to have impact beyond the institution where they were developed, ML-based CDSSes must be easily commercialisable. Computable contracts (ref: https://journals.sagepub.com/doi/full/10.1177/20555636211072560) to support data sharing agreements, intellectual property allocation as part of multi-organisation collaborations have the potential to facilitate collaborations with industry partners, thereby easing the route to market. However, at this stage they remain experimental.

# Conclusion

In this paper we have described the key features of a TDE and process of ML-based CDSS development and presented the argument that TDEs, purpose-built infrastructure designed to support rapid cycles of iterative development, are essential for scalable development and to minimise wastage of research funding. We have also presented an early stage implementation.

By laying out a framework for describing the stages of algorithm development, we hope to create a common language that research funders, programme directors and ML researchers can use to support discussions around strategic investment in healthcare ML research and development. Further research is required to identify the best architectural design patterns for TDEs and how best to incorporate technologies to enhance data privacy and accelerate widespread adoption.