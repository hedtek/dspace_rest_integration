-- The contents of this file are subject to the license and copyright
-- detailed in the LICENSE and NOTICE files at the root of the source
-- tree and available online at
--
-- http://www.dspace.org/license/

--
--  DSpace database cleaner
--
--    This SQL "cleans" a database used by a DSpace installation.  It removes
--    all tables etc. so the database is completely empty and ready for a
--    fresh installation.  Of course, this means all data is lost.
--
--    This should be kept in sync if database_schema.sql is updated.


-- Drop the views
DROP VIEW CommunityItemsBySubject;
DROP VIEW CollectionItemsBySubject;
DROP VIEW CommunityItemsByDateAccession;
DROP VIEW CollectionItemsByDateAccession;
DROP VIEW CommunityItemsByDate;
DROP VIEW CollectionItemsByDate;
DROP VIEW CommunityItemsByTitle;
DROP VIEW CollectionItemsByTitle;
DROP VIEW CommunityItemsByAuthor;
DROP VIEW CollectionItemsByAuthor;
DROP VIEW Community2Item;
DROP VIEW DCValue;

-- Then the tables
DROP TABLE collection_item_count;
DROP TABLE community_item_count;
DROP TABLE checksum_history;
DROP TABLE most_recent_checksum;
DROP TABLE checksum_results;
DROP TABLE ItemsBySubject;
DROP TABLE ItemsByDateAccessioned;
DROP TABLE ItemsByDate;
DROP TABLE ItemsByTitle;
DROP TABLE ItemsByAuthor;
DROP TABLE Communities2Item;
DROP TABLE EPersonGroup2WorkspaceItem;
DROP TABLE HistoryState;
DROP TABLE History;
DROP TABLE Subscription;
DROP TABLE RegistrationData;
DROP TABLE TasklistItem;
DROP TABLE WorkflowItem;
DROP TABLE WorkspaceItem;
DROP TABLE Handle;
DROP TABLE EPersonGroup2EPerson;
DROP TABLE ResourcePolicy;
DROP TABLE Collection2Item;
DROP TABLE Community2Collection;
DROP TABLE Community2Community;
DROP TABLE Collection;
DROP TABLE Community;
DROP TABLE MetadataValue;
DROP TABLE MetadataFieldRegistry;
DROP TABLE MetadataSchemaRegistry;
DROP TABLE Bundle2Bitstream;
DROP TABLE Item2Bundle;
DROP TABLE Bundle;
DROP TABLE most_recent_checksum;
DROP TABLE checksum_history;
DROP TABLE checksum_results;
DROP TABLE Item;
DROP TABLE Group2GroupCache;
DROP TABLE Group2Group;
DROP TABLE EPersonGroup;
DROP TABLE EPerson;
DROP TABLE Bitstream;
DROP TABLE FileExtension;
DROP TABLE BitstreamFormatRegistry;

-- Now drop the sequences for ID (primary key) creation
DROP SEQUENCE bitstreamformatregistry_seq;
DROP SEQUENCE fileextension_seq;
DROP SEQUENCE bitstream_seq;
DROP SEQUENCE eperson_seq;
DROP SEQUENCE epersongroup_seq;
DROP SEQUENCE item_seq;
DROP SEQUENCE bundle_seq;
DROP SEQUENCE item2bundle_seq;
DROP SEQUENCE bundle2bitstream_seq;
DROP SEQUENCE dctyperegistry_seq;
DROP SEQUENCE dcvalue_seq;
DROP SEQUENCE community_seq;
DROP SEQUENCE community2community_seq;
DROP SEQUENCE collection_seq;
DROP SEQUENCE community2collection_seq;
DROP SEQUENCE collection2item_seq;
DROP SEQUENCE resourcepolicy_seq;
DROP SEQUENCE epersongroup2eperson_seq;
DROP SEQUENCE handle_seq;
DROP SEQUENCE workspaceitem_seq;
DROP SEQUENCE workflowitem_seq;
DROP SEQUENCE tasklistitem_seq;
DROP SEQUENCE registrationdata_seq;
DROP SEQUENCE subscription_seq;
DROP SEQUENCE history_seq;
DROP SEQUENCE historystate_seq;
DROP SEQUENCE communities2item_seq;
DROP SEQUENCE itemsbyauthor_seq;
DROP SEQUENCE itemsbytitle_seq;
DROP SEQUENCE itemsbydate_seq;
DROP SEQUENCE itemsbydateaccessioned_seq;
DROP SEQUENCE itemsbysubject_seq;
DROP SEQUENCE epersongroup2workspaceitem_seq;
DROP SEQUENCE metadataschemaregistry_seq;
DROP SEQUENCE metadatafieldregistry_seq;
DROP SEQUENCE metadatavalue_seq;
DROP SEQUENCE group2group_seq;
DROP SEQUENCE group2groupcache_seq;

-- Drop the getnextid() function
DROP FUNCTION getnextid(VARCHAR(40));
