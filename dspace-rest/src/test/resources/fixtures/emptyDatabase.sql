--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: bi_2_dis_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bi_2_dis_seq', 1, false);


--
-- Name: bi_2_dmap_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bi_2_dmap_seq', 1, false);


--
-- Name: bi_4_dis_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bi_4_dis_seq', 1, false);


--
-- Name: bi_4_dmap_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bi_4_dmap_seq', 1, false);


--
-- Name: bi_item_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bi_item_seq', 1, false);


--
-- Name: bi_withdrawn_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bi_withdrawn_seq', 1, false);


--
-- Name: bitstream_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bitstream_seq', 1, false);


--
-- Name: bitstreamformatregistry_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bitstreamformatregistry_seq', 73, true);


--
-- Name: bundle2bitstream_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bundle2bitstream_seq', 1, false);


--
-- Name: bundle_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('bundle_seq', 1, false);


--
-- Name: checksum_history_check_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('checksum_history_check_id_seq', 1, false);


--
-- Name: collection2item_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('collection2item_seq', 1, false);


--
-- Name: collection_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('collection_seq', 1, false);


--
-- Name: communities2item_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('communities2item_seq', 1, false);


--
-- Name: community2collection_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('community2collection_seq', 1, false);


--
-- Name: community2community_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('community2community_seq', 1, false);


--
-- Name: community_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('community_seq', 1, true);


--
-- Name: dctyperegistry_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('dctyperegistry_seq', 1, false);


--
-- Name: metadatafieldregistry_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('metadatafieldregistry_seq', 71, true);


--
-- Name: metadatavalue_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('metadatavalue_seq', 1, false);


--
-- Name: dcvalue_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('dcvalue_seq', 1, false);


--
-- Name: eperson_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('eperson_seq', 1, true);


--
-- Name: epersongroup2eperson_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('epersongroup2eperson_seq', 1, true);


--
-- Name: epersongroup2workspaceitem_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('epersongroup2workspaceitem_seq', 1, false);


--
-- Name: epersongroup_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('epersongroup_seq', 1, true);


--
-- Name: fileextension_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('fileextension_seq', 89, true);


--
-- Name: group2group_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('group2group_seq', 1, false);


--
-- Name: group2groupcache_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('group2groupcache_seq', 1, false);


--
-- Name: handle_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('handle_seq', 1, true);


--
-- Name: history_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('history_seq', 1, false);


--
-- Name: historystate_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('historystate_seq', 1, false);


--
-- Name: item2bundle_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('item2bundle_seq', 1, false);


--
-- Name: item_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('item_seq', 1, false);


--
-- Name: metadataschemaregistry_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('metadataschemaregistry_seq', 1, true);


--
-- Name: registrationdata_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('registrationdata_seq', 1, false);


--
-- Name: resourcepolicy_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('resourcepolicy_seq', 1, true);


--
-- Name: subscription_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('subscription_seq', 1, false);


--
-- Name: tasklistitem_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('tasklistitem_seq', 1, false);


--
-- Name: workflowitem_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('workflowitem_seq', 1, false);


--
-- Name: workspaceitem_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('workspaceitem_seq', 1, false);


--
-- Data for Name: bi_2_dis; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bi_2_dis (id, value, sort_value) FROM stdin;
\.


--
-- Data for Name: eperson; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY eperson (eperson_id, email, password, firstname, lastname, can_log_in, require_certificate, self_registered, last_active, sub_frequency, phone, netid, language) FROM stdin;
1	dspace@example.com	d2a147310ed200c73a5978baebf60e19	dspace	dspace	t	f	f	\N	\N	\N	\N	en
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY item (item_id, submitter_id, in_archive, withdrawn, last_modified, owning_collection) FROM stdin;
\.


--
-- Data for Name: bi_2_dmap; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bi_2_dmap (map_id, item_id, distinct_id) FROM stdin;
\.


--
-- Data for Name: bi_4_dis; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bi_4_dis (id, value, sort_value) FROM stdin;
\.


--
-- Data for Name: bi_4_dmap; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bi_4_dmap (map_id, item_id, distinct_id) FROM stdin;
\.


--
-- Data for Name: bi_item; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bi_item (id, item_id, sort_3, sort_1, sort_2) FROM stdin;
\.


--
-- Data for Name: bi_withdrawn; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bi_withdrawn (id, item_id, sort_3, sort_1, sort_2) FROM stdin;
\.


--
-- Data for Name: bitstreamformatregistry; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bitstreamformatregistry (bitstream_format_id, mimetype, short_description, description, support_level, internal) FROM stdin;
1	application/octet-stream	Unknown	Unknown data format	0	f
2	text/plain; charset=utf-8	License	Item-specific license agreed upon to submission	1	t
3	application/pdf	Adobe PDF	Adobe Portable Document Format	1	f
4	text/xml	XML	Extensible Markup Language	1	f
5	text/plain	Text	Plain Text	1	f
6	text/html	HTML	Hypertext Markup Language	1	f
7	text/css	CSS	Cascading Style Sheets	1	f
8	application/msword	Microsoft Word	Microsoft Word	1	f
9	application/vnd.openxmlformats-officedocument.wordprocessingml.document	Microsoft Word XML	Microsoft Word XML	1	f
10	application/vnd.ms-powerpoint	Microsoft Powerpoint	Microsoft Powerpoint	1	f
11	application/vnd.openxmlformats-officedocument.presentationml.presentation	Microsoft Powerpoint XML	Microsoft Powerpoint XML	1	f
12	application/vnd.ms-excel	Microsoft Excel	Microsoft Excel	1	f
13	application/vnd.openxmlformats-officedocument.spreadsheetml.sheet	Microsoft Excel XML	Microsoft Excel XML	1	f
14	application/marc	MARC	Machine-Readable Cataloging records	1	f
15	image/jpeg	JPEG	Joint Photographic Experts Group/JPEG File Interchange Format (JFIF)	1	f
16	image/gif	GIF	Graphics Interchange Format	1	f
17	image/png	image/png	Portable Network Graphics	1	f
18	image/tiff	TIFF	Tag Image File Format	1	f
19	audio/x-aiff	AIFF	Audio Interchange File Format	1	f
20	audio/basic	audio/basic	Basic Audio	1	f
21	audio/x-wav	WAV	Broadcase Wave Format	1	f
22	video/mpeg	MPEG	Moving Picture Experts Group	1	f
23	text/richtext	RTF	Rich Text Format	1	f
24	application/vnd.visio	Microsoft Visio	Microsoft Visio	1	f
25	application/x-filemaker	FMP3	Filemaker Pro	1	f
26	image/x-ms-bmp	BMP	Microsoft Windows bitmap	1	f
27	application/x-photoshop	Photoshop	Photoshop	1	f
28	application/postscript	Postscript	Postscript Files	1	f
29	video/quicktime	Video Quicktime	Video Quicktime	1	f
30	audio/x-mpeg	MPEG Audio	MPEG Audio	1	f
31	application/vnd.ms-project	Microsoft Project	Microsoft Project	1	f
32	application/mathematica	Mathematica	Mathematica Notebook	1	f
33	application/x-latex	LateX	LaTeX document	1	f
34	application/x-tex	TeX	Tex/LateX document	1	f
35	application/x-dvi	TeX dvi	TeX dvi format	1	f
36	application/sgml	SGML	SGML application (RFC 1874)	1	f
37	application/wordperfect5.1	WordPerfect	WordPerfect 5.1 document	1	f
38	audio/x-pn-realaudio	RealAudio	RealAudio file	1	f
39	image/x-photo-cd	Photo CD	Kodak Photo CD image	1	f
40	application/vnd.oasis.opendocument.text	OpenDocument Text	OpenDocument Text	1	f
41	application/vnd.oasis.opendocument.text-template	OpenDocument Text Template	OpenDocument Text Template	1	f
42	application/vnd.oasis.opendocument.text-web	OpenDocument HTML Template	OpenDocument HTML Template	1	f
43	application/vnd.oasis.opendocument.text-master	OpenDocument Master Document	OpenDocument Master Document	1	f
44	application/vnd.oasis.opendocument.graphics	OpenDocument Drawing	OpenDocument Drawing	1	f
45	application/vnd.oasis.opendocument.graphics-template	OpenDocument Drawing Template	OpenDocument Drawing Template	1	f
46	application/vnd.oasis.opendocument.presentation	OpenDocument Presentation	OpenDocument Presentation	1	f
47	application/vnd.oasis.opendocument.presentation-template	OpenDocument Presentation Template	OpenDocument Presentation Template	1	f
48	application/vnd.oasis.opendocument.spreadsheet	OpenDocument Spreadsheet	OpenDocument Spreadsheet	1	f
49	application/vnd.oasis.opendocument.spreadsheet-template	OpenDocument Spreadsheet Template	OpenDocument Spreadsheet Template	1	f
50	application/vnd.oasis.opendocument.chart	OpenDocument Chart	OpenDocument Chart	1	f
51	application/vnd.oasis.opendocument.formula	OpenDocument Formula	OpenDocument Formula	1	f
52	application/vnd.oasis.opendocument.database	OpenDocument Database	OpenDocument Database	1	f
53	application/vnd.oasis.opendocument.image	OpenDocument Image	OpenDocument Image	1	f
54	application/vnd.openofficeorg.extension	OpenOffice.org extension	OpenOffice.org extension (since OOo 2.1)	1	f
55	application/vnd.sun.xml.writer	Writer 6.0 documents	Writer 6.0 documents	1	f
56	application/vnd.sun.xml.writer.template	Writer 6.0 templates	Writer 6.0 templates	1	f
57	application/vnd.sun.xml.calc	Calc 6.0 spreadsheets	Calc 6.0 spreadsheets	1	f
58	application/vnd.sun.xml.calc.template	Calc 6.0 templates	Calc 6.0 templates	1	f
59	application/vnd.sun.xml.draw	Draw 6.0 documents	Draw 6.0 documents	1	f
60	application/vnd.sun.xml.draw.template	Draw 6.0 templates	Draw 6.0 templates	1	f
61	application/vnd.sun.xml.impress	Impress 6.0 presentations	Impress 6.0 presentations	1	f
62	application/vnd.sun.xml.impress.template	Impress 6.0 templates	Impress 6.0 templates	1	f
63	application/vnd.sun.xml.writer.global	Writer 6.0 global documents	Writer 6.0 global documents	1	f
64	application/vnd.sun.xml.math	Math 6.0 documents	Math 6.0 documents	1	f
65	application/vnd.stardivision.writer	StarWriter 5.x documents	StarWriter 5.x documents	1	f
66	application/vnd.stardivision.writer-global	StarWriter 5.x global documents	StarWriter 5.x global documents	1	f
67	application/vnd.stardivision.calc	StarCalc 5.x spreadsheets	StarCalc 5.x spreadsheets	1	f
68	application/vnd.stardivision.draw	StarDraw 5.x documents	StarDraw 5.x documents	1	f
69	application/vnd.stardivision.impress	StarImpress 5.x presentations	StarImpress 5.x presentations	1	f
70	application/vnd.stardivision.impress-packed	StarImpress Packed 5.x files	StarImpress Packed 5.x files	1	f
71	application/vnd.stardivision.math	StarMath 5.x documents	StarMath 5.x documents	1	f
72	application/vnd.stardivision.chart	StarChart 5.x documents	StarChart 5.x documents	1	f
73	application/vnd.stardivision.mail	StarMail 5.x mail files	StarMail 5.x mail files	1	f
\.


--
-- Data for Name: bitstream; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bitstream (bitstream_id, bitstream_format_id, name, size_bytes, checksum, checksum_algorithm, description, user_format_description, source, internal_id, deleted, store_number, sequence_id) FROM stdin;
\.


--
-- Data for Name: bundle; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bundle (bundle_id, name, primary_bitstream_id) FROM stdin;
\.


--
-- Data for Name: bundle2bitstream; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY bundle2bitstream (id, bundle_id, bitstream_id) FROM stdin;
\.


--
-- Data for Name: checksum_results; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY checksum_results (result_code, result_description) FROM stdin;
INVALID_HISTORY	Install of the cheksum checking code do not consider this history as valid
BITSTREAM_NOT_FOUND	The bitstream could not be found
CHECKSUM_MATCH	Current checksum matched previous checksum
CHECKSUM_NO_MATCH	Current checksum does not match previous checksum
CHECKSUM_PREV_NOT_FOUND	Previous checksum was not found: no comparison possible
BITSTREAM_INFO_NOT_FOUND	Bitstream info not found
CHECKSUM_ALGORITHM_INVALID	Invalid checksum algorithm
BITSTREAM_NOT_PROCESSED	Bitstream marked to_be_processed=false
BITSTREAM_MARKED_DELETED	Bitstream marked deleted in bitstream table
\.


--
-- Data for Name: checksum_history; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY checksum_history (check_id, bitstream_id, process_start_date, process_end_date, checksum_expected, checksum_calculated, result) FROM stdin;
\.


--
-- Data for Name: epersongroup; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY epersongroup (eperson_group_id, name) FROM stdin;
0	Anonymous
1	Administrator
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY collection (collection_id, name, short_description, introductory_text, logo_bitstream_id, template_item_id, provenance_description, license, copyright_text, side_bar_text, workflow_step_1, workflow_step_2, workflow_step_3, submitter, admin) FROM stdin;
\.


--
-- Data for Name: collection2item; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY collection2item (id, collection_id, item_id) FROM stdin;
\.


--
-- Data for Name: collection_item_count; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY collection_item_count (collection_id, count) FROM stdin;
\.


--
-- Data for Name: community; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY community (community_id, name, short_description, introductory_text, logo_bitstream_id, copyright_text, side_bar_text) FROM stdin;
\.


--
-- Data for Name: communities2item; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY communities2item (id, community_id, item_id) FROM stdin;
\.


--
-- Data for Name: community2collection; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY community2collection (id, community_id, collection_id) FROM stdin;
\.


--
-- Data for Name: community2community; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY community2community (id, parent_comm_id, child_comm_id) FROM stdin;
\.


--
-- Data for Name: community_item_count; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY community_item_count (community_id, count) FROM stdin;
\.


--
-- Data for Name: epersongroup2eperson; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY epersongroup2eperson (id, eperson_group_id, eperson_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: workspaceitem; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY workspaceitem (workspace_item_id, item_id, collection_id, multiple_titles, published_before, multiple_files, stage_reached, page_reached) FROM stdin;
\.


--
-- Data for Name: epersongroup2workspaceitem; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY epersongroup2workspaceitem (id, eperson_group_id, workspace_item_id) FROM stdin;
\.


--
-- Data for Name: fileextension; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY fileextension (file_extension_id, bitstream_format_id, extension) FROM stdin;
1	3	pdf
2	4	xml
3	5	txt
4	5	asc
5	6	htm
6	6	html
7	7	css
8	8	doc
9	9	docx
10	10	ppt
11	11	pptx
12	12	xls
13	13	xlsx
14	15	jpeg
15	15	jpg
16	16	gif
17	17	png
18	18	tiff
19	18	tif
20	19	aiff
21	19	aif
22	19	aifc
23	20	au
24	20	snd
25	21	wav
26	22	mpeg
27	22	mpg
28	22	mpe
29	23	rtf
30	24	vsd
31	25	fm
32	26	bmp
33	27	psd
34	27	pdd
35	28	ps
36	28	eps
37	28	ai
38	29	mov
39	29	qt
40	30	mpa
41	30	abs
42	30	mpega
43	31	mpp
44	31	mpx
45	31	mpd
46	32	ma
47	33	latex
48	34	tex
49	35	dvi
50	36	sgm
51	36	sgml
52	37	wpd
53	38	ra
54	38	ram
55	39	pcd
56	40	odt
57	41	ott
58	42	oth
59	43	odm
60	44	odg
61	45	otg
62	46	odp
63	47	otp
64	48	ods
65	49	ots
66	50	odc
67	51	odf
68	52	odb
69	53	odi
70	54	oxt
71	55	sxw
72	56	stw
73	57	sxc
74	58	stc
75	59	sxd
76	60	std
77	61	sxi
78	62	sti
79	63	sxg
80	64	sxm
81	65	sdw
82	66	sgl
83	67	sdc
84	68	sda
85	69	sdd
86	70	sdp
87	71	smf
88	72	sds
89	73	sdm
\.


--
-- Data for Name: group2group; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY group2group (id, parent_id, child_id) FROM stdin;
\.


--
-- Data for Name: group2groupcache; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY group2groupcache (id, parent_id, child_id) FROM stdin;
\.


--
-- Data for Name: handle; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY handle (handle_id, handle, resource_type_id, resource_id) FROM stdin;
1	123456789/1	4	1
\.


--
-- Data for Name: item2bundle; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY item2bundle (id, item_id, bundle_id) FROM stdin;
\.


--
-- Data for Name: metadataschemaregistry; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY metadataschemaregistry (metadata_schema_id, namespace, short_id) FROM stdin;
1	http://dublincore.org/documents/dcmi-terms/	dc
\.


--
-- Data for Name: metadatafieldregistry; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY metadatafieldregistry (metadata_field_id, metadata_schema_id, element, qualifier, scope_note) FROM stdin;
1	1	contributor	\N	A person, organization, or service responsible for the content of the resource.  Catch-all for unspecified contributors.
2	1	contributor	advisor	Use primarily for thesis advisor.
3	1	contributor	author	\N
4	1	contributor	editor	\N
5	1	contributor	illustrator	\N
6	1	contributor	other	\N
7	1	coverage	spatial	Spatial characteristics of content.
8	1	coverage	temporal	Temporal characteristics of content.
9	1	creator	\N	Do not use; only for harvested metadata.
10	1	date	\N	Use qualified form if possible.
11	1	date	accessioned	Date DSpace takes possession of item.
12	1	date	available	Date or date range item became available to the public.
13	1	date	copyright	Date of copyright.
14	1	date	created	Date of creation or manufacture of intellectual content if different from date.issued.
15	1	date	issued	Date of publication or distribution.
16	1	date	submitted	Recommend for theses/dissertations.
17	1	identifier	\N	Catch-all for unambiguous identifiers not defined by\n    qualified form; use identifier.other for a known identifier common\n    to a local collection instead of unqualified form.
18	1	identifier	citation	Human-readable, standard bibliographic citation \n    of non-DSpace format of this item
19	1	identifier	govdoc	A government document number
20	1	identifier	isbn	International Standard Book Number
21	1	identifier	issn	International Standard Serial Number
22	1	identifier	sici	Serial Item and Contribution Identifier
23	1	identifier	ismn	International Standard Music Number
24	1	identifier	other	A known identifier type common to a local collection.
25	1	identifier	uri	Uniform Resource Identifier
26	1	description	\N	Catch-all for any description not defined by qualifiers.
27	1	description	abstract	Abstract or summary.
28	1	description	provenance	The history of custody of the item since its creation, including any changes successive custodians made to it.
29	1	description	sponsorship	Information about sponsoring agencies, individuals, or\n    contractual arrangements for the item.
30	1	description	statementofresponsibility	To preserve statement of responsibility from MARC records.
31	1	description	tableofcontents	A table of contents for a given item.
32	1	description	uri	Uniform Resource Identifier pointing to description of\n    this item.
33	1	format	\N	Catch-all for any format information not defined by qualifiers.
34	1	format	extent	Size or duration.
35	1	format	medium	Physical medium.
36	1	format	mimetype	Registered MIME type identifiers.
37	1	language	\N	Catch-all for non-ISO forms of the language of the\n    item, accommodating harvested values.
38	1	language	iso	Current ISO standard for language of intellectual content, including country codes (e.g. "en_US").
39	1	publisher	\N	Entity responsible for publication, distribution, or imprint.
40	1	relation	\N	Catch-all for references to other related items.
41	1	relation	isformatof	References additional physical form.
42	1	relation	ispartof	References physically or logically containing item.
43	1	relation	ispartofseries	Series name and number within that series, if available.
44	1	relation	haspart	References physically or logically contained item.
45	1	relation	isversionof	References earlier version.
46	1	relation	hasversion	References later version.
47	1	relation	isbasedon	References source.
48	1	relation	isreferencedby	Pointed to by referenced resource.
49	1	relation	requires	Referenced resource is required to support function,\n    delivery, or coherence of item.
50	1	relation	replaces	References preceeding item.
51	1	relation	isreplacedby	References succeeding item.
52	1	relation	uri	References Uniform Resource Identifier for related item.
53	1	rights	\N	Terms governing use and reproduction.
54	1	rights	uri	References terms governing use and reproduction.
55	1	source	\N	Do not use; only for harvested metadata.
56	1	source	uri	Do not use; only for harvested metadata.
57	1	subject	\N	Uncontrolled index term.
58	1	subject	classification	Catch-all for value from local classification system;\n    global classification systems will receive specific qualifier
59	1	subject	ddc	Dewey Decimal Classification Number
60	1	subject	lcc	Library of Congress Classification Number
61	1	subject	lcsh	Library of Congress Subject Headings
62	1	subject	mesh	MEdical Subject Headings
63	1	subject	other	Local controlled vocabulary; global vocabularies will receive specific qualifier.
64	1	title	\N	Title statement/title proper.
65	1	title	alternative	Varying (or substitute) form of title proper appearing in item,\n    e.g. abbreviation or translation
66	1	type	\N	Nature or genre of content.
67	1	date	updated	The last time the item was updated via the SWORD interface
68	1	description	version	The Peer Reviewed status of an item
69	1	identifier	slug	a uri supplied via the sword slug header, as a suggested uri for the item
70	1	language	rfc3066	the rfc3066 form of the language for the item
71	1	rights	holder	The owner of the copyright
\.


--
-- Data for Name: metadatavalue; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY metadatavalue (metadata_value_id, item_id, metadata_field_id, text_value, text_lang, place) FROM stdin;
\.


--
-- Data for Name: most_recent_checksum; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY most_recent_checksum (bitstream_id, to_be_processed, expected_checksum, current_checksum, last_process_start_date, last_process_end_date, checksum_algorithm, matched_prev_checksum, result) FROM stdin;
\.


--
-- Data for Name: registrationdata; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY registrationdata (registrationdata_id, email, token, expires) FROM stdin;
\.


--
-- Data for Name: resourcepolicy; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY resourcepolicy (policy_id, resource_type_id, resource_id, action_id, eperson_id, epersongroup_id, start_date, end_date) FROM stdin;
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY subscription (subscription_id, eperson_id, collection_id) FROM stdin;
\.


--
-- Data for Name: workflowitem; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY workflowitem (workflow_id, item_id, collection_id, state, owner, multiple_titles, published_before, multiple_files) FROM stdin;
\.


--
-- Data for Name: tasklistitem; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY tasklistitem (tasklist_id, eperson_id, workflow_id) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

