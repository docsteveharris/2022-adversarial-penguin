
Bold claims and huge investments suggest Machine Learning (ML) will transform healthcare.[@bunz2022] High impact publications showcase precision models that predict sepsis, shock, and acute kidney injury.[@komorowski2018; @hyland2020; @tomasev2019] Outside healthcare, tech titans such as AirBnB, Facebook, and Uber create value from ML despite owning 'no property, no content and no cars'.[@mcrae2015] Inspired by this, and very much aware of the flaws and unwarranted variation in human decision making[@braithwaite2020], government and industry are now laying heavy bets on ML for Health (ML4H).[@nhsx2022; @2021f]

Widespread adoption of electronic health records (EHR) is a prerequisite for this ambition. Yet while EHR adoption is growing at pace[@everson2020], those ML4H models that have reached the market rarely use the EHR. They are instead embedded in isolated digital workflows (typically radiology) or medical devices.[@muehlematter2021] Here the deployment environment is either fully specified (devices), or static and self-contained (imaging). The problems are conveniently constrained by biology or a physical reality.

In contrast, the EHR is in constant flux. Both the data and the data model are updating. New wards open, staffing patterns are adjusted and from time to time major incidents (even global pandemics) disrupt everything. There are multiple interacting users, and eventually there will be multiple interacting algorithms, and we will have to tackle the ML equivalent of poly-pharmacy.[@morse2020a] Algorithms will need ongoing care and attention. Whilst the aformentioned prediction models are developed on real-world data, this is insufficient. Despite their innovation and foresight, they find themselves in Gartner's trough of disillusinionment and at the bottom of the AI chasm.[@steinert2010; @keane2018] They have in reality not left the laboratory bench.

A future that sees ML4H generate value from the EHR requires more than a Trusted Research Environment (TRE) holding real-world data. TREs excel at the meeting the needs of population health scientists but they do not have the full complement of features required to take an ML4H algorithm from bench-to-bedside. Using drug development as an an analogy, a TRE is custom made for drug discovery not translational medicine.[@woolf2008b] 

In this paper, we describe the functional requirements for a Clinical Deployment Environment (CDE) for ML4H. These differ from the classical components of translational medicine in that algorithms will require ongoing stewardship even after a successful deployment. The CDE is an infrastructure that manages algorithms with the same regard that is given to medicines (pharmacy) and machines (medical physics). Moreover, the value of ML4H will not just be from externally developed blockbuster models, but will also derive from specific and local solutions. Our vision of a CDE therefore enables both *development* and *deployment*.  

Our CDE is supported by five pillars: 

1. Real World Development
2. ML-Ops for Health
3. Responsible AI in practice
4. Implementation science
5. Continuous evaluation

We describe these pillars below alongside figures and vignettes reporting early local experience in building a CDE.