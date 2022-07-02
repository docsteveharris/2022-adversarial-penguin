
Bold claims and huge investments suggest Machine Learning (ML) will transform healthcare.[@bunz2022a] High impact publications showcase precision models that predict sepsis, shock, and acute kidney injury.[@komorowski2018; @hyland2020; @tomasev2019] Outside healthcare, tech titans such as AirBnB, Facebook, and Uber create value from ML despite owning 'no property, no content and no cars'.[@mcrae2015] Inspired by this, and very much aware of the flaws and unwarranted variation in human decision making[@braithwaite2020], government and industry are now laying heavy bets on ML for Health (ML4H).[@nhsx2022; @2021f]

Widespread adoption of electronic health records (EHR) might be thought a sufficient prerequisite for this ambition. Yet while EHR adoption is growing at pace[@everson2020], those ML4H models that have reached the market rarely use the EHR. They are instead embedded in isolated digital workflows (typically radiology) or medical devices.[@muehlematter2021] Here the context of deployment is static and self-contained (imaging), or fully specified (devices), and translation has proved easier to navigate.

In contrast, the EHR is in constant flux. Both the data and the data model are updating. New wards open, staffing patterns are adjusted and from time to time major incidents (even global pandemics) disrupt everything. There are multiple interacting users, and eventually there will be multiple interacting algorithms, and organisations will face the ML equivalent of poly-pharmacy.[@morse2020a] Algorithms will require stewards.[@eaneff2020] Whilst the aformentioned high impact prediction models are developed on real-world data, this is not the same as real-world development. Data are either anonymised and analysed offline, or moved out of the healthcare environment into an isolated Data Safe Haven (DSH) [also known as Trusted Research Environment (TRE)].[@burton2015] This separation is the first fracture leading to the oft-cited AI chasm[@keane2018] leaving the algorithms stranded on the laboratory bench. 

A future that sees ML4H generate value from the EHR requires an alternative design pattern. TREs excel at meeting the needs of population health scientists but they do not have the full complement of features required to take an ML4H algorithm from bench-to-bedside. Using drug development as an an analogy, a TRE is custom made for drug discovery not translational medicine.[@woolf2008b] 

In this paper, we describe the functional requirements for a Clinical Deployment Environment (CDE) for translational ML4H. These requirements map closely to the classical components of translational medicine, but differ in that algorithms will require ongoing stewardship even after a successful deployment. The CDE is an infrastructure that manages algorithms with the same regard that is given to medicines (pharmacy) and machines (medical physics). Moreover, the value of ML4H will not just be from externally developed blockbuster models, but will also derive from specific and local solutions. Our vision of a CDE therefore enables both *development* and *deployment*.  

Our CDE is supported by five pillars: 

    1. Real World Development
    2. ML-Ops for Health
    3. Responsible AI in practice
    4. Implementation science
    5. Continuous evaluation

We describe these pillars below alongside figures and vignettes reporting early local experience in our journey building this infrastructure.