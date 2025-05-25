--removing followed by relations 
--REGEX for cleanup (?<=([^)]))[\n](?![(]) -- Finds all new lines without a closing bracket or semicolon before, and an opening bracket after and replaces with a space;
-- other edits 
-- 8(3) -> 8(2) ref edge corrected to 8(3)(a) -> 8(2) (27/2)
-- added first 6 sections as well 

INSERT INTO rel_type (id, rel_description) VALUES  
(1, 'includes') 
,(3, 'refers')
,(4, 'subject to')
,(5, 'overrides')
,(6, 'activates')
,(7, 'modifies')
,(8, 'in addition to')
,(9, 'conditioned on');
--section 7;
INSERT INTO regs (id, reg_description) VALUES  
(0, ' Therapeutic Goods Order No. 92 - Standard for labels of non-prescription medicines');

 INSERT INTO regs (id, reg_description) VALUES  
(100000000,'About this compilation '),
(100000001,'This compilation This is a compilation of the Therapeutic Goods Order No. 92 - Standard for labels of non- prescription medicines that shows the text of the law as amended and in force on 30 April 2023 (the compilation date). The notes at the end of this compilation (the endnotes) include information about amending laws and the amendment history of provisions of the compiled law.'),
(100000002,'Uncommenced amendments The effect of uncommenced amendments is not shown in the text of the compiled law. Any uncommenced amendments affecting the law are accessible on the Legislation Register (www.legislation.gov.au). The details of amendments made up to, but not commenced at, the compilation date are underlined in the endnotes. For more information on any uncommenced amendments, see the series page on the Legislation Register for the compiled law.'),
(100000003,'Application, saving and transitional provisions for provisions and amendments If the operation of a provision or amendment of the compiled law is affected by an application, saving or transitional provision that is not included in this compilation, details are included in the endnotes.'),
(100000004,'Modifications If the compiled law is modified by another law, the compiled law operates as modified but the modification does not amend the text of the law. Accordingly, this compilation does not show the text of the compiled law as modified. For more information on any modifications, see the series page on the Legislation Register for the compiled law.'),
(100000005,'Self-repealing provisions If a provision of the compiled law has been repealed in accordance with a provision of the law, details are included in the endnotes.'),
(101000000,'Introduction '),
(101000001,'(1) This Order sets out what kinds of information are required to be included on the label of medicines of the kind described in section 3, and in what circumstances.'),
(101000002,'(2) The purpose of the label on a medicine is to provide information about the medicine such as its identity, potency, content, storage, expiry date, dose, directions for use, sponsor details and registration/listing status. Labels on medicines can also include other information not required by this Order but which may be required by other legislation or for commercial purposes such as the sponsor’s logo.'),
(101000003,'(3) The information included on a label contributes to the quality use of medicines. Quality use of medicines means selecting management options wisely, choosing suitable medicines if a medicine is considered necessary, and using those medicines safely and effectively.'),
(101000004,'(4) The requirements set out in this Order are consistent with the National Medicines Policy which aims to meet medication and related service needs, so that both optimal health outcomes and economic objectives are achieved. The four central objectives of the policy are: - timely access to the medicines that Australians need, at a cost individuals and the community can afford; - medicines meeting appropriate standards of quality, safety and efficacy; - quality use of medicines; and - maintaining a responsible and viable medicines industry.'),
(101000005,'(5) This Order also sets out general requirements for the labels of non- prescription medicines. The purpose of the Order is to facilitate the quality use of those medicines by consumers and health professionals by ensuring appropriate labelling. Consideration of the following objectives in designing labels, and assessing and determining compliance with the requirements of this Order, will assist in achieving that purpose: - minimising the risk of prescribing, dispensing and self-selection errors; - enhancing consumer safety; - avoiding consumer confusion and the inappropriate use of medicines (including misuse, over-use, and under-use); - assisting the appropriate selection of those medicines; - assisting the safe and effective use of those medicines; - optimising identification and usability of necessary information; - improving consumers’ ability to solve problems related to those medicines, such as managing multiple medicines; and - where relevant, ensuring consumers are aware of where to go for further information about their medicine.'),
(101000006,'(6) Guidelines to assist in the design of medicine labels are available on the Therapeutic Goods Administration website (http://www.tga.gov.au).'),
(101000007,'Under the Act: - whether a medicine conforms to a standard applicable to the medicine is a matter the Secretary must take into account in deciding whether to include the medicine in the part of the Register for registered goods - an applicant for the listing of a medicine must certify that the medicine conforms to every standard applicable to the medicine - failure to conform to a standard applicable to a medicine is grounds for the Secretary to suspend or cancel the registration or listing of the medicine - failure to conform to a standard applicable to a medicine is grounds for the Secretary to require public notification and recovery of the medicine - it is an offence to supply medicines in Australia that do not comply with a standard applicable to the medicine relating to labelling or packaging and civil penalties may be payable in relation to such supply - whether the presentation of a medicine is acceptable is a matter the Secretary must take into account in deciding whether a medicine can be registered – \"presentation \" means the way in which the medicine is presented for supply and includes matters relating to the labelling and packaging of the medicine. Subject to specified notice requirements, the Secretary may decide to suspend or cancel the registration of a medicine, if it appears to the Secretary that the presentation of the medicine is not acceptable - an applicant for the listing of a medicine must certify that the presentation of the medicine is not unacceptable. Unacceptable presentation is a ground for suspension or cancellation of the listing of a medicine - there are also grounds for the Secretary to require public notification and recovery of supplied medicines if: -- in the case of registered medicines, it appears to the Secretary that the presentation of the medicine is not acceptable; and -- in the case of listed medicines, it appears to the Secretary that the presentation of the medicine is unacceptable.'),
(101000008,'(8) To avoid doubt, this section is not part of the Order.'),
(102000000,'1 Name of Order '),
(102000001,'This Order is to be known as the Therapeutic Goods Order No. 92 - Standard for labels of non-prescription medicines.'),
(300000000,'3 Application - Therapeutic goods to which this Order applies'),
(301000000, '(1) Subject to sections 4 and 5, this Order applies to medicines supplied or for supply in Australia, other than those specified under section 3 of the Therapeutic Goods Order No. 91 – Standard for labels of prescription and related medicines.'),
(302000000,'(2) To avoid doubt, this Order will apply to the following medicines:'),
(302010000,'(a) medicines of a kind specified in Parts 2 and 3 of Schedule 10 to the Regulations and'),
(302020000,'(b) medicines exempt from the listing and registration requirements, other than those specified in section 5 of this Order.'),
(400000000,'4 Transition arrangements '),
(401000000,'(1) On and from 31 August 2016 and before 1 September 2020, each medicine to which this Order applies must comply with either:'),
(401010000,'(a) the requirements specified in this Order; or'),
(401020000,'(b) the requirements specified in:'),
(401020010,'(i) Therapeutic Goods Order No. 69 General requirements for labels for medicines (TGO 69), up until 30 June 2017 (inclusive); or'),
(401020020,'(ii) Therapeutic Goods Order No. 69 - General Requirements for Labels for Medicines 2017 (TGO 69 (2017)), on or after 1 July 2017.'),
(402000000,'(2) On and from 1 September 2020, each medicine to which this Order applies must comply with the requirements specified in this Order.'),
(403000000, '(3) Notwithstanding (1) and (2), medicines imported into or manufactured in Australia before 1 September 2020 but supplied by a person other than the sponsor after that date must comply with TGO 69 (2017) if at the time of their release for supply they complied with TGO 69 (2017).'),
(500000000,'5 Exemptions – Medicines to which this Order does not apply '), 
(501000000,' This Order does not apply to a medicine that is:'),
(501010000,'(a) intended for use in the treatment of another person in accordance with an approval set out in paragraph 19(1)(a) of the Act; or'),
(501020000,'(b) intended to be supplied to a Category A person under the exemption provided for in regulation 12A of the Regulations; or'),
(501030000,'(c) the subject of an authorisation granted under subsection 19(5) of the Act and its use is consistent with the requirements set out in regulation 12B of the Regulations; or'),
(501031000,'(ca) intended for use in the treatment of humans in accordance with rules specified for the purposes of subsection 19(7A) of the Act; or'),
(501040000,'(d) exempted from the operation of Division 2 of Part 3-2 of the Act because of an exemption made by the Minister under section 18A of the Act in relation to that medicine; or'),
(501050000,'(e) the subject of an approval under section 19A of the Act; or'),
(501060000,'(f) intended for use solely for experimental purposes in humans in accordance with an approval set out in paragraph 19(1)(b) of the Act or in accordance with the requirements set out in Item 3 of Schedule 5A to the Regulations; or'),
(501070000,'(g) a starting material used in the manufacture of a medicine, except when pre-packaged for supply for other therapeutic purposes or formulated as a dosage form; or'),
(501080000,'(h) not at its final stage of manufacture; or'),
(501090000,'(i) imported for use in the treatment of the importer or the importer’s immediate family as set out in Item 1 of Schedule 5 to the Regulations; or'),
(501100000,'(j) an export only medicine as defined in the Act; or'),
(501110000,'(k) made up or compounded extemporaneously, for a specific or individual case, by a pharmacist in the lawful practice of his or her profession; or'),
(501120000,'(l) supplied, in the course of treating a patient, by a health professional in the lawful practice of his or her profession; or'),
(501130000,'(m) made up or compounded extemporaneously, for a specific and individual case, by a complementary healthcare practitioner in the lawful practice of his or her profession; or'),
(501140000,'(n) xgoods that contain a substance mentioned in Schedule 9 to the Poisons Standard or a substance that is not mentioned in Schedule 9 but which meets the criteria for mention in that Schedule when making a decision to amend the Poisons Standard under section 52D(2) of the Act; or'),
(501150000,'(o) a medical gas; or'),
(501160000,'(p) osmotic pumps; or'),
(501170000,'(q) blood products under Item 13 that are described under paragraphs (a) and (b) under the heading ‘HUMAN BLOOD PRODUCTS’ in Appendix A to the Poisons Standard.'),
(502000000,'(2) The requirements of this Order do not apply to a transparent covering that encloses or wraps the container or primary pack containing a medicine and where the information that is required to be set out on the label of the container or the primary pack is clearly visible through that transparent covering.'),
(600000000,'6 Interpretation. '),
(601010000, '"Act" means the Therapeutic Goods Act 1989;'),
(601020000, '"active ingredient" means a therapeutically active component in a medicine’s final formulation that is responsible for its physiological or pharmacological action;'),
(601030000, '"antimicrobial preservative" means an ingredient added to a medicine to inhibit the growth of micro-organisms in the medicine;'),
(601040000,'"approved product details", in relation to a medicine, means details in relation to the medicine as approved under section 25 of the Act for the registration of the medicine;'),
(601050000,'"Australian Approved Names List" has the same meaning as in the Regulations;'),
(601060000,'"batch number" means a number, or a combination of numerals, symbols or letters, which is given by a manufacturer to a batch of medicine, to uniquely identify that batch and from which it is possible to trace that batch through all stages of manufacture and distribution;'),
(601070000,'"batch number prefix" means the prefix which precedes the batch number and has the following characteristics: (a) clearly indicates that the information following the prefix is the batch number; and (b) is in the following form: \"BATCH NUMBER\", \"BATCH NO.\", \"BATCH\", \"B\", \"(B)\", \"B/N\", \"LOT NUMBER\", \"LOT NO.\", or \"LOT\", or words or symbols to this effect, including a mixture of lower and upper case letters;'),
(601080000,'"calendar pack" means a pack containing individual dosage units that is labelled with day/date markings to specify the sequence in which the dosage units in the pack must be used in order to achieve the intended therapeutic activity;'),
(601090000, '"capacity" means the volume of the empty container;'),
(601100000,'"Certificate of Listing", in relation to a medicine, means the certificate given to the applicant for listing of the medicine under subsection 26(4) or subsection 26A(9) of the Act in relation to that medicine;'),
(601110000,'"Certificate of Registration", in relation to a medicine, means the certificate given to the applicant for registration of a medicine under subsection 25AB(4) of the Act in relation to that medicine;'),
(601120000,'"complementary healthcare practitioner" means a person described in paragraph 42AA(1)(c) of the Act;'),
(601130000,'"composite pack" has the same meaning as in the Act;'),
(601140000, '"container" has the same meaning as in the Act;'),
(601150000, '"critical health information" means information required under paragraphs 8(1)(b), (c), (j), (k), (l) and (n) of this Order, that is critical for safe use of medicines that are self-selected by a consumer;'),
(601160000,'"delivered dose" means, in relation to: (a) metered dose preparations - the dose delivered to the patient in a single actuation or delivery; and (b) powders for inhalation - the dose delivered from the inhaler in a single delivery;'),
(601170000,'"dial dispenser pack" means a container that has the following characteristics: (a) (b) (c) each of the dosage units is located in individual pockets preformed in a circular rigid tray; a close-fitting, rotatable, transparent lid which can only be rotated in one direction is located over the tray; and the individual dosage units can be dispensed by detaching a predefined portion of the lid or tray, and rotating the lid to the appropriate position;'),
(601180000,'"diluent" means a liquid used for reconstitution or dilution;'),
(601190000,'"directions for use" has the same meaning as in the Act;'),
(601200000,'"distributor" means a company or corporate entity, which is not the sponsor, that the sponsor has agreed should be identified on a medicine’s label;'),
(601210000,'"excipient", in relation to a medicine, means an ingredient of the medicine other than the active ingredient;'),
(601220000,'"expiry date", in relation to a product, means the date (month and year) after which the medicine should not be used;'),
(601230000,'"expiry date prefix" means a prefix which precedes the expiry date which has the following characteristics: (a) clearly indicates that the information following the prefix is the expiry date; (b) is in the following form: \"EXPIRY DATE\", \"EXPIRY\", \"EXPIRES\", \"EXP. DATE\", \"EXP\" , \"Use by\" or \"Use before\" or words to this effect, including a mixture of lower and upper case letters; (c) is not in the following form: \"Best by\" or \"Best before\" or words to this effect;'),
(601240000, '"external", in relation to the use of a medicine, means application in the ears, eyes or nose or to a body surface other than in the mouth, rectum, vagina, urethra or other body orifice;'),
(601250000,'"health professional" includes the following: (a) a health practitioner of any kind registered under a law of a State or Territory that provides for the registration of health practitioners of that kind; and (b) a biomedical engineer, prosthetist or rehabilitation engineer;'),
(601260000,'"herbal material" means a plant or part of a plant (defined by its botanical scientific name according to the binominal nomenclature system, including author, and the plant part), whether fresh or dried, that is whole, fragmented, cut or ground;'),
(601270000,'"herbal preparation" means an ingredient that is the result of the processing of a herbal material;'),
(601280000,'"homoeopathic medicine" means a medicine that: (a) contains one or more homoeopathic preparations; and (b) may contain excipients necessary for presentation of the medicine in the final dosage form.'),
(601290000,'"homoeopathic potency" means the dilution factor of a homoeopathic preparation, expressed as: (a) (b) \"nX\" where each dilution is a decimal or ten-fold dilution and \"n\" is the number of dilutions such that the total dilution is 10n; or \"nC\" where each dilution is a centesimal or hundred-fold dilution and \"n\" is the number of dilutions such that the total dilution is 100n; or (c) \"nLM\" or \"LMn\" where, from a 3C starting dilution, each subsequent dilution is a fifty millesimal or fifty thousand fold dilution and \"n\" is the number of dilutions such that the total dilution is 50,000^n. Note: Where 1000 centesimal dilutions are performed, the potency is expressed as nM; that is, 1M potency represents a 1,000C dilution, 2M a 2,000C dilution, etc'),
(601300000,'"homoeopathic preparation" has the same meaning as in the Regulations.'),
(601310000,'"intermediate packaging" means a level of packaging which, if it exists, encloses one or more containers and is itself enclosed in a primary pack;'),
(601320000,'"label" means a display of printed information upon, or securely affixed to, the container, any intermediate packaging and any primary pack containing the medicine;'),
(601330000,'"listed goods" has the same meaning as in the Act;'),
(601340000,'"listing number" means the combination of numbers and letters that are required to be included on the label of therapeutic goods in a manner described in regulation 15 of the Regulations;'),
(601350000,'"main label" means: (a) where there are two or more labels or two or more portions of a single label - that label or portion of the label where the name of the medicine is more or most conspicuously shown; or (b) where the name of the medicine is equally conspicuous on two or more labels or portions of a label – each label or portion;'),
(601360000,'"medicine" has the same meaning as in the Act;'),
(601370000,'"medicine kits" has the same meaning as described in Item 12 of Schedule 4 to the Regulations;'),
(601380000,'"medium container" means a container that has a capacity less than or equal to 60 millilitres that is not a small container;'),
(601390000,'"name and contact details" in respect of a sponsor or distributor, means (a) the name of the sponsor or distributor and sufficient information to allow the sponsor or distributor to be uniquely identified so as to facilitate public contact on matters of complaint, use or general enquiry. The contact details must include information such as the city or suburb of the sponsors distributors principal place of business in Australia (not being a post office, cable, telegraphic or code address). The Australian telephone number, website or email address may also be included; or (b) where there has been a change in the sponsors or distributors name or contact details in the previous twelve months, the name and contact details of the previous sponsor or distributor;'),
(601400000,'"name of an active ingredient" means: (a) the name of the active ingredient that is accepted for inclusion in the Australian Approved Names List; or (b) where the ingredient is a homoeopathic preparation: (i) either the name of the active ingredient, or the substance from which the dilution was prepared, that is accepted for inclusion in the Australian Approved Names List, together with a statement of the homoeopathic potency; or (ii) until such time as a name is accepted for inclusion in the Australian Approved Names List, a traditional homoeopathic name in full or as traditionally abbreviated with a statement of the homoeopathic potency;'),
(601410000,'"name of an excipient" means the name of the excipient that is accepted for inclusion in the Australian Approved Names List;'),
(601420000,'"name of the dosage form" means: (a) in relation to a medicine that is intended to be, or is, a listed goods or registered goods, the name of the dosage form as entered, or proposed to be entered, in the Register in relation to the medicine; and (b) in relation to a medicine that is not entered in the Register, the name of the pharmaceutical form of the medicine;'),
(601430000,'"name of the medicine" means the following:'),
(601430100,'(a) where the medicine is intended to be, or is, entered in the Register - the name of the medicine intended to appear or appearing on the Certificate of Registration or Certificate of Listing in relation to the medicine, not including the following information:'),
(601430101,'(i) the name of the active ingredient (except where the name of the active ingredient is intended by the sponsor to be, or because of the way it is represented, to form part of the name of the medicine);'),
(601430102,'(ii) the strength (except where numbers or words denoting strength are included in that name to differentiate medicines, by strength);'),
(601430103,'(iii) the dosage form (except where this is integral to differentiate medicines from other medicines);'),
(601430104, '(iv) container details;'),
(601430105,'(v) the pack size;'),
(601430106,'(vi) \"new formulation\" or representations to the same effect;'),
(601430107,'(vii) flavour descriptors (except where this is integral to differentiate medicines from other medicines);'),
(601430108,'(viii) the name of the sponsor or distributor (or part thereof) (except where the name is intended by the sponsor to be, or because of the way it is represented, to form part of the name of the medicine); and'),
(601430200,'(b) where the medicine is neither intended to be, nor is, entered in the Register:'),
(601430201,'(i) the registered trade mark for the medicine; or'),
(601430202,'(ii) a unique, invented, common or scientific name, assigned to the medicine by the sponsor and appearing on the label;'),
(601440000,'"Poisons Standard" means the current Poisons Standard as defined in section 52A of the Act;'),
(601450000,'"primary pack" has the same meaning as in the Act;'),
(601460000,'"quantity of the medicine" means: (a) where the medicine consists of discrete dosage units, such as tablets or capsules or sachets – the stated number of units in the container; or'),
(601460001,'(a) where the medicine consists of discrete dosage units, such as tablets or capsules or sachets – the stated number of units in the container; or'),
(601460002,'(b) where the medicine is: (i) a solid or semi-solid - the stated weight in the container; (ii) a liquid - the stated volume of fill in the container; (iii) a pressurised metered-dose preparation or dry powder inhaler - the stated number of deliverable doses in the container; (iv) a non-pressurised metered dose preparation - the minimum number of deliverable doses in the container;'),
(601460003,'(c) where the medicine is a medicine of any of the kinds referred to in paragraph (b) and the medicine consists of a number of identical containers within the primary pack – the number of containers (e.g. 5 x 10 mL vials);'),
(601460004,'(d) for each of the individual containers within the primary pack, the quantity of the medicine to be included on the individual container label would be as described in paragraph (b) (e.g. the stated volume of fill in the container);'),
(601470000,'"Register" has the same meaning as in the Act;'),
(601480000,'"registered goods" has the same meaning as in the Act;'),
(601490000,'"registration number" means the combination of numbers and letters that is required to be included on the label of medicines in a manner described in regulation 15 of the Regulations;'),
(601500000, '"Regulations" means the Therapeutic Goods Regulations 1990;'),
(601510000,'"Secretary" has the same meaning as in the Act;'),
(601520000,'"small container" means a container that has a capacity less than or equal to 25 millilitres;'),
(601530000,'"solid ophthalmic medicine" means a substance in a container to which a sterile diluent is added to prepare eye drops;'),
(601540000,'"sponsor" has the same meaning as in the Act;'),
(601550000,'"standard" has the same meaning as in the Act;'),
(601560000,'"standardisation" means the process in which the content of a specific chemical constituent(s) has been determined in a herbal material or herbal preparation.'),
(601570000,'"stated volume of fill" means the volume of medicine that the container is specified by the sponsor to contain;'),
(601580000,'"stated weight" means the mass of medicine that the container is specified by the sponsor to contain;'),
(601590000,'"supply" has the same meaning as in the Act;'),
(601600000,'"warning statements" means:'),
(601600001,'(a) any labelling requirements specified in the instrument made by the Minister under subsection 3(5A) of the Act, as in force from time to time; Note These requirements apply to all medicines other than those described in Part 1 of Schedule 10 to the Therapeutic Goods Regulations 1990'),
(601600002,'(b) any warning statements specified in any standard that applies to the medicine;'),
(601600003,'(c) any warning statements required by the Secretary to be included on the label as a condition of registration or listing in relation to the medicine;'),
(601600004,'(d) any warning statement required in relation to an ingredient being contained in a medicine as specified a determination made by the Minister under subsection 26BB(1)(b) of the Act; and'),
(601600005,'(e) any warning statements specified in the Poisons Standard.');

--section 7;
INSERT INTO regs (id, reg_description) VALUES  
(700000000, ' 7 General requirements, including label presentation')
,(701000000, ' (1) The container, intermediate packaging (if any) and primary pack in which a medicine is packed must each bear a label or labels that comply with the requirements of this Order that are applicable in relation to that medicine.')
,(702000000, ' (2) The information required by this Order to be included on a label or labels must:')
,(702010000, ' (a) be clearly visible and not be obscured; and')
,(702020000, ' (b) be in English; and')
,(702030000, ' (c) be in durable and legible characters; and')
,(702040000, ' (d) unless otherwise specified elsewhere in this Order, be displayed in a text size of not less than 1.5 millimetres, except: (i) in the case of the registration number or listing number, which must be in a text size of not less than 1.0 millimetre height as required by subparagraphs 15(1)(c)(i) and (ii), respectively of the Regulations; and')
,(702050000, ' (e) be in a colour or colours contrasting strongly with the background, except for:(i) the expiry date and expiry date prefix; and (ii) the batch number and batch number prefix when that information is embossed or debossed and not printed; and')
,(702060000, ' (f) unless otherwise specified elsewhere in this Order, be in metric units of measurement.');

--section 8;
 INSERT INTO regs (id, reg_description) VALUES  
(800000000, ' 8 Information to be included on the label')
,(801000000, ' (1) Subject to the qualifications and requirements specified in subsections 8(2) and 8(3) and sections 9 and 10 below, the labels of a medicine must include:')
,(801010000, ' (a) the name of the medicine; and')
,(801020000, ' (b) the name(s) of all active ingredients in the medicine; and')
,(801030000, ' (c) the quantity or proportion of all active ingredients in the medicine; and')
,(801040000, ' (d) the name of the dosage form; and')
,(801050000, ' (e) the quantity of the medicine; and')
,(801060000, ' (f) the batch number of the medicine preceded by the batch number prefix; and')
,(801070000, ' (g) the expiry date of the medicine, preceded by the expiry date prefix; and')
,(801080000, ' (h) the storage conditions applicable to the medicine; and')
,(801090000, ' (i) the name and contact details of the sponsor or distributor of the medicine; and')
,(801100000, ' (j) where: (i) a substance or substance within the group of substances referred to in Column 1 of Schedule 1 to this Order is present in the medicine; (ii) the circumstances as set out in Column 2 of Schedule 1 exist in relation to such a substance or no circumstances are set out in Column 2; and (iii) the medicine is intended to be administered via any one or more of the route(s) of administration referred to in Column 3 of Schedule 1, then: (iv) a statement: (A) indicating that the medicine contains the substance expressed using the Name stated in Column 4 of Schedule 1; and (B) where any of the circumstances and requirements set out in Column 2 of Schedule 1 exist in relation to the substance – a statement of the kind referred to as a ‘requirement’ in that Column (if any); and')
,(801110000, " (k) relevant warning statements, where these are required in relation to a particular medicine or in specified circumstances applying to a particular medicine, such as the following: (i) where the medicine is for external use the required statement is ‘Caution: Not to be Swallowed’ or ‘For External Use Only’ or words to this effect; (ii) where: (A) the medicine is for oral use; and (B) the medicine contains active ingredient(s) included in category 'B' (including 'B1', 'B2', 'B3') or category 'C' in the document titled ‘Prescribing medicines in pregnancy database’ published on the TGA website as on the date of commencement of this Order; and (C) the medicine is not subject to other specific warning statement(s) relating to use during pregnancy, the required statement is: ‘If pregnant or likely to become pregnant, consult a pharmacist or a doctor before use’ or words to this effect; and (iii) where: (A) the medicine is a registered goods for oral use; and (B) the medicine contains active ingredient(s) included in category ‘D’ (except nicotine for smoking cessation) in the document titled ‘Prescribing medicines in pregnancy database’ published on the TGA website as at the date of commencement of this Order; and (C) the medicine is not subject to other specific warning statements(s) relating to use during pregnancy, the required statement is ‘Do not use this medicine if pregnant or likely to become pregnant’ or words to this effect; and")
,(801120000, ' (l) directions for use of the medicine except where: (i) the dose of the medicine is usually determined for each individual patient by a health professional authorised under a law of a State or Territory to determine the dose; or (ii) there is insufficient space on the label of either the container or the primary pack, or both, to include directions for use, and: (A) those directions for use are set out in a package insert provided in the primary pack of the medicine; and (B) a statement is included on whichever label on the container, or the primary pack, or both, that does not set out the directions for use itself, that those directions are set out in the package insert; and')
,(801130000, ' (m) if the medicine requires some preparation, such as dissolving, suspending, diluting or reconstituting before use - instructions for its preparation and, where relevant, a statement of the conditions of storage and the maximum period of storage between preparation and use, except where: (i) there is insufficient space on the label of either the container or the primary pack, or both, to include this information; and (ii) this information is set out in a package insert provided in the primary pack of the medicine; and (iii) a statement is included on whichever label on the container or the primary pack, or both, that does not set out the information itself, that this information is set out in the package insert; and')
,(801140000, ' (n) a statement of the purpose or purposes for which it is intended that the medicine be used, except where: (i) the medicine is: (A) supplied solely to a complementary healthcare practitioner for supply to a person after affixing by the practitioner of an instruction label on the medicine following a consultation with that person; and (B) the label of the medicine includes the words ‘For Practitioner Dispensing Only’; and')
,(801150000, ' (o) if the medicine is contained in an ampoule, a statement of the approved route of administration for the medicine, such as ‘inhalation’, ‘For oral use only’ or other phrase, word or abbreviation denoting the approved route(s) of administration.')
,(802000000, ' (2)')
,(802010000, ' (a) Subject to paragraphs (b), (c) and (d), where the medicine is registered goods, the critical health information must be displayed on the label of the primary pack in a tabulated form.')
,(802020000, ' (b) The critical health information must be presented under appropriate headings and in the following order: (i) Active ingredients (ii) Indications (iii) Warnings (iv) Directions for use (v) Other information.')
,(802030000, ' (c) The information provided under paragraph 8(2)(b)(i) may include words describing the purpose of the active ingredient(s) by indicating the pharmacological category or the principal intended actions that are not required by this Order.')
,(802040000, ' (d) The information provided under paragraph 8(2)(b)(iii) may include safety related information not required by this Order (such as allergen advice, caution, additional warning or advisory statements).')
,(802050000, ' (e) If information other than the critical health information or information of a kind mentioned in subsections 8(2)(c) or 8(2)(d) is to be included, it must be placed under the ‘Other information’ heading or under another separate appropriate heading(s) that follow immediately below the headings mentioned in 8(2)(b) and must not contain any additional information other than: A. requirements relating to storage conditions B. information about package features to prevent tampering C. names of all excipients D. sponsor or distributor contact details.')
,(802060000, ' (f) The presentation of the critical health information, and any information mentioned in paragraphs 8(2)(c), 8(2)(d) or 8(2)(e) that is included, must be presented in black or other dark coloured texts, using only one colour, on a white or other contrasting background.')
,(803000000, ' (3) If the medicine is registered goods and')
,(803010000, ' (a) both: (i) the medicine is a medicated throat lozenge or an inorganic salt-based antacid that is in a solid dosage; and (ii) the space available for a label on the primary pack is less than seventy square centimetres; or (iii) the medicine is intended for use as a skin antiseptic: (A) for hand-hygiene; or (B) by a health professional as a patient pre-operative preparation; or (iv) the medicine is a paste or gel for the cleaning of teeth, then subsection 8(2) does not apply.')
,(804000000, ' (4) If the information required on the label on the container is obscured by intermediate packaging, then the label on the intermediate packaging must include:')
,(804010000, ' (a) the name of the medicine; and')
,(804020000, ' (b) the name(s) of all active ingredients in the medicine; and')
,(804030000, ' (c) the quantity or proportion of all active ingredients in the medicine; and')
,(804040000, ' (d) the batch number of the medicine preceded by the batch number prefix; and')
,(804050000, ' (e) the expiry date of the medicine preceded by the expiry date prefix; and')
,(804060000, ' (f) the name of the sponsor or distributor, or a registered trademark if it readily identifies the sponsor or distributor of the medicine.')
,(805000000, ' (5) If the container is enclosed in a delivery device such that it cannot be removed, the information required on its label under subsection 8(1) must be applied on the delivery device and not the container.') ;

--section 9;
INSERT INTO regs (id, reg_description) VALUES  (900000000, ' 9 Information to be included on the main label')
,(901000000, ' (1) Subject to the qualifications and special requirements specified in this section and section 10 of this Order, the information on the main label of the medicine must include:')
,(901010000, ' (a) the name of the medicine; and')
,(901020000, ' (b) the name(s) of all active ingredients in the medicine; and')
,(901030000, ' (c) the quantity or proportion of all active ingredients in the medicine; and')
,(901040000, ' (d) the name of the dosage form; and')
,(901050000, ' (e) the quantity of the medicine; and')
,(901060000, ' (f) if the medicine is contained in an ampoule - a statement of the approved route of administration for the medicine, such as ‘inhalation’, ‘For oral use only’ or other phrase, word or abbreviation denoting the approved route(s) of administration.')
,(902000000, ' (2) The name of the medicine on the main label must be presented in a continuous, uninterrupted manner and not be broken up by additional information or background text.')
,(903000000, ' (3) Subject to paragraph (c), the name of the medicine and the name(s) of active ingredient(s) on the main label must:')
,(903010000, ' (a) appear as a cohesive unit by the placing of the name and quantity of each active ingredient together on separate lines of text either (i) immediately below the name of the medicine; or (ii) where the trademark of the medicine might be disrupted or obscured, adjacent to the name of the medicine; and')
,(903020000, ' (b) not be separated by any text or graphics, except where additional information is: (i) required or permitted by: (A) paragraph 11(2)(h); or (B) subparagraphs 11(2)(i)(i) or 11(2)(i)(ii)(A); or (C) subsection 11(5); or (ii) in relation to identifying the different formulations of the medicines contained in a composite pack or a medicine kit;')
,(903030000, ' (c) if the medicine is: (i) supplied in either a small or a medium container; and (ii) contains multiple active ingredients then, in relation to compliance of the label with paragraph 9(3)(a), the names of the multiple active ingredients and their quantities may be presented together on a continuous line, or lines, of text.')
,(904000000, ' (4) All text required by this Order to be on the main label must be oriented in the same direction.')
,(905000000, ' (5) If the medicine contains:')
,(905010000, ' (a) two or more active ingredients; and')
,(905020000, ' (b) at least two of those active ingredients belong to any of the following categories: (i) a vitamin that is identified by both: (A) the approved name of the active ingredient that is a vitamin; and (B) in accordance with subsection 11(5), the word ‘vitamin’, or any suitable unambiguous abbreviation of the word vitamin, together with the common name of that vitamin; or (ii) a mineral;  (iii) a herbal preparation that, under subparagraph 11(2)(i)(ii), is required to be quantified as either: (A) the dry or fresh weight of herbal material from which the preparation was derived; or (B) the minimum dry or fresh weight of herbal material from which the preparation was derived, then: the names, and quantities or proportions, of all active ingredients in the medicine may appear on a side panel or side label or on a rear panel or rear label instead of on the main label; and')
,(905030000, ' (c) if the medicine is intended to be, or is, registered goods, and (i) subsection 8(2) does not apply, then the names, and quantities or proportions, of the active ingredients must be displayed on the side or rear panel or label in a text size of not less than 2.5 millimetres; or (ii) subsection 8(2) applies, then compliance with paragraphs 9(1)(b) and 9(1)(c) is not required.')
,(906000000, ' (6) If the medicine is intended to be, or is, listed goods:')
,(906010000, ' (a) if the medicine is a sunscreen preparation - the name of every active ingredient, together with the quantity or proportion of every active ingredient, and the name of the dosage form, may appear on a side panel or side label or on a rear panel or rear label; or')
,(906020000, ' (b) if there are four or more active ingredients in the medicine - the name of every active ingredient, together with the quantity or proportion of every active ingredient, may appear on a side panel or side label or on a rear panel or rear label.')
,(907000000, ' (7) Subject to subsection 9(9), if the medicine is intended to be, or is, registered goods, then:')
,(907010000, ' (a) where the medicine contains three or fewer active ingredients, the name of the active ingredient(s) and the quantity or proportion of active ingredient(s) must be displayed on the main label in a text size of not less than 3.0 millimetres, except where the medicine is supplied: (i) in a medium container – in which case, the information must be displayed in a text size of not less than 2.5 millimetres; or (ii) in a small container – in which case, the information must be displayed in a text size of not less than 2.0 millimetres; but (iii) if the medium container or the small container is enclosed in a primary pack, the exceptions in subparagraphs 9(7)(a)(i) and (ii) do not apply to the main label on the primary pack;')
,(907020000, ' (b) where the medicine contains four or more active ingredients and subsection 8(2) does not apply, then the names and the quantities or proportions of the active ingredients may be included on a side panel or side label or on a rear panel or rear label, when displayed in a text size of not less than 2.5 millimetres; or')
,(907030000, ' (c) where the medicine contains four or more active ingredients and subsection 8(2) applies, then compliance with paragraphs 9(1)(b) and 9(1)(c) is not required; or')
,(907040000, ' (d) if subsection 8(2) applies and the medicine: (i) includes one or more active ingredients, the name of which includes descriptors (for example chemical salts or hydration states) that are not therapeutically relevant; and (ii) the name and quantity or proportion of each of those active ingredients is displayed in accordance with subsection 8(2), then the name of the therapeutically active moiety(ies) of the active ingredient may be displayed on the main label on the primary pack, instead of the name of the active ingredient, if: (iii) this is in a text size of not less than 3.0 millimetres; and (iv) no quantity or proportion information is displayed for any of the active ingredients in the medicine.')
,(908000000, ' (8) Where a medicine is:')
,(908010000, ' (a) supplied as part of either a composite pack or a medicine kit; and')
,(908020000, ' (b) there are different formulations of medicine in that composite pack or medicine kit;')
,(908030000, ' (c) (i) the total number of active ingredients in the different formulations in the composite pack or medicine kit are to be counted; and (ii) if the same active ingredient is contained in two or more formulations in the composite pack or medicine kit, each of those active ingredients is to be counted separately, for the purposes of determining if paragraph 9(6)(b) applies to the composite pack or medicine kit, or which paragraph in subsection 9(7) applies to the composite pack or medicine kit; and')
,(908040000, ' (d) the information required under either paragraph 9(6)(b) or subsection 9(7) must be provided separately in relation to each formulation of medicine in the composite pack or medicine kit.')
,(909000000, ' (9) If the medicine is intended to be, or is, registered goods, and the name of an active ingredient included in the medicine comprises an ingredient name specified in Schedule 2 to this Order, either alone or in combination with any other descriptors, then the names of all active ingredients in the medicine, together with their quantity or proportion, must be displayed in a text size of not less than 2.5 millimetres.')
,(910000000, ' (10) Subsection 9(9) does not apply:')
,(910010000, ' (a) where the medicine is supplied in a small container; or')
,(910020000, ' (b) where the medicine is not supplied in a small container and is labelled in accordance with subsection 9(11) and Part 1 of Schedule 2—after 30 April 2026; or')
,(910030000, ' (c) where the medicine is not supplied in a small container and is labelled in accordance with subsection 9(13) and Part 2 of Schedule 2—after 30 April 2028. Note: The minimum text size for active ingredients on labels of small containers is less than 2.5 millimetres and specified elsewhere in this Order.')
,(911000000, ' (11) An active ingredient specified in Part 1 of Schedule 2, either alone or in combination with any other descriptors, may be included on the main label of a medicine containing that ingredient as specified in that Part for medicine released for supply before 1 May 2026.')
,(912000000, ' (12) To avoid doubt, an active ingredient specified in Part 1 of Schedule 2 must be included on the main label of a medicine containing that ingredient in accordance with the Australian Approved Names List for medicine released for supply on or after 1 May 2026.')
,(913000000, ' (13) An active ingredient specified in Part 2 of Schedule 2, either alone or in combination with any other descriptors, may be included on the main label of a medicine containing that ingredient as specified in that Part for medicine released for supply before 1 May 2028.')
,(914000000, ' (14) To avoid doubt, an active ingredient specified in Part 2 of Schedule 2 must be included on the main label of a medicine containing that ingredient in accordance with the Australian Approved Names List for medicine released for supply on or after 1 May 2028.');

--section 10;
INSERT INTO regs (id, reg_description) VALUES  (1000000000, ' 10 Qualifications and special requirements')
,(1001000000, ' (1) Preparations for ophthalmic use In addition to the requirements of sections 8 and 9 above, if a medicine is a preparation for ophthalmic use, the label on the container and on the primary pack or, where subsection 10(7) applies, the primary pack, must include:')
,(1001010000, ' (a) the name of any antimicrobial preservative in the medicine;')
,(1001020000, ' (b) if the medicine, other than an ophthalmic ointment, does not contain an antimicrobial preservative - the statement ‘Contains no antimicrobial preservative. Use once only and discard residue’ or words to that effect;')
,(1001030000, ' (c) if the medicine is for multidose use - a statement to the effect that ‘the medicine should not be used more than four weeks’, or such shorter period as specified in the approved product details in relation to the medicine, after the container is first opened;')
,(1001040000, ' (d) if the medicine consists of a solid ophthalmic medicine for preparing eye drops for multidose use - a statement to the effect that ‘the medicine when prepared should not be used more than four weeks’, or such shorter period as specified in the approved product details in relation to the medicine, after the container is first opened.')
,(1001050000, ' (e) if the medicine consists of a solid ophthalmic medicine for preparing eye drops for multidose use - the words ‘for eye drops’.')
,(1002000000, ' (2) Preparations for use on skin and/or mucous membranes or by inhalation, and metered nasal sprays The label on a container and on a primary pack (if any) of a medicine which is a preparation for use on skin and/or mucous membranes or is for inhalation or is a metered nasal spray must, in addition to the requirements referred to in sections 8 and 9 above, include the name of any antimicrobial preservative in the medicine.')
,(1003000000, ' (3) Homoeopathic medicines Where all the active ingredients in a medicine are homoeopathic preparations, the main label on the container and the main label on the primary pack (if any) must, in addition to the requirements referred to in sections 8 and 9 above, include a statement to the effect that the medicine is a homoeopathic medicine in text size that is not less than 50% of the text size of the name of the medicine and (in any event) not less than 2 millimetres.')
,(1004000000, ' (4) Formulations containing both homoeopathic preparations and non-homoeopathic ingredients Where a medicine contains active ingredients that are homoeopathic preparations, and other active ingredients that are not homoeopathic preparations, then, in addition to the requirements referred to in sections 8 and 9 above:')
,(1004010000, ' (a) the main label on the container and the main label on the primary pack (if any) must include a statement to the effect that the medicine contains homoeopathic preparations in text size that is not less than 50% of the text size of the name of the medicine and (in any event) not less than 2 millimetres;')
,(1004020000, ' (b) the label on the container and the label on the primary pack (if any) must differentiate ingredients that are homoeopathic preparations from those that are not, such as by including the statement ‘contains homoeopathic preparations of’ adjacent to the list of homoeopathic ingredients, or by prefacing the name of the homoeopathic active ingredient with the term ‘homoeopathic’.')
,(1005000000, ' (5) Sunscreen preparations If:')
,(1005010000, ' (a) the medicine is a sunscreen preparation; and')
,(1005020000, ' (b) is enclosed in a container with a capacity of not more than 25 millilitres, then, in relation to compliance with sections 8 and 9, it shall be sufficient if (i) the sun protection factor is displayed in a text size of not less than 1.5 millimetres; and (ii) all other information is displayed in a text size of not less than 1.0 millimetres.')
,(1006000000, ' (6) Medicine kits The label on a package that, together with medicines, constitutes a medicine kit must include the following information:')
,(1006010000, ' (a) the name given to the kit;')
,(1006020000, ' (b) the name and contact details of the sponsor of the kit;')
,(1006030000, ' (c) the name of each of the medicines within the kit and its dosage form;')
,(1006040000, ' (d) the name, and quantity or proportion, of all active ingredients in each of the medicines within the kit;')
,(1006050000, ' (e) the quantity of each medicine within the kit;')
,(1006060000, ' (f) the batch number of the kit preceded by the batch number prefix;')
,(1006070000, ' (g) an expiry date for the kit, being the earliest expiry date of the medicines within the kit, preceded by the expiry date prefix;')
,(1006080000, ' (h) any warning statements that relate to any of the medicines within the kit;')
,(1006090000, ' (i) storage conditions applicable to the kit, being the most restrictive of the storage conditions for any of the medicines within the kit;')
,(1006100000, ' (j) the listing number given to the kit, set out on the label consistent with the requirements specified in the Regulations. Note: The label on the container and on the primary pack (if any) of each medicine within a medicine kit must comply with the requirements of this Order.')
,(1007000000, ' (7) Small containers If:')
,(1007010000, ' (a) the medicine is enclosed in a small container; and')
,(1007020000, ' (b) the container is enclosed in a primary pack, the label of which complies with sections 8 and 9 and subsection 10(1) (if applicable), then, in relation to compliance of the label on the container with sections 8 and 9 and subsection 10(1) (if applicable), it shall be sufficient if the following information is displayed in a text size of not less than 2 millimetres:')
,(1007030000, ' (c) the name of the medicine; and')
,(1007040000, ' (d) the name(s) of all active ingredients in the medicine, unless there are four or more active ingredients; and the following information is displayed in a text size of not less than 1.5 millimetres:')
,(1007050000, ' (e) where there are four or more active ingredients, the names of the active ingredients; and')
,(1007060000, ' (f) the quantity or proportion of all active ingredients in the medicine; and')
,(1007070000, ' (g) the name of the dosage form; and')
,(1007080000, ' (h) the quantity of the medicine in the container; and')
,(1007090000, ' (i) the batch number of the medicine preceded by the batch number prefix; and')
,(1007100000, ' (j) the expiry date of the medicine preceded by the expiry date prefix; and')
,(1007110000, ' (k) the name of the sponsor or distributor as it appears on the primary pack, or registered trademark if it readily identifies the sponsor or distributor of the medicine; and')
,(1007120000, " (l) if the medicine is contained in an ampoule - a statement of the approved route of administration for the medicine, such as ‘inhalation’, ‘For oral use only’ or other phrase, word or abbreviation denoting the approved route(s) of administration of the medicine; and")
,(1007130000, ' (m) if the medicine: (i) is an ophthalmic preparation for multidose use - a statement to the effect that the medicine should not be used later than four weeks, or another shorter period as specified in the approved product details in relation to the medicine, after the container is first opened ; or (ii) consists of a solid ophthalmic medicine for preparing eye drops for multidose use - a statement to the effect that the medicine when prepared should not be used later than four weeks, or another shorter period as specified in the approved product details in relation to the medicine, after the container is first opened.')
,(1008000000, ' (8) Individually wrapped medicines')
,(1008010000, ' (a) Subject to paragraph (b), if: (i) a medicine consists of individual dosage units such as tablets, capsules, pills, pastilles, cachets, lozenges, pessaries, suppositories, single doses of a powder, single doses of a liquid, or a transdermal patch; and (ii) each dosage unit is enclosed in an individual wrapper or blister, whether sealed or unsealed; and (iii) one or more dosage units are enclosed in a primary pack; and (iv) the label on the primary pack complies with sections 8 and 9, then, in relation to compliance of the label on each individual wrapper or blister with sections 8 and 9, it shall be sufficient if the following information is displayed: (v) the name of the medicine; and (vi) the name(s) of all active ingredients in the medicine; and (vii) the quantity or proportion of all active ingredients in the medicine; and (viii) the batch number of the medicine preceded by the batch number prefix; and (ix) the expiry date of the medicine preceded by the expiry date prefix; and (x) the name of the sponsor or distributor, or registered trademark if it readily identifies the sponsor or distributor of the medicine.')
,(1008020000, ' (b) If: (i) the medicine consists only of pastilles or lozenges; and (ii) each dosage unit is enclosed in an unsealed individual wrapper; and (iii) each dosage unit is, after being so wrapped, enclosed in a primary pack that complies with sections 8 and 9, then, in relation to compliance of the label for each individual wrapper with sections 8 and 9, it shall be sufficient if the name of the medicine is displayed.')
,(1008030000, ' (c) Where: (i) a medicine consists of dry herbs contained in individual bags and the bag is retained around the herbs during preparation; (ii) the bags are contained in a primary pack, the label of which complies with the requirements of this Order, then the individual bag need not be labelled with the information referred to in sections 8 and 9.')
,(1009000000, ' (9) Strip, blister and dial dispenser packs')
,(1009010000, ' (a) Subject to paragraph (b), if: (i) a medicine consists of individual dosage units such as tablets, capsules, pills, pastilles, cachets, lozenges, pessaries, suppositories or single doses of powder; and (ii) two or more dosage units are individually enclosed in a strip, blister or dial dispenser pack such that the dosage units can only be extracted individually; and (iii) the strip, blister or dial dispenser pack is enclosed in a primary pack, the label of which complies with sections 8 and 9, then, in relation to compliance of the label on the strip, blister or dial dispenser pack with sections 8 and 9, it shall be sufficient if the following information is displayed: (iv) the name of the medicine; and (v) the name(s) of all active ingredients in the medicine; and (vi) the quantity or proportion of all active ingredients in the medicine; and (vii) the batch number of the medicine preceded by the batch number prefix; and (viii) the expiry date of the medicine preceded by the expiry date prefix; and (ix) the name of the sponsor or distributor, or registered trademark if it readily identifies the sponsor or distributor of the medicine.')
,(1009020000, ' (b) If, in relation to a medicine referred to in (a) there are: (i) four or more active ingredients in the medicine and the medicine is intended to be, or is, registered goods; or (ii) two or more active ingredients in the medicine and the medicine is intended to be, or is, listed goods, then, in relation to compliance of the label on the strip, blister or dial dispenser pack with sections 8 and 9, it shall be sufficient if the following information is displayed: (iii) the name of the medicine; and (iv) the batch number of the medicine preceded by the batch number prefix; and (v) the expiry date of the medicine preceded by the expiry date prefix; and (vi) the name of the sponsor or distributor, or registered trademark if it readily identifies the sponsor or distributor of the medicine.')
,(1009030000, ' (c) In addition to the requirements referred to in paragraphs 10(9)(a) and (b) as relevant, if each dosage unit is enclosed in the strip or blister such that an individual segment containing the dosage unit can be readily detached, then the following information must appear on the label of the strip or blister at least once in relation to every two dosage units: (i) for a medicine to which paragraph 10(9)(a) applies – the name of the medicine, the name(s) of all active ingredients in the medicine and the quantity or proportion of all active ingredients in the medicine; and (ii) for a medicine to which paragraph 10(9)(b) applies – the name of the medicine.')
,(1010000000, ' (10) Plastic ampoules')
,(1010010000, ' (a) Subject to paragraph (b), if: (i) a medicine is contained in a plastic ampoule; and (ii) the capacity of the container of the medicine in the plastic ampoule is 8 millilitres or less; and (iii) two or more ampoules are attached to a connecting strip; and (iv) the ampoules and their connecting strip are enclosed in a primary pack that complies with the requirements of this Order, then the information required by this Order to appear on the label of the container of the medicine may be divided between the ampoule and the connecting strip.')
,(1010020000, ' (b) Whether or not the seal is broken when an ampoule is detached from the strip, the following information must appear on the label of each ampoule: (i) the name of the medicine; and (ii) the name(s) of all the active ingredients in the medicine; and (iii) the quantity or proportion of all active ingredients in the medicine; and (iv) the batch number of the goods preceded by the batch number prefix; and (v) the expiry date of the goods preceded by the expiry date prefix; and (vi) the approved route(s) of administration followed by the word ‘only’ and/or warnings against use by other routes of administration.')
,(1011000000, ' (11) Composite packs')
,(1011010000, ' (a) The expiry date on the package that, together with medicines, constitutes a composite pack must be the earliest of the expiry dates of the medicines that constitute the composite pack.')
,(1011020000, ' (b) The storage conditions on the package that, together with medicines, constitutes a composite pack must be the most restrictive of the storage conditions of the medicines that constitute the composite pack. Note: The label on the container and primary pack (if any) of each medicine comprising a composite pack must comply with this Order.');

--section 11;
INSERT INTO regs (id, reg_description) VALUES (1100000000, ' 11 How information is to be expressed')
,(1101000000, ' (1) Use of appropriate metric units')
,(1101010000, ' (a) For active ingredient(s), where a particular is a statement of mass for which there is a metric unit of measurement, the metric units must be expressed as follows: (i) a statement of quantity for 1 microgram up to 999 micrograms inclusive must be expressed in terms of micrograms; (ii) a statement of quantity for 1000 micrograms may be expressed as either 1000 micrograms or 1 milligram; (iii) a statement of quantity for more than 1 milligram up to 999 milligrams inclusive must be expressed in terms of milligrams; (iv) a statement of quantity for 1000 milligrams may be expressed as either 1000 milligrams or 1 gram; and (v) a statement of quantity for more than 1 gram up to 999 grams inclusive must be expressed as grams.')
,(1101020000, " (b) Where a range of medicines contains the same active ingredient(s) in the same dosage form in a series of strengths then the label must state the quantity of each active ingredient in terms of either the highest or lowest metric unit of measurement in the series of strengths. Example: A range of expressions for active ingredient may be stated as 0.5 milligram, 1 milligram and 5 milligrams, or 500 micrograms, 1000 micrograms and 5000 micrograms, but not 500 micrograms, 1 milligram and 5 milligrams. Note: The abbreviations ‘mg’ and ‘g’ can be used on all labels but ‘microgram’ should be used in full unless the medicine is in a small container. Then the abbreviation ‘ g’ may be used.")
,(1101030000, " (c) Where the active ingredient is in liquid form, the equivalent metric units of volume must be expressed in the same manner. Example: A statement of volume for more than 1 millilitre up to 999 millilitres inclusive must be expressed in terms of millilitres, but a statement of volume for 1000 millilitres may be expressed as either 1000 millilitres or 1 litre. Note: The abbreviations mL and L can be used on all labels, but \'microlitre\' should be used in full unless the container is a small container. Then the abbreviation \' L\' may be used.")
,(1101040000, ' (d) Where the information is a statement of mass or volume, the unit of measurement must be consistent with the unit of measurement used in any warning statement required for that ingredient.')
,(1101050000, ' (e) Where a statement of quantity is expressed as less than one (1) unit, the statement of quantity must include the leading zero.')
,(1102000000, ' (2) Expression of quantity or proportion of active ingredients Subject to paragraph 11(2)(i) and subsection 11(3) below, the quantity or proportion of an active ingredient to be included on a label must be expressed:')
,(1102010000, ' (a) for a discrete dosage unit - as the quantity of the active ingredient in the dosage unit;')
,(1102020000, ' (b) for a solid for ingestion, where there is no discrete dosage unit - as the quantity of the active ingredient contained in the stated weight of a suitable dose of the solid;')
,(1102030000, ' (c) subject to paragraph (d) below, if the medicine is a liquid for ingestion: (i) as the quantity of the active ingredient contained in the stated volume of a suitable dose of the liquid; or (ii) in the case where the liquid for ingestion is one of a series of strengths containing the same active ingredient – as the quantity of the active ingredient contained in the stated volume of a suitable dose of the liquid with the quantity or proportion of active ingredient expressed consistently across the series in terms of the same stated dose volume. Example: Where the dose volume is 5 mL, and there are strengths of 1 mg/mL and 5 mg/mL, these must be labelled as 5 mg in 5 mL and 25 mg in 5 mL, respectively.')
,(1102040000, ' (d) for a medicine required to be prepared before use, and: (i) where the process results in a medicine that is a liquid for ingestion: (A) as the quantity of the active ingredient contained in the stated volume of a suitable dose of the liquid after preparation in accordance with the instructions set out on the label of the medicine; or (B) in the case where the medicine is one of a series of strengths containing the same active ingredient - as the quantity of the active ingredient contained in the stated volume of a suitable dose of the liquid after preparation in accordance with the instructions set out on the label of the medicine with the quantity or proportion of active ingredient expressed consistently across the series in terms of the same stated dose volume; and Example: Where the dose volume is 5 mL after preparation, and there are strengths of 1 mg/mL and 5 mg/mL, these must be labelled as 5 mg in 5 mL and 25 mg in 5 mL, respectively. (ii) for any other medicines - as the weight or volume of active ingredient in a stated weight or volume of the medicine, after preparation in accordance with the instructions included in the label of the medicine;')
,(1102050000, ' (e) for a transdermal patch, as the total quantity of the active ingredient in each patch and the quantity of the active ingredient released in a stated time;')
,(1102060000, ' (f) for pressurised metered dose inhalers, dry powder inhalers and other metered dose products such as nasal sprays, the quantity of the active ingredient is: (i) the quantity delivered per actuation; or where the Secretary, when registering the medicine, has accepted that the dose of products containing those active ingredients was clinically established as the metered dose, then: (ii) the quantity metered per actuation;')
,(1102070000, ' (g) for preparations applied to the skin and mucous membranes, other than those covered by paragraph (f) - as a percentage expressed in terms of w/w, w/v, v/v or v/w, as appropriate, or as the weight or volume in a stated weight or volume of the medicine, as appropriate;')
,(1102080000, ' (h) for the purposes of paragraphs 11(2)(a) – 11(2)(d), for oral preparations that contain active ingredients intended for mineral supplementation, it is sufficient that the quantity or proportion of that active ingredient to be included on a label be expressed as: (i) the name of the active ingredient; and (ii) the name and quantity of the element intended for mineral supplementation.')
,(1102090000, " (i) In addition to the requirements of paragraphs 11(2)(a) –11(2)(g), the following requirements apply in the circumstances specified in the following subparagraphs: (i) where the active ingredient is a herbal material, such as a dry, fresh, milled or powdered herb, as the weight of the herbal material; except where standardisation is claimed on the label, then the minimum dry or fresh weight of herbal material and also the quantity of standardised constituents(s) in the herbal material; (ii) where the active ingredient is a herbal preparation, as the dry or fresh weight of the herbal material from which the preparation was derived except: (A) where standardisation of the herbal preparation is claimed on the label, then, the minimum dry or fresh weight of herbal material from which the preparation is derived and the quantity of standardised constituents(s) in the herbal preparation; or (B) where the active ingredient is a herbal preparation that is an essential oil; (iii) where the active ingredient is an enzyme –the activity unit as specified in Column 1 of Schedule 3 to this Order in relation to a particular enzyme set out in Column 3 of that Schedule; (iv) for preparations containing Vitamin A or a derivative of Vitamin A - as the quantity or proportion of Vitamin A expressed in terms of microgram retinol equivalents; (v) for preparations containing biological organisms - as the number of organisms present per metric unit for liquids and powders and as the number of organisms present per dosage unit for other dosage forms;")
,(1102100000, " (j) for any other medicines: (i) where the medicine is a liquid and includes an active ingredient which is a liquid - as the appropriate amount of the active ingredient, either by weight or volume, in a stated volume of the medicine; (ii) where the medicine is a liquid and includes an active ingredient which is a solid - as the weight of active ingredient in a stated volume of the medicine; (iii) where the medicine is a liquid and includes an active ingredient which is a gas - as the weight of the active ingredient in a stated volume of the medicine; (iv) where the medicine is a solid or semi-solid and includes an active ingredient which is a liquid - as the appropriate amount of the active ingredient, either by weight or volume, in a stated weight of the medicine; (v) where the medicine is a solid or semi-solid and includes an active ingredient which is a solid - as the weight of the active ingredient in a stated weight of the medicine.")
,(1103000000, ' (3) Expression of quantity or proportion of active ingredients for homoeopathic preparations The label on the container and on the primary pack of a medicine that contains a homoeopathic preparation must include:')
,(1103010000, ' (a) where the medicine is a fully potentised, single ingredient, homoeopathic medicine and it is clear that the ingredient comprises 100% of the medicine – the name of the active ingredient; or')
,(1103020000, " (b) where all active ingredients of the medicine are homoeopathic preparations and are all included in the medicine in the same proportion - as ‘Contains equal parts of ...’ followed by the name of each active ingredient; or")
,(1103030000, ' (c) where paragraphs (a) and (b) do not apply- the quantity of the preparation in one millilitre or in one gram of the medicine')
,(1104000000, " (4) Permitted statements of storage temperature conditions For the purposes of this Order, the following statements of storage temperature conditions are permitted: (i) ‘Store below –18oC (Deep freeze)’; (ii) ‘Store below –5oC (Freeze)’; (iii) ‘Store at 2oC to 8oC (Refrigerate. Do not freeze)’; (iv) ‘Store below 25oC’; (v) ‘Store below 30oC’; (vi) for a medicine that is, or is intended to be, registered goods, any other storage temperature conditions as specified in the approved product details in relation to the medicine.")
,(1105000000, " (5) Inclusion of common names of vitamins Where a medicine contains an active ingredient that is a vitamin, then the word ‘vitamin’, or any suitable unambiguous abbreviation of the word vitamin, together with the common name of that vitamin, may appear on a main label of the medicine either:")
,(1105010000, ' (a) on the same line of text - between the approved name of the active ingredient that is a vitamin and the quantity of that active ingredient; or')
,(1105020000, ' (b) on a separate line of text - immediately below the related name of the active ingredient that is a vitamin and the quantity of that active ingredient.');

--INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES --(0, 700000000, 1),
--(0, 800000000, 1),
--(0, 900000000, 1),
--(0, 1000000000, 1),
--(0, 1100000000, 1);

 --heirarchical relations 
INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(100000000, 100000001, 1),
(100000000, 100000002, 1),
(100000000, 100000003, 1),
(100000000, 100000004, 1),
(100000000, 100000005, 1);

INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(101000000, 101000001, 1),
(101000000, 101000002, 1),
(101000000, 101000003, 1),
(101000000, 101000004, 1),
(101000000, 101000005, 1),
(101000000, 101000006, 1),
(101000000, 101000007, 1),
(101000000, 101000008, 1);

INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(300000000, 301000000, 1),
(300000000, 302000000, 1),
(302000000, 302010000, 1),
(302000000, 302020000, 1);

INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(400000000, 401000000, 1),
(401000000, 401010000, 1),
(401000000, 401020000, 1),
(401020000, 401020010, 1),
(401020000, 401020020, 1),
(400000000, 402000000, 1),
(400000000, 403000000, 1);

INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(500000000, 501000000, 1),
(501000000, 501010000, 1),
(501000000, 501020000, 1),
(501000000, 501030000, 1),
(501000000, 501031000, 1),
(501000000, 501040000, 1),
(501000000, 501050000, 1),
(501000000, 501060000, 1),
(501000000, 501070000, 1),
(501000000, 501080000, 1),
(501000000, 501090000, 1),
(501000000, 501100000, 1),
(501000000, 501110000, 1),
(501000000, 501120000, 1),
(501000000, 501130000, 1),
(501000000, 501140000, 1),
(501000000, 501150000, 1),
(501000000, 501160000, 1),
(501000000, 501170000, 1),
(500000000, 502000000, 1);

INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(600000000, 601010000, 1),
(600000000, 601020000, 1),
(600000000, 601030000, 1),
(600000000, 601040000, 1),
(600000000, 601050000, 1),
(600000000, 601060000, 1),
(600000000, 601070000, 1),
(600000000, 601080000, 1),
(600000000, 601090000, 1),
(600000000, 601100000, 1),
(600000000, 601110000, 1),
(600000000, 601120000, 1),
(600000000, 601130000, 1),
(600000000, 601140000, 1),
(600000000, 601150000, 1),
(600000000, 601160000, 1),
(600000000, 601170000, 1),
(600000000, 601180000, 1),
(600000000, 601190000, 1),
(600000000, 601200000, 1),
(600000000, 601210000, 1),
(600000000, 601220000, 1),
(600000000, 601230000, 1),
(600000000, 601240000, 1),
(600000000, 601250000, 1),
(600000000, 601260000, 1),
(600000000, 601270000, 1),
(600000000, 601280000, 1),
(600000000, 601290000, 1),
(600000000, 601300000, 1),
(600000000, 601310000, 1),
(600000000, 601330000, 1),
(600000000, 601340000, 1),
(600000000, 601350000, 1),
(600000000, 601360000, 1),
(600000000, 601370000, 1),
(600000000, 601380000, 1),
(600000000, 601390000, 1),
(600000000, 601400000, 1),
(600000000, 601410000, 1),
(600000000, 601420000, 1),
(600000000, 601430000, 1),
(601430000, 601430100, 1),
(601430100, 601430101, 1),
(601430100, 601430102, 1),
(601430100, 601430103, 1),
(601430100, 601430104, 1),
(601430100, 601430105, 1),
(601430100, 601430106, 1),
(601430100, 601430107, 1),
(601430100, 601430108, 1),
(601430000, 601430200, 1),
(601430200, 601430201, 1),
(601430200, 601430202, 1),
(600000000, 601440000, 1),
(600000000, 601450000, 1),
(600000000, 601460000, 1),
(601460000, 601460001, 1),
(601460000, 601460002, 1),
(601460000, 601460003, 1),
(601460000, 601460004, 1),
(600000000, 601470000, 1),
(600000000, 601480000, 1),
(600000000, 601490000, 1),
(600000000, 601500000, 1),
(600000000, 601510000, 1),
(600000000, 601520000, 1),
(600000000, 601530000, 1),
(600000000, 601540000, 1),
(600000000, 601550000, 1),
(600000000, 601560000, 1),
(600000000, 601570000, 1),
(600000000, 601580000, 1),
(600000000, 601590000, 1),
(600000000, 601600000, 1),
(601600000, 601600001, 1),
(601600000, 601600002, 1),
(601600000, 601600003, 1),
(601600000, 601600004, 1),
(601600000, 601600005, 1);

 --heirarchical relations 
INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(700000000, 701000000, 1),
(700000000, 702000000, 1),
(702000000, 702010000, 1),
(702000000, 702020000, 1),
(702000000, 702030000, 1),
(702000000, 702040000, 1),
(702000000, 702050000, 1),
(702000000, 702060000, 1),
(800000000, 801000000, 1),
(801000000, 801010000, 1),
(801000000, 801020000, 1),
(801000000, 801030000, 1),
(801000000, 801040000, 1),
(801000000, 801050000, 1),
(801000000, 801060000, 1),
(801000000, 801070000, 1),
(801000000, 801080000, 1),
(801000000, 801090000, 1),
(801000000, 801100000, 1),
(801000000, 801110000, 1),
(801000000, 801120000, 1),
(801000000, 801130000, 1),
(801000000, 801140000, 1),
(801000000, 801150000, 1),
(800000000, 802000000, 1),
(802000000, 802010000, 1),
(802000000, 802020000, 1),
(802000000, 802030000, 1),
(802000000, 802040000, 1),
(802000000, 802050000, 1),
(802000000, 802060000, 1),
(800000000, 803000000, 1),
(803000000, 803010000, 1),
(800000000, 804000000, 1),
(804000000, 804010000, 1),
(804000000, 804020000, 1),
(804000000, 804030000, 1),
(804000000, 804040000, 1),
(804000000, 804050000, 1),
(804000000, 804060000, 1),
(800000000, 805000000, 1),
(900000000, 901000000, 1),
(901000000, 901010000, 1),
(901000000, 901020000, 1),
(901000000, 901030000, 1),
(901000000, 901040000, 1),
(901000000, 901050000, 1),
(901000000, 901060000, 1),
(900000000, 902000000, 1),
(900000000, 903000000, 1),
(903000000, 903010000, 1),
(903000000, 903020000, 1),
(903000000, 903030000, 1),
(900000000, 904000000, 1),
(900000000, 905000000, 1),
(905000000, 905010000, 1),
(905000000, 905020000, 1),
(905000000, 905030000, 1),
(900000000, 906000000, 1),
(906000000, 906010000, 1),
(906000000, 906020000, 1),
(900000000, 907000000, 1),
(907000000, 907010000, 1),
(907000000, 907020000, 1),
(907000000, 907030000, 1),
(907000000, 907040000, 1),
(900000000, 908000000, 1),
(908000000, 908010000, 1),
(908000000, 908020000, 1),
(908000000, 908030000, 1),
(908000000, 908040000, 1),
(900000000, 909000000, 1),
(900000000, 910000000, 1),
(910000000, 910010000, 1),
(910000000, 910020000, 1),
(910000000, 910030000, 1),
(900000000, 911000000, 1),
(900000000, 912000000, 1),
(900000000, 913000000, 1),
(900000000, 914000000, 1),
(1000000000, 1001000000, 1),
(1001000000, 1001010000, 1),
(1001000000, 1001020000, 1),
(1001000000, 1001030000, 1),
(1001000000, 1001040000, 1),
(1001000000, 1001050000, 1),
(1000000000, 1002000000, 1),
(1000000000, 1003000000, 1),
(1000000000, 1004000000, 1),
(1004000000, 1004010000, 1),
(1004000000, 1004020000, 1),
(1000000000, 1005000000, 1),
(1005000000, 1005010000, 1),
(1005000000, 1005020000, 1),
(1000000000, 1006000000, 1),
(1006000000, 1006010000, 1),
(1006000000, 1006020000, 1),
(1006000000, 1006030000, 1),
(1006000000, 1006040000, 1),
(1006000000, 1006050000, 1),
(1006000000, 1006060000, 1),
(1006000000, 1006070000, 1),
(1006000000, 1006080000, 1),
(1006000000, 1006090000, 1),
(1006000000, 1006100000, 1),
(1000000000, 1007000000, 1),
(1007000000, 1007010000, 1),
(1007000000, 1007020000, 1),
(1007000000, 1007030000, 1),
(1007000000, 1007040000, 1),
(1007000000, 1007050000, 1),
(1007000000, 1007060000, 1),
(1007000000, 1007070000, 1),
(1007000000, 1007080000, 1),
(1007000000, 1007090000, 1),
(1007000000, 1007100000, 1),
(1007000000, 1007110000, 1),
(1007000000, 1007120000, 1),
(1007000000, 1007130000, 1),
(1000000000, 1008000000, 1),
(1008000000, 1008010000, 1),
(1008000000, 1008020000, 1),
(1008000000, 1008030000, 1),
(1000000000, 1009000000, 1),
(1009000000, 1009010000, 1),
(1009000000, 1009020000, 1),
(1009000000, 1009030000, 1),
(1000000000, 1010000000, 1),
(1010000000, 1010010000, 1),
(1010000000, 1010020000, 1),
(1000000000, 1011000000, 1),
(1011000000, 1011010000, 1),
(1011000000, 1011020000, 1),
(1100000000, 1101000000, 1),
(1101000000, 1101010000, 1),
(1101000000, 1101020000, 1),
(1101000000, 1101030000, 1),
(1101000000, 1101040000, 1),
(1101000000, 1101050000, 1),
(1100000000, 1102000000, 1),
(1102000000, 1102010000, 1),
(1102000000, 1102020000, 1),
(1102000000, 1102030000, 1),
(1102000000, 1102040000, 1),
(1102000000, 1102050000, 1),
(1102000000, 1102060000, 1),
(1102000000, 1102070000, 1),
(1102000000, 1102080000, 1),
(1102000000, 1102090000, 1),
(1102000000, 1102100000, 1),
(1100000000, 1103000000, 1),
(1103000000, 1103010000, 1),
(1103000000, 1103020000, 1),
(1103000000, 1103030000, 1),
(1100000000, 1104000000, 1),
(1100000000, 1105000000, 1),
(1105000000, 1105010000, 1),
(1105000000, 1105020000, 1);
  --referential relations MANUAL :( 
INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(801000000, 802000000, 4), -- conditioned_on
(801000000, 803000000, 4), -- conditioned_on
(801000000, 900000000, 4), -- conditioned_on
(801000000, 1000000000, 4), -- conditioned_on
(802010000, 802020000, 4), -- conditioned_on
(802010000, 802030000, 4), -- conditioned_on
(802010000, 802040000, 4), -- conditioned_on
(802030000, 802020000, 7), -- conditions
(802040000, 802020000, 7), -- conditions
(802050000, 802020000, 7), -- refers
(802050000, 802030000, 3), -- refers ?
(802050000, 802040000, 3), -- refers ? 
(802060000, 802030000, 3), -- conditions
(802060000, 802040000, 3), -- conditions
(802060000, 802050000, 3), -- conditions
(803010000, 802000000, 5), -- conditions
(805000000, 801000000, 7), -- conditions
(901000000, 1000000000, 4), -- conditioned_on

(903020000, 1102080000, 3), -- conditioned_on
(903020000, 1102090000, 3),
(903020000, 1105000000, 3),
(903030000, 903010000, 7),
(905020000, 1105000000, 3),
(905020000, 1102090000, 7),
(905030000, 802000000, 3),
(905030000, 901020000, 5),
(905030000, 901030000, 5),
(907000000, 909000000, 4),
(907020000, 802000000, 3),
(907030000, 802000000, 3),
(907030000, 901020000, 5),
(907030000, 901030000, 5),
(907040000, 802000000, 3),
(908030000, 906020000, 3),
(908030000, 907000000, 3),
(908040000, 906020000, 3),
(908040000, 907000000, 3),
(910000000, 909000000, 5),
(910020000, 911000000, 3),
(910030000, 913000000, 3),
(1001000000, 800000000, 8),
(1001000000, 900000000, 8),
(1001000000, 1007000000, 9),
(1002000000, 800000000, 8),
(1002000000, 900000000, 8),
(1003000000, 800000000, 8),
(1003000000, 900000000, 8),
(1004000000, 800000000, 8),
(1004000000, 900000000, 8),
(1005000000, 800000000, 7),
(1005000000, 900000000, 7),
(1007020000, 800000000, 9),
(1007000000, 900000000, 9),
(1007000000, 1001000000, 9),
(1008010000, 1008020000, 4),
(1008020000, 800000000, 7),
(1008020000, 900000000, 7),
(1008030000, 800000000, 7),
(1008030000, 900000000, 7),
(1009010000, 1009020000, 4),
(1009010000, 800000000, 3),
(1009010000, 900000000, 3),
(1009020000, 1009010000, 3),
(1009020000, 800000000, 7),
(1009020000, 900000000, 7),
(1009030000, 1009010000, 8),
(1009030000, 1009020000, 8),
(1010010000, 1010020000, 4),
(1102000000, 1102090000, 4),
(1102000000, 1103000000, 4),
(1102030000, 1102040000, 4),
(1102070000, 1102060000, 3),
(1102080000, 1102010000, 7),
(1102080000, 1102020000, 7),
(1102080000, 1102030000, 7),
(1102080000, 1102040000, 7),
(1102090000, 1102010000, 8),
(1102090000, 1102020000, 8),
(1102090000, 1102030000, 8),
(1102090000, 1102040000, 8),
(1102090000, 1102050000, 8),
(1102090000, 1102060000, 8),
(1102090000, 1102070000, 8),
(1103030000, 1103010000, 9),
(1103030000, 1103020000, 9);

INSERT INTO reg_relation(from_id, to_id, rel_type_id) VALUES 
(301000000, 400000000, 3), 
(301000000, 500000000, 3), 
(302020000, 500000000, 3), 
(403000000, 401000000, 3), 
(403000000, 402000000, 3), 
(601150000, 801020000, 3), 
(601150000, 801030000, 3), 
(601150000, 801100000, 3), 
(601150000, 801110000, 3), 
(601150000, 801120000, 3), 
(601150000, 801140000, 3);